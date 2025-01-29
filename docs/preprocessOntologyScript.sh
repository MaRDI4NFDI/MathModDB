#!/bin/bash

owlOntPath=$1

cp "$owlOntPath" ontologyPreprocessed.owl

sed -i 's/terms1:description/rdfs:cm/' ontologyPreprocessed.owl
sed -i  's/rdfs:comment/terms1:dsc/' ontologyPreprocessed.owl
sed -i 's/\/terms1:description/\/rdfs:cm/' ontologyPreprocessed.owl
sed -i  's/\/rdfs:comment/\/terms1:dsc/' ontologyPreprocessed.owl

sed -i  's/rdfs:cm/rdfs:comment/' ontologyPreprocessed.owl
sed -i  's/terms1:dsc/terms1:description/' ontologyPreprocessed.owl
sed -i  's/\/rdfs:cm/\/rdfs:comment/' ontologyPreprocessed.owl
sed -i  's/\/terms1:dsc/\/terms1:description/' ontologyPreprocessed.owl
