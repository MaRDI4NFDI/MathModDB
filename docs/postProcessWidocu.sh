#!/bin/bash

#####################################################
# Postprocessing script to perform tasks after Widocu
# generation to make it automatically feasible for 
# github pages.
####################################################

# Generate an index.html
cp index.html index.html.old
cp index-en.html index.html

# Insert needed MathJax for all the LaTeX to be parsed
# It is inserted right behind the HTML <head> tag

# Insert the MathJax script
sed -i '/<head>/a <script id="MathJax-script" async src="https:\/\/cdn.jsdelivr.net\/npm\/mathjax@3\/es5\/tex-mml-chtml.js"><\/script>' index.html
# Insert config so that also single character delimiter is recognized
sed -i '/<head>/a <script>window.MathJax = {   tex: { inlineMath: \[\["\$", "\$\"], \["\\\\(", "\\\\)"\]\] } }; <\/script>' index.html


# Insert MaRDI Acknowledgement
sed -i '/Acknowledgments/a The work has been funded by the DFG (German Research Foundation), project number 460135501, NFDI 29\/1 “MaRDI – Mathematische Forschungsdateninitiative”.' index.html


sed -i '0,/Björn Schembera/s//Test/2' index.html
