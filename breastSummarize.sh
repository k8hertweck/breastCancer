#!/bin/bash

## summarization of target gene breast cancer data
## dependecies:
##		samtools

SCRIPT=`pwd`
WORK=~/Copy/cancerGenomics/BreastCancer
DATA=~/data/breastCancerRaw

cd $WORK/processing

# count number of SNPs in each "on target" file

# count number of SNPs for each filtered file
cd $WORK/processing/filtered
echo -n > snps.lst
for x in *.tsv
	do
		echo $x >> snps.lst
		tail +2 $x | wc -l >> snps.lst
done

# calculate average coverage from each sample (for only genes of interest?)
#samtools depth *.bam | awk '{sum+=$3} END { print sum/NR}'
