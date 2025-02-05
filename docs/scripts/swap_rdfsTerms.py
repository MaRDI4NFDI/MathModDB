# Python script that swaps rdfs:comment and dcterms:descriptions in 
# preparation for the widocu generation. This is for better readbility, 
# so the shorter sentences are in the headline whereas the longer 
# sentences are in the statements

import re
import argparse

def swap_rdf_terms(input_file, output_file):
    with open(input_file, 'r', encoding='utf-8') as file:
        data = file.read()

    # Use a temporary placeholder to avoid direct conflicts
    temp_placeholder = "__TEMP_COMMENT__"

    # Step 1: Replace rdfs:comment with a temporary placeholder
    data = re.sub(r'\brdfs:comment\b', temp_placeholder, data)

    # Step 2: Replace terms:description with rdfs:comment
    data = re.sub(r'\bterms:description\b', 'rdfs:comment', data)

    # Step 3: Replace the temporary placeholder with terms:description
    data = re.sub(temp_placeholder, 'terms:description', data)

    with open(output_file, 'w', encoding='utf-8') as file:
        file.write(data)

    print(f"Swapping complete. Output saved to {output_file}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Swap RDF terms in an OWL file.")
    parser.add_argument("input_file", help="Path to the input OWL file")
    parser.add_argument("output_file", help="Path to save the modified OWL file")
    args = parser.parse_args()

    swap_rdf_terms(args.input_file, args.output_file)

