#!/bin/bash

## summarization of 20 gene breast cancer data

FILTERED=*filtered*.tsv

cd ~/Copy/cancerGenomics/20genesBreastCancer/paired_comparison_10262015/filtered

# make list of genes
echo -n genesAll.txt
for x in */$FILTERED; do tail +2 $x | cut -f 8 | sort | uniq >> genesAll.txt; done
sort genesAll.txt | uniq > geneNames.txt
rm genesAll.txt

#replace LOC101928103 with BARD1 in all files 


