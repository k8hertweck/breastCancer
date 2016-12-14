#!/bin/bash

## creating table of breast cancer data by individual

SCRIPT=`pwd`
WORK=~/Dropbox/cancerGenomics/breast

cd $WORK/processing/target_genes 

# clean up previous attempts
rm *.table breastTable.*

# rename for easier file inspection with spreadsheet program
rename 's/.tsv/.csv/' *.tsv

# make header
head -1 BC01.csv > header.txt

# create list of unique dbsnp for each individual
for x in *.csv
	do
		tail +2 $x | cut -f 6 | uniq > $x.dbsnp.lst
done

# extract first hit for each SNP from respective files
for x in `cat $SCRIPT/sampleNames.lst`
	do
		cat header.txt > $x.temp
			for snp in `cat $x.csv.dbsnp.lst`
				do
					grep -m 1 $snp $x.csv >> $x.temp
					cat $x.temp > $x.table
				done
done

# clean up
rename 's/.table/.table.csv/' *.table

# extract somatic variants (only in sputum)
# Ref/Het, Ref/Hom, Hom/Het
for x in `cat $SCRIPT/sampleNames.lst`
	do
		cat header.txt > $x.somatic.csv
		awk -F "\t" '{
			if ($18 == "Ref" && $21 == "Het") print $0; 
			else if ($18 == "Ref" && $21 == "Hom") print $0;
			else if ($18 == "Hom" && $21 == "Het") print $0;
			else next}' $x.table.csv > $x.somatic.csv
done

# extract germline variants (in both sputum and lymphocyte)
# Het/Hom, Het/Ref
for x in `cat $SCRIPT/sampleNames.lst`
	do
		cat header.txt > $x.germline.csv
		awk -F "\t" '{
			if ($18 == "Het" && $21 == "Hom") print $0; 
			else if ($18 == "Het" && $21 == "Ref") print $0;
			else next}' $x.table.csv > $x.germline.csv
done

# extract variants present only in germline (lymphocyte)
# Hom/Ref
for x in `cat $SCRIPT/sampleNames.lst`
	do
		cat header.txt > $x.remove.csv
		awk -F "\t" '{
			if ($18 == "Hom" && $21 == "Ref") print $0; 
			else next}' $x.table.csv > $x.remove.csv
done

# aggregate somatic variants among samples
echo -n > breastTable.somatic.csv.temp
for x in `cat $SCRIPT/sampleNames.lst`
	do
		echo -e '\n'$x >> breastTable.somatic.csv.temp
		cut -f 1,2,4,5,6,8,9,10 $x.somatic.csv >> breastTable.somatic.csv.temp
done
		
sed s/.csv.table//g breastTable.somatic.csv.temp | 
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
	sed 's/,\.,/,NA,/g' > breastTable.somatic.csv

# create file with just nonsynonymous variants (used in publication)
grep -v synonymous breastTable.somatic.csv > breastTable.somatic.nonsyn.csv

# create file with all variants by gene
echo -n genevariants.csv
for gene in `cat $SCRIPT/BCgenes.lst`
	do
		echo $gene >> genevariants.csv
		grep ' $gene ' breastTable.somatic.nonsyn.csv >> genevariants.csv
done

# create file with deletions
echo -n geneDeletions.csv
for x in `cat $SCRIPT/sampleNames.lst`
	do
		grep deletion $x.csv >> geneDeletions.csv
done
