#!/bin/bash

## creating table of breast cancer data by individual

SCRIPT=`pwd`
WORK=~/Dropbox/cancerGenomics/breast

cd $WORK/processing/processed 

rm *.table breastTable.*

# convert to csv
for x in *.tsv
	do
		cat $x | tr "\t" "," > $x.csv
done

rename 's/.tsv.csv/.csv/' *.csv

# make header
head -1 BC01.csv > header.txt

# create list of unique dbsnp for each individual
for x in *.csv
	do
		tail +2 $x | cut -d , -f 1-6 | uniq > $x.dbsnp.lst
done

# extract first hit for each SNP from respective files
for x in *.csv
	do
		cat header.txt > $x.temp
			for snp in `cat $x.dbsnp.lst`
				do
					grep -m 1 $snp $x >> $x.temp
					cat $x.temp | tr "," "\t" > $x.table
				done
done

# clean up
rm *.temp *.dbsnp.lst *.csv

# create master file
echo -n > breastTable.tsv
for x in *.table
	do
		echo -e '\n'$x >> breastTable.tsv
		cut -f 1,2,4,5,6,8,9,10 $x >> breastTable.tsv
done
		
sed s/.csv.table//g breastTable.tsv | 
	sed s/_variant//g |
	sed s/snpEffEffect/type/g |
	sed s/snpEffHGVS/mutation/g |
	sed s/ref/reference/g |
	sed s/alt/variant/ |
	sed s/dbsnp/dbSNP/ |
	sed s/start/position/ |
	sed 's/\/c.*$//' |
	sed 's/NM_.*:p\.//' |
	sed -E 's/([A-Z]{1}[a-z]{2})[0-9]{1,4}/\1\>/g' |
	sed -E 's/[A-Z][a-z]{2}\>_.*$//' |
	awk '{print $1,$6,$2,$7,$3,$4,$8,$5}' |
	tr " " "," |
	sed 's/,\.,/,NA,/g' > breastTable.csv
