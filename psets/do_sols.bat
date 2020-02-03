taskkill /fi "IMAGENAME eq AcroRd32.exe"
cat hdr_sols.tex ps%1.tex > ps%1_sols.tex
pdflatex ps%1_sols
del ps%1_sols.tex
del ps%1_sols.aux
del ps%1_sols.log
start ps%1_sols.pdf

