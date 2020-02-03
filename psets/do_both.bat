taskkill /fi "IMAGENAME eq AcroRd32.exe"
cat hdr_both.tex ps%1.tex > ps%1_both.tex
pdflatex ps%1_both
del ps%1_both.tex
del ps%1_both.log
start ps%1_both.pdf

