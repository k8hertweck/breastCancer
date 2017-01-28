#!/bin/bash

## creating table of breast cancer data by individual

SCRIPT=`pwd`
WORK=~/Dropbox/cancerGenomics/breast

cd $WORK/processing
mkdir combined
cd combined

# make header
head -1 ../target_genes/BC01.csv > header.txt

# create list of unique identifier for each individual
for x in `cat $SCRIPT/sampleNames.lst`
	do
		tail +2 ../target_genes/$x.csv | cut -f 6 | uniq | sed 's:\.:\\\.:g' > $x.dbsnp.lst
done

# extract first hit for each SNP from respective files
for x in `cat $SCRIPT/sampleNames.lst`
	do
		cat header.txt > $x.temp
			for snp in `cat $x.dbsnp.lst`
				do
					grep -m 1 "\t$snp\t" ../target_genes/$x.csv >> $x.temp
					cat $x.temp > $x.table
				done
done

# create file for mutation figure that includes only somatic mutations
# extract somatic variants (only in sputum)
# Ref/Het, Ref/Hom, Hom/Het, Hom/Ref
echo -n > combVariants.csv
for x in `cat $SCRIPT/sampleNames.lst`
	do
		cat header.txt > $x.somatic.csv
		awk -F "\t" '{
			if ($18 == "Ref" && $21 == "Het") print $0; 
			else if ($18 == "Ref" && $21 == "Hom") print $0;
			else if ($18 == "Hom" && $21 == "Het") print $0;
			else if ($18 == "Hom" && $21 == "Ref") print $0;
			else next}' $x.table >> temp.somatic.csv
done

# extract columns of interest
echo -e 'chromosome\tstart\tend\tref\talt\tdbsnp\tGene\twhere_in_gene' > combVariants.csv
cut -f 1-6,8,9 temp.somatic.csv >> combVariants.csv

echo -e 'chromosome\tstart\tend\tref\talt\tdbsnp\tGene\twhere_in_gene' > uniqVariants.csv
tail +2 combVariants.csv | sort | uniq >> uniqVariants.csv

cp combVariants.csv uniqVariants.csv $SCRIPT/mutationFigures
