with(LinearAlgebra):
with(plots):

Size := 10:

Plane :=
 proc(eqn::equation) 
  local rel,a,b,c,d,r,n,u,v,w,proj,centre,tbl;

  rel := expand(lhs(eqn) - rhs(eqn));
  d := subs(x=0,y=0,z=0,-rel);
  if d < 0 then
   rel := -rel;
   d := -d;
  fi;
  a := coeff(rel,x);
  b := coeff(rel,y);
  c := coeff(rel,z);
  r := sqrt(a^2+b^2+c^2);
  n := simplify(<a/r,b/r,c/r>);
  proj := (m) -> (m - (m.n) * n);
  u := proj(<1,0,0>);
  v := proj(<0,1,0>);
  w := proj(<0,0,1>);
  if evalf(u.u) < evalf(v.v) then u := eval(v); fi;
  if evalf(u.u) < evalf(w.w) then u := eval(w); fi;
  u := simplify(u/(u.u));
  v := simplify(CrossProduct(n,u)); 
  v := simplify(v);
  centre := simplify(n*d/r);
  tbl :=
   table([
    'Type'     = "plane",
    'Centre'   = eval(centre),
    'Base1'    = eval(u),
    'Base2'    = eval(v),
    'Normal'   = eval(n),
    'Distance' = simplify(d/r)
   ]);
  eval(tbl);
 end: 

Line :=
 proc(v)
  local a,b,u,tbl;
  u := convert(v,Vector);
  a := subs(t=0,u);
  b := map(coeff,u,t);
  b := simplify(b/(b.b));
  a := simplify(a - (a.b)*b);
  
  tbl :=
   table([
    'Type'     = "line",
    'Centre'   = eval(a),
    'Base'     = eval(b)
   ]);
  eval(tbl);
 end:

intersection_22 := 
 proc(p1,p2)
  local n1,n2,d1,d2,c,centre,base,tbl;
  n1 := p1['Normal'];
  n2 := p2['Normal'];
  d1 := p1['Distance'];
  d2 := p2['Distance'];
  c := (n1.n2);
  if c^2 = 1 then 
   if d1 = d2 then
    return(eval(p1));
   else
    return(EMPTY);
   fi;
  fi;

  centre := 
   simplify(((d1 - c*d2)*n1 + (d2 - c*d1)*n2)/(1 - c^2));

  base := simplify(CrossProduct(n1,n2)/sqrt(1-c^2));
  tbl :=
   table([
    'Type'     = "line",
    'Centre'   = eval(centre),
    'Base'     = eval(base)
   ]);
  eval(tbl);
 end:

intersection_12 :=
 proc(l,p)
  local a,u,n,d,t;

  a := l['Centre'];
  u := l['Base'];
  n := p['Normal'];
  d := p['Distance'];
  if (u.n) = 0 then
   if (a.n) = d then
    return(eval(l));
   else
    return(EMPTY);
   fi;
  else
   t := (d - (a.n))/(u.n);
   return(simplify(a + t*u));
  fi;
 end:

intersection_11 :=
 proc(l1,l2)
  local a1,a2,u1,u2,c,t;

  a1 := l1['Centre'];
  a2 := l2['Centre'];
  u1 := l1['Base'];
  u2 := l2['Base'];
  c := (u1.u2);

  if c^2 = 1 then
   if convert(a1,list) = convert(a2,list) then
    return(eval(l1));
   else
    return(EMPTY);
   fi;
  else
   if (a1-a2).CrossProduct(u1,u2) = 0 then
    t := ((a1.u2) + (a2.u1) * c)/(1-c^2);
    return(simplify(a2 + t * u2));
   else
    return(EMPTY);
   fi;
  fi;
 end:

intersection_00 :=
 proc(v::{list,Vector},w::{list,Vector})
  if convert(v,list) = convert(w,list) then
   return(v);
  else
   return(EMPTY);
  fi;
 end:

intersection_01 :=
 proc(v::{list,Vector},l)
  local w,x;
  w := convert(v,Vector) - l['Centre'];
  x := convert(CrossProduct(w,l['Base']),list);
  if x = [0,0,0] then
   return(convert(v,Vector));
  else
   return(EMPTY);
  fi;
 end:

intersection_02 :=
 proc(v::{list,Vector},p)
  local w;
  w := convert(v,Vector);
  if (w.p['Normal']) = p['Distance'] then
   return(w);
  else
   return(EMPTY);
  fi;
 end:

intersection := 
 proc()
  local x1,x2;

  if nargs = 1 then
   return(eval(args[1]));
  elif nargs = 2 then
   x1 := args[1];
   x2 := args[2];
   if x1 = EMPTY or x2 = EMPTY then 
    return(EMPTY);
   elif type(x1,{list,Vector}) then
    if type(x2,{list,Vector}) then
     return(intersection_00(x1,x2));
    elif x2['Type'] = "line" then
     return(intersection_01(x1,x2));
    elif x2['Type'] = "plane" then
     return(intersection_02(x1,x2));
    else
     return(EMPTY);
    fi;
   elif x1['Type'] = "line" then
    if type(x2,{list,vector}) then
     return(intersection_01(x2,x1));
    elif x2['Type'] = "line" then
     return(intersection_11(x1,x2));
    elif x2['Type'] = "plane" then
     return(intersection_12(x1,x2));
    else
     return(EMPTY);
    fi;
   elif x1['Type'] = "plane" then
    if type(x2,{list,vector}) then
     return(intersection_02(x2,x1));
    elif x2['Type'] = "line" then
     return(intersection_12(x2,x1));
    elif x2['Type'] = "plane" then
     return(intersection_22(x1,x2));
    else
     return(EMPTY);
    fi;
   fi;
  else
   return(
    intersection(
     intersection(args[1],args[2]),
     args[3..-1]));
  fi;
 end:

DrawStyle := patchnogrid:

draw := 
 proc()
  local obj,pic,pics,p,s,t;
  pics := [];
  for obj in args do
   if type(obj,Vector) then
    pic := PLOT3D(POINTS(convert(obj,list)),COLOR(RGB,0,0,1),SYMBOL(CIRCLE,15));
   elif obj['Type'] = "plane" then
    p := convert(evalm(obj['Centre'] + s*obj['Base1'] + t*obj['Base2']),list);
    pic := plot3d(p,s=-2*Size..2*Size,t=-2*Size..2*Size,grid=[50,50]);
   elif obj['Type'] = "line" then
    p := convert(evalm(obj['Centre'] + s*obj['Base']),list);
    pic := spacecurve(p,s=-2*Size..2*Size,color=red,thickness=2);
   else
    pic := NULL;
   fi;
   pics := [op(pics),pic];
  od:
  display(pics,scaling=constrained,axes=boxed,
          view=[-Size..Size,-Size..Size,-Size..Size],
          style=DrawStyle);
 end: