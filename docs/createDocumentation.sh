#!/bin/bash

#####################################################
# This script creates the Widocu documentation of 
# MathModDB and performs all the predecessing and 
# successing steps needed.
#
# All paths can be set by variables. 
#
####################################################

# Path to the OWL-File of the ontology
owlOntPath="$HOME/MaRDI/Ontology/model-ontology_main/MaRDIModelOntology.owl"

# Path to the config file for Widocu
widocuConfPath="$HOME/MaRDI/Ontology/publicationGithub/MathModDB/docs/config.properties"

# Path to the file where the documentation should be created
# Usually the directory we're in 
widocuOutputPath=$PWD

# Path to the Widocu JAR
widocuJarPath="$HOME/Downloads/widoco-1.4.25-jar-with-dependencies_JDK-17.jar"

echo -n "Preprocessing Ontology... "
# Do some preprocessing for better comments
./preprocessOntologyScript.sh $owlOntPath

echo "DONE"


echo -n "Creating WIDOCU... " 
# Create Widocu 
java -jar $widocuJarPath -ontFile ontologyPreprocessed.owl -outFolder $widocuOutputPath -confFile $widocuConfPath -getOntologyMetadata -rewriteAll -webVowl -includeAnnotationProperties -uniteSections >logfile.txt 2>&1

echo "DONE"


echo -n "Postprocessing WIDOCU... "
# Postprocess the WIDOCU output

./postProcessWidocu.sh

echo "DONE"

echo "WIDOCU has been created in index.html"

