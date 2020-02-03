taskkill /fi "IMAGENAME eq AcroRd32.exe"
cat hdr_probs.tex ps%1.tex > ps%1_probs.tex
pdflatex ps%1_probs
del ps%1_probs.tex
del ps%1_probs.aux
del ps%1_probs.log
start ps%1_probs.pdf

