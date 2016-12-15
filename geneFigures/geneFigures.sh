## gene figures for genes that have more than 5 variants across all individuals
## dependencies: lollipops (https://github.com/pbnjay/lollipops) in directory
## usage: geneFigures.sh PATH/TO/DATA

cd $DATA

## example code to extract variants for each gene
#grep BRCA1 breastTable.csv | sort | uniq -c
#grep -m 1 rs766173 * | cut -f 10

## Examples
#R273C            -- non-synonymous mutation at codon 273
#T125@5           -- synonymous mutation at codon 125 with "5x" marker sizing
#R248Q#00ff00     -- green lollipop at codon 248
#R248Q#00ff00@131 -- green lollipop at codon 248 with "131x" marker sizing

## Color coding
#blue synonymous
#red nonsynonymous
#green inframe deletion

# example SNV
./lollipops -f /Library/Fonts/Microsoft/Arial.ttf -hide-motifs -o BRCA1.png BRCA1 T1038C@4

   4 chr17,BRCA1,41244435,missense,T,C,Glu>Gly,rs16941 T1038C@4 

# example deletion
./lollipops -f /Library/Fonts/Microsoft/Arial.ttf -hide-motifs -o BARD1del.png BARD1 R359#00ff00 R365#00ff00

   1 chr2,inframe_deletion,215645503,,TGGTGAAGAACATTCAGGCAA,rs28997575,,BARD1
