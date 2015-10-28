#!/bin/bash

## summarization of 20 gene breast cancer data

WORK=~/Copy/cancerGenomics/20genesBreastCancer/
FILTERED=*filtered*.tsv

cd $WORK
mkdir processing
cd paired_comparison_10262015/filtered

# make list of genes
echo -n genesAll.txt
for x in */$FILTERED
	do 
		tail +2 $x | cut -f 8 | sort | uniq >> genesAll.txt
done

sort genesAll.txt | uniq > $WORK/processing/geneNames.txt
rm genesAll.txt
