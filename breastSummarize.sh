#!/bin/bash

## summarization of target gene breast cancer data
## dependecies:
##		samtools

SCRIPT=`pwd`
WORK=~/Copy/cancerGenomics/BreastCancer
DATA=~/data/breastCancerRaw

cd $WORK

# count number of SNPs in index files
cd $DATA/
echo -n > $WORK/processing/hitsIndex.lst
echo -n > $WORK/processing/snpsIndex.lst
for x in index*
	do
		cd $x
		echo $x >> $WORK/processing/hitsIndex.lst
		tail +2 *.snpEff.snpSift.txt | wc -l >> $WORK/processing/hitsIndex.lst
		echo $x >> $WORK/processing/snpsIndex.lst
		tail +2 *.snpEff.snpSift.txt | cut -f 1-5 | sort | uniq | wc -l >> $WORK/processing/snpsIndex.lst
		cd ..
done

# count number of hits in each original file
cd $WORK/paired_comparison_10262015/original_report
echo -n > $WORK/processing/hitsOriginal.lst
echo -n > $WORK/processing/snpsOriginal.lst
for x in *.txt
	do
		echo $x >> $WORK/processing/hitsOriginal.lst
		tail +2 $x | wc -l >> $WORK/processing/hitsOriginal.lst
		echo $x >> $WORK/processing/snpsOriginal.lst
		tail +2 $x | cut -f 1-5 | sort | uniq | wc -l >> $WORK/processing/snpsOriginal.lst
done

# count number of hits in each "on target" file
cd $WORK/paired_comparison_10262015/filtered
echo -n > $WORK/processing/hitsOnTarget.lst
echo -n > $WORK/processing/snpsOnTarget.lst
for x in `cat $SCRIPT/sampleNames.lst`
	do
		cd $x
		echo $x >> $WORK/processing/hitsOnTarget.lst
		tail +2 "$x"*onTarget* | wc -l >> $WORK/processing/hitsOnTarget.lst
		echo $x >> $WORK/processing/snpsOnTarget.lst
		tail +2 "$x"*onTarget* | cut -f 1-5 | sort | uniq | wc -l >> $WORK/processing/snpsOnTarget.lst
		cd ..
done

# count number of hits in each filtered file file
echo -n > $WORK/processing/hitsFiltered.lst
echo -n > $WORK/processing/snpsFiltered.lst
for x in `cat $SCRIPT/sampleNames.lst`
	do
		cd $x
		echo $x >> $WORK/processing/hitsFiltered.lst
		tail +2 "$x"*filtered* | wc -l >> $WORK/processing/hitsFiltered.lst
		echo $x >> $WORK/processing/snpsFiltered.lst
		tail +2 "$x"*filtered* | cut -f 1-5 | sort | uniq | wc -l >> $WORK/processing/snpsFiltered.lst
		cd ..
done

# count number of hits for each processed file
cd $WORK/processing/filtered
echo -n > ../hitsProcessed.lst
echo -n > ../snpsProcessed.lst
for x in *.tsv
	do
		echo $x >> ../hitsProcessed.lst
		tail +2 $x | wc -l >> ../hitsProcessed.lst
		echo $x >> ../snpsProcessed.lst
		tail +2 $x | cut -f 1-5 | sort | uniq | wc -l >> ../snpsProcessed.lst
done

# calculate average coverage from each sample (for only genes of interest?)
#samtools depth *.bam | awk '{sum+=$3} END { print sum/NR}'
