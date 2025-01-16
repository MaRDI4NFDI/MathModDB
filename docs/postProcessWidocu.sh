#!/bin/bash

#####################################################
# Postprocessing script to perform tasks after Widocu
# generation to make it automatically feasible for 
# github pages. The following tasks are performed:
#
# - Copy index-en.html to index.html
# - Insert MathJax for formulae rendering
# - Insert MaRDI acknowledgements
# - Insert clickable authors list
#
#
# Written by 
# Björn Schembera, bjoern.schembera@ians.uni-stuttgart.de
#
####################################################

# Generate an index.html
cp index.html index.html.old
cp index-en.html index.html

# Insert needed MathJax for all the LaTeX to be parsed
# It is inserted right behind the HTML <head> tag
# First insert the MathJax script
sed -i '/<head>/a <script id="MathJax-script" async src="https:\/\/cdn.jsdelivr.net\/npm\/mathjax@3\/es5\/tex-mml-chtml.js"><\/script>' index.html
# Insert config so that also single character delimiter is recognized
sed -i '/<head>/a <script>window.MathJax = {   tex: { inlineMath: \[\["\$", "\$\"], \["\\\\(", "\\\\)"\]\] } }; <\/script>' index.html


# Insert MaRDI Acknowledgement: Search for the "Acknowledgements" section an insert right
# after the heading
sed -i '/Acknowledgments/a The work has been funded by the DFG (German Research Foundation), project number 460135501, NFDI 29\/1 “MaRDI – Mathematische Forschungsdateninitiative”.' index.html


# Search for the "Authors:" tag, then overwrite the following line containing all authors with the same
# information but with HTML links included
sed -i '/Authors:/!b;n;c\<dd><a href="https:\/\/orcid.org\/0000-0002-1994-0612" target="\_blank">Aurela Shehu<\/a>, <a href="https:\/\/ror.org\/00h1x4t21" target="_blank">Weierstrass Institute Berlin for Applied Analysis and Stochastics<\/a><\/dd><dd><a href="https:\/\/orcid.org\/0000-0003-2860-6621" target="\_blank">Björn Schembera<\/a>, <a href="https:\/\/ror.org\/04vnq7t77" target="\_blank">Universität Stuttgart<\/a><\/dd> <dd><a href="https:\/\/orcid.org\/0000-0002-9658-499X" target="\_blank">Burkhard Schmidt<\/a>, <a href="https:\/\/ror.org/00h1x4t21" target="_blank">Weierstrass Institute Berlin for Applied Analysis and Stochastics<\/a><\/dd> <dd><a href="https:\/\/orcid.org\/0009-0002-5082-8386" target="\_blank">Christine Biedinger<\/a>, <a href="https:\/\/ror.org\/019hjw009" target="\_blank">Fraunhofer Institute for Industrial Mathematics ITWM<\/a> <\/dd><dd><a href="https:\/\/orcid.org\/0000-0002-9176-780X" target="_blank">Jochen Fiedler<\/a>, <a href="https:\/\/ror.org\/019hjw009" target="\_blank">Fraunhofer Institute for Industrial Mathematics ITWM<\/a><\/dd><dd><a href="https:\/\/orcid.org\/0000-0002-1919-1834" target="_blank">Marco Reidelbach<\/a>, <a href="https:\/\/ror.org\/02eva5865" target="\_blank">Zuse Institute Berlin</a><\/dd><dd><a href="https:\/\/orcid.org\/0000-0001-6235-9412" target="\_blank">Thomas Koprucki<\/a>, <a href="https:\/\/ror.org\/00h1x4t21" target="_blank">Weierstrass Institute Berlin for Applied Analysis and Stochastics<\/a><\/dd>' index.html
