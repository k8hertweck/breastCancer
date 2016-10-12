#!/bin/bash

## preparation of target gene breast cancer data

SCRIPT=`pwd`
WORK=~/Dropbox/cancerGenomics/breast

cd $WORK
mkdir -p processing/target_genes

# create header
head -1 paired_comparison_10262015/filtered/BC01/BC01_OtA9915_vs_OtA9931_text_report_filtered_10262015.tsv > processing/target_genes/header.tsv

# extract genes of interest from Otogenetics filtered file and send to working folder
cd paired_comparison_10262015/filtered
for x in `cat $SCRIPT/sampleNames.lst`
	do
		cd $x
		cat $WORK/processing/target_genes/header.tsv > $WORK/processing/target_genes/$x.tsv
		for gene in `cat $SCRIPT/BCgenes.lst`
			do
				grep $'\t'$gene$'\t' *text_report_filtered_10262015.tsv >> $WORK/processing/target_genes/$x.tsv
		done
		cd $WORK/paired_comparison_10262015/filtered
done
