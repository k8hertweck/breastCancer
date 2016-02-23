#!/bin/bash

## summarization of target gene breast cancer data
## dependecies:

SCRIPT=`pwd`
WORK=~/Dropbox/cancerGenomics/breast
DATA=~/data/breastCancerRaw

cd $WORK

# count number of hits in index files (hits per individual sample from Otogenetics)
# these samples missing *.snpEff.snpSift.txt: 11, 13, 14, 15, 16, 17, 18, 19, 20
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

# count number of hits in each original file (comparison between somatic and germ from Otogenetics)
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

# count number of hits in each "on target" file (only genes of interest from Otogenetics)
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

# count number of hits in each filtered file (genes of interest, quality filtered by Otogenetics)
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

# count number of hits for each processed file (quality filtered by Otogenetics, annotations filtered to genes of interest by me)
cd $WORK/processing/processed
echo -n > ../hitsProcessed.lst
echo -n > ../snpsProcessed.lst
for x in *.tsv
	do
		echo $x >> ../hitsProcessed.lst
		tail +2 $x | wc -l >> ../hitsProcessed.lst
		echo $x >> ../snpsProcessed.lst
		tail +2 $x | cut -f 1-5 | sort | uniq | wc -l >> ../snpsProcessed.lst
done
