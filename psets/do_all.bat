cat hdr_both.tex ps%1.tex > ps%1_both.tex
pdflatex ps%1_both
del ps%1_both.tex
del ps%1_both.log

cat hdr_probs.tex ps%1.tex > ps%1_probs.tex
pdflatex ps%1_probs
del ps%1_probs.tex
del ps%1_probs.log

cat hdr_sols.tex ps%1.tex > ps%1_sols.tex
pdflatex ps%1_sols
del ps%1_sols.tex
del ps%1_sols.log



