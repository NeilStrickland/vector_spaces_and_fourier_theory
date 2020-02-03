(defun aimify () 
  (interactive)
  (save-excursion 
    (setq case-fold-search nil)
    (goto-char (point-min))
    (while (search-forward "\\N" nil t)
      (replace-match "\\\\mathbf{N}"))
    (goto-char (point-min))
    (while (search-forward "\\Z" nil t)
      (replace-match "\\\\mathbf{Z}"))
    (goto-char (point-min))
    (while (search-forward "\\Q" nil t)
      (replace-match "\\\\mathbf{Q}"))
    (goto-char (point-min))
    (while (search-forward "\\R" nil t)
      (replace-match "\\\\mathbf{R}"))
    (goto-char (point-min))
    (while (search-forward "\\C" nil t)
      (replace-match "\\\\mathbf{C}"))
    (goto-char (point-min))
    (while (search-forward "\\bsm" nil t)
      (replace-match "\\\\left[\\\\begin{array}{c}"))
    (goto-char (point-min))
    (while (search-forward "\\esm" nil t)
      (replace-match "\\\\end{array}\\\\right]"))
    (goto-char (point-min))
    (while (search-forward "\\bbm" nil t)
      (replace-match "\\\\left[\\\\begin{array}{c}"))
    (goto-char (point-min))
    (while (search-forward "\\ebm" nil t)
      (replace-match "\\\\end{array}\\\\right]"))
    (goto-char (point-min))
    (while (search-forward "align*" nil t)
      (replace-match "eqnarray*"))
    (goto-char (point-min))
    (while (search-forward "\\al" nil t)
      (replace-match "\\\\alpha"))
    (goto-char (point-min))
    (while (search-forward "\\bt" nil t)
      (replace-match "\\\\beta"))
    (goto-char (point-min))
    (while (search-forward "\\gm" nil t)
      (replace-match "\\\\gamma"))
    (goto-char (point-min))
    (while (search-forward "\\dl" nil t)
      (replace-match "\\\\delta"))
    (goto-char (point-min))
    (while (search-forward "\\ep" nil t)
      (replace-match "\\\\epsilon"))
    (goto-char (point-min))
    (while (search-forward "\\zt" nil t)
      (replace-match "\\\\zeta"))
    (goto-char (point-min))
    (while (search-forward "\\tht" nil t)
      (replace-match "\\\\theta"))
    (goto-char (point-min))
    (while (search-forward "\\kp" nil t)
      (replace-match "\\\\kappa"))
    (goto-char (point-min))
    (while (search-forward "\\lm" nil t)
      (replace-match "\\\\lambda"))
    (goto-char (point-min))
    (while (search-forward "\\sg" nil t)
      (replace-match "\\\\sigma"))
    (goto-char (point-min))
    (while (search-forward "\\om" nil t)
      (replace-match "\\\\omega"))
    (goto-char (point-min))
    (while (search-forward "\\vlm" nil t)
      (replace-match "\\\\mathbf{\\\\lambda}"))
    (goto-char (point-min))
    (while (search-forward "\\va" nil t)
      (replace-match "\\\\mathbf{a}"))
    (goto-char (point-min))
    (while (search-forward "\\vb" nil t)
      (replace-match "\\\\mathbf{b}"))
    (goto-char (point-min))
    (while (search-forward "\\vc" nil t)
      (replace-match "\\\\mathbf{c}"))
    (goto-char (point-min))
    (while (search-forward "\\vd" nil t)
      (replace-match "\\\\mathbf{d}"))
    (goto-char (point-min))
    (while (search-forward "\\ve" nil t)
      (replace-match "\\\\mathbf{e}"))
    (goto-char (point-min))
    (while (search-forward "\\vf" nil t)
      (replace-match "\\\\mathbf{f}"))
    (goto-char (point-min))
    (while (search-forward "\\vg" nil t)
      (replace-match "\\\\mathbf{g}"))
    (goto-char (point-min))
    (while (search-forward "\\vh" nil t)
      (replace-match "\\\\mathbf{h}"))
    (goto-char (point-min))
    (while (search-forward "\\vi" nil t)
      (replace-match "\\\\mathbf{i}"))
    (goto-char (point-min))
    (while (search-forward "\\vj" nil t)
      (replace-match "\\\\mathbf{j}"))
    (goto-char (point-min))
    (while (search-forward "\\vk" nil t)
      (replace-match "\\\\mathbf{k}"))
    (goto-char (point-min))
    (while (search-forward "\\vl" nil t)
      (replace-match "\\\\mathbf{l}"))
    (goto-char (point-min))
    (while (search-forward "\\vm" nil t)
      (replace-match "\\\\mathbf{m}"))
    (goto-char (point-min))
    (while (search-forward "\\vn" nil t)
      (replace-match "\\\\mathbf{n}"))
    (goto-char (point-min))
    (while (search-forward "\\vo" nil t)
      (replace-match "\\\\mathbf{o}"))
    (goto-char (point-min))
    (while (search-forward "\\vp" nil t)
      (replace-match "\\\\mathbf{p}"))
    (goto-char (point-min))
    (while (search-forward "\\vq" nil t)
      (replace-match "\\\\mathbf{q}"))
    (goto-char (point-min))
    (while (search-forward "\\vr" nil t)
      (replace-match "\\\\mathbf{r}"))
    (goto-char (point-min))
    (while (search-forward "\\vs" nil t)
      (replace-match "\\\\mathbf{s}"))
    (goto-char (point-min))
    (while (search-forward "\\vt" nil t)
      (replace-match "\\\\mathbf{t}"))
    (goto-char (point-min))
    (while (search-forward "\\vu" nil t)
      (replace-match "\\\\mathbf{u}"))
    (goto-char (point-min))
    (while (search-forward "\\vv" nil t)
      (replace-match "\\\\mathbf{v}"))
    (goto-char (point-min))
    (while (search-forward "\\vw" nil t)
      (replace-match "\\\\mathbf{w}"))
    (goto-char (point-min))
    (while (search-forward "\\vx" nil t)
      (replace-match "\\\\mathbf{x}"))
    (goto-char (point-min))
    (while (search-forward "\\vy" nil t)
      (replace-match "\\\\mathbf{y}"))
    (goto-char (point-min))
    (while (search-forward "\\vz" nil t)
      (replace-match "\\\\mathbf{z}"))
    (goto-char (point-min))
    (while (search-forward "\\tm" nil t)
      (replace-match "\\\\times"))
    (goto-char (point-min))
    (while (search-forward "\\begin{solution}" nil t)
      (replace-match "sb>\nt> }"))
    (goto-char (point-min))
    (while (search-forward "\\end{solution}" nil t)
      (replace-match "se>\n}"))
))