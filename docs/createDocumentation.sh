#!/bin/bash

#####################################################
# This script creates the Widocu documentation of 
# MathModDB and performs all the predecessing and 
# successing steps needed.
#
# All paths can be set by variables. 
#
# call example ./createDocumentation.sh ../MathModDB_full.owl "C:/Users/shehu/Documents/MaRDI/Widoco/widoco-1.4.25-jar-with-dependencies_JDK-17.jar"
####################################################

# Path to the OWL-File of the ontology
owlOntPath="$1"

# Path to the config file for Widocu
widocuConfPath="config.properties"

# Path to the file where the documentation should be created
# Usually the directory we're in 
widocuOutputPath=$PWD

# Path to the Widocu JAR
widocuJarPath="$2"

echo "Preprocessing Ontology... "

# First preprocessing step: Remove all informations objects in the data 
# properties that have "internal:anonymous-constant". This can be done since
# they are duplicate entries and Protege and/or OWL can't handle custom 
# datatype, as our self-defined "LaTeX"
python ./scripts/remove_anonConstants.py $owlOntPath ontology_full_anonRemoved.owl

# Second preprocessing step: Swap rdfs:comment with dcterms:description
# to have a short description in the heading and the long description in
# the statement for better readbility
python ./scripts/swap_rdfsTerms.py ontology_full_anonRemoved.owl ontology_full_anonRemoved_swappedTerms.owl

echo "DONE"


echo "Creating WIDOCO... " 
# Create Widocu 
java -jar $widocuJarPath -ontFile ontology_full_anonRemoved_swappedTerms.owl -outFolder $widocuOutputPath -confFile $widocuConfPath -getOntologyMetadata -rewriteAll -htaccess -webVowl -includeAnnotationProperties -uniteSections >logfile.txt 2>&1

echo "DONE"


echo "Postprocessing WIDOCO... "
# Postprocess the WIDOCO output

./scripts/postProcessWidocu.sh

echo "DONE"

echo "WIDOCO has been created in index.html"
