#!/bin/bash

## summarization of 20 gene breast cancer data

SCRIPT=`pwd`
WORK=~/Copy/cancerGenomics/20genesBreastCancer

cd $WORK
mkdir processing

# create filename conversion list and header
ls paired_comparison_10262015/original_report > processing/filenames.lst
head -1 paired_comparison_10262015/original_report/OtA9902_vs_OtA9918_text_report.txt > processing/header.tsv

# extract genes of interest and send to working folder
cd paired_comparison_10262015/original_report
rm $WORK/processing/*report.txt
for x in *report.txt
	do
		for gene in `cat $SCRIPT/BCgenes.lst`
			do
				grep $'\t'$gene$'\t' $x >> $WORK/processing/$x
		done
done
