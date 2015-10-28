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

# add header and rename file
cd $WORK/processing
cat header.tsv OtA9902_vs_OtA9918_text_report.txt > BR01.tsv
cat header.tsv OtA9904_vs_OtA9920_text_report.txt > BR03.tsv
cat header.tsv OtA9905_vs_OtA9921_text_report.txt > BR04.tsv
cat header.tsv OtA9906_vs_OtA9922_text_report.txt > BR05.tsv
cat header.tsv OtA9907_vs_OtA9923_text_report.txt > BR06.tsv
cat header.tsv OtA9908_vs_OtA9924_text_report.txt > BR07.tsv
cat header.tsv OtA9909_vs_OtA9925_text_report.txt > BR08.tsv
cat header.tsv OtA9910_vs_OtA9926_text_report.txt > BR09.tsv
cat header.tsv OtA9911_vs_OtA9927_text_report.txt > BR10.tsv
cat header.tsv OtA9912_vs_OtA9928_text_report.txt > BR11.tsv
cat header.tsv OtA9913_vs_OtA9929_text_report.txt > BR12.tsv
cat header.tsv OtA9914_vs_OtA9930_text_report.txt > BR13.tsv
cat header.tsv OtA9915_vs_OtA9931_text_report.txt > BC01.tsv
cat header.tsv OtA9916_vs_OtA9932_text_report.txt > BC03.tsv
cat header.tsv OtA9917_vs_OtA9933_text_report.txt > HC01.tsv
