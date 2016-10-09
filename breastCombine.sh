#!/bin/bash

## combining breast cancer data from multiple patients

SCRIPT=`pwd`
WORK=~/Dropbox/cancerGenomics/breast

cd $WORK/processing
mkdir combined

# combine unique SNPs from different individuals
cd $WORK/processing/processed
echo -n > temp
for x in *.tsv
	do
		tail +2 $x | cut -f 1-6,8,9 | sort | uniq >> temp
done

echo -e 'chromosome\tstart\tend\tref\talt\tdbsnp\tGene\where_in_gene' > ../combined/combVariants.tsv
sort temp >> ../combined/combVariants.tsv
rm temp

# count number of individuals with each variant
uniq -c ../combined/combVariants.tsv > ../combined/countVariants.tsv

# obtain list of unique variants
uniq ../combined/combVariants.tsv > ../combined/uniqVariants.tsv

cp ../combined/combVariants.tsv $SCRIPT/data