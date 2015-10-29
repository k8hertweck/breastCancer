#!/bin/bash

## summarization of target gene breast cancer data

SCRIPT=`pwd`
WORK=~/Copy/cancerGenomics/BreastCancer

cd $WORK
mkdir processing
rm processing*

# create header
head -1 paired_comparison_10262015/filtered/BC01/BC01_OtA9915_vs_OtA9931_text_report_filtered_10262015.tsv > processing/header.tsv

# extract genes of interest and send to working folder
cd paired_comparison_10262015/filtered
for x in `cat $SCRIPT/sampleNames.lst`
	do
		cd $x
		cat $WORK/processing/header.tsv > $WORK/processing/$x.tsv
		for gene in `cat $SCRIPT/BCgenes.lst`
			do
				grep $'\t'$gene$'\t' *text_report_filtered_10262015.tsv >> $WORK/processing/$x.tsv
		done
		cd $WORK/paired_comparison_10262015/filtered
done

# tidy up 
rm header.tsv