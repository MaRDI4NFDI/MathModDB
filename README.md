[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.14887915.svg)](https://doi.org/10.5281/zenodo.14887915)
# MathModDB

MathModDB is a database of mathematical models developed by the Mathematical Research Data Initiative ([MaRDI](https://www.mardi4nfdi.de)). MathModDB defines a data model with classes (Mathematical Model, Mathematical Formulation, Research Field, Research Problem, Quantity [Kind], Computational Task, Publication), object properties/relations, data properties and annotation properties as an ontology. This ontology is populated with individuals/data from various fields of applied mathematics, making it a knowledge graph.

For more detailed information on the ontoloty and the knowledge graph please refer to the [Usage](#usage) subsection or the [Widoco documentation](https://mardi4nfdi.github.io/MathModDB/). For a high level description and evolutionary history of MathModDB please refer to our papers listed in the [References](#References) subsection. 

This version is also the basis for the integration of the model data into the [MaRDI Portal](https://portal.mardi4nfdi.de/)

## Version and Release date

Version 1.0.0

Released on 2025-02-13


## Authors

* [Aurela Shehu](https://orcid.org/0000-0002-1994-0612), Weierstrass Institute Berlin for Applied Analysis and Stochastics
* [Björn Schembera](https://orcid.org/0000-0003-2860-6621), University of Stuttgart
* [Burkhard Schmidt](https://orcid.org/0000-0002-9658-499X), Weierstrass Institute Berlin for Applied Analysis and Stochastics
* [Christine Biedinger](https://orcid.org/0009-0002-5082-8386), Fraunhofer Institute for Industrial Mathematics ITWM
* [Jochen Fiedler](https://orcid.org/0000-0002-9176-780X), Fraunhofer Institute for Industrial Mathematics ITWM 
* [Marco Reidelbach](https://orcid.org/0000-0002-1919-1834), Zuse Institute Berlin 
* [Thomas Koprucki](https://orcid.org/0000-0001-6235-9412), Weierstrass Institute Berlin for Applied Analysis and Stochastics 

## Usage

The ontology and the data included is represented in OWL, serialized as RDF/XML in the two files in this repository. 

* `MathModDB.owl` is the version as designed by the MathModDB team members. This "lean" version includes, for example, only one direction of object property relations -- the other direction can be easily inferred automatically by a reasoner, if the inverses are defined.
* `MathModDB_full.owl` is the "full" version, where everything which is inferred by the reasoner is also saved to the file and hence made explicit. This is needed to build the full documentation in Widoco. 

These files can opened with Protégé or any other tool for that purpose.

A detailed description of the main concepts, classes and relations of the ontology as well as their individuals can be found on https://mardi4nfdi.github.io/MathModDB/. This documentation is created with Widoco. More high level descriptions can be found in the [References](#References) section.

## Citation

In case you are refering to or using MathModDB, please use the following citation:

`Shehu, A., Schembera, B., Schmidt, B., Biedinger, C., Fiedler, J., Reidelbach, M., Koprucki, T. (2025): MathModDB Ontology and Knowledge Graph for Mathematical Models`


## References

Schembera, B., Wübbeling, F., Kleikamp, H., Schmidt, B., Shehu, A., Reidelbach, M., Biedinger, C., Fiedler, J., Koprucki, T., Iglezakis, D. and Göddeke, D., 2024. Towards a Knowledge Graph for Models and Algorithms in Applied Mathematics. arXiv preprint arXiv:2408.10003. https://doi.org/10.48550/arXiv.2408.10003

Schembera, B., Wübbeling, F., Kleikamp, H., Biedinger, C., Fiedler, J., Reidelbach, M., Shehu, A., Schmidt, B., Koprucki, T., Iglezakis, D. and Göddeke, D., 2023, October. Ontologies for models and algorithms in applied mathematics and related disciplines. In Research Conference on Metadata and Semantics Research (pp. 161-168). Cham: Springer Nature Switzerland. https://doi.org/10.1007/978-3-031-65990-4_14 

Schembera, B., Wübbeling, F., Koprucki, T., Biedinger, C., Reidelbach, M., Schmidt, B., Göddeke, D. and Fiedler, J., 2023, September. Building Ontologies and Knowledge Graphs for Mathematics and its Applications. In Proceedings of the Conference on Research Data Infrastructure (Vol. 1). https://doi.org/10.52825/cordi.v1i.255

## Contact


## License

The ontology MathModDB is licensed under **[CC-BY 4.0](https://creativecommons.org/licenses/by/4.0/)**.


## Funding Acknowledgements
The work has been funded by the DFG (German Research Foundation), project number 460135501, NFDI 29/1 “MaRDI – Mathematische Forschungsdateninitiative”. 
