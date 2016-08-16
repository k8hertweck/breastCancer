## gene figures for genes that have more than 5 variants across all individuals
## dependencies: lollipops (https://github.com/pbnjay/lollipops)
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

./lollipops -f /Library/Fonts/Microsoft/Arial.ttf -hide-motifs -o BRCA2.png BRCA2 A289C@8 C326A A372C@16 A991G@8 C2034T@8 G2108A A2440G 

   2 chr13,BRCA2,32906480,missense,A,C,Asn>His,rs766173 A289C@2
   1 chr13,BRCA2,32906593,missense,C,A,Ser>Arg,rs28897706 C326A
   4 chr13,BRCA2,32906729,missense,A,C,Asn>His,rs144848 A372C@4
   1 chr13,BRCA2,32906890,synonymous,A,G,Glu>Glu,rs34355306 A425
   2 chr13,BRCA2,32906980,synonymous,A,G,Ser>Ser,rs1801439 A455@2
   2 chr13,BRCA2,32910721,synonymous,T,C,His>His,rs1801499 T743@2
   2 chr13,BRCA2,32911463,missense,A,G,Asn>Asp,rs1799944 A991G@2
   3 chr13,BRCA2,32911888,synonymous,A,G,Lys>Lys,rs1801406 A1132@3
   5 chr13,BRCA2,32912299,synonymous,T,C,Val>Val,rs543304 T1269@5
   2 chr13,BRCA2,32914592,missense,C,T,Arg>Cys,rs1799954 C2034T@2
   1 chr13,BRCA2,32914815,missense,G,A,Arg>His,rs35029074 G2108A
   1 chr13,BRCA2,32929232,synonymous,A,G,Ser>Ser,rs1799955 A2414
   1 chr13,BRCA2,32929309,missense,A,G,His>Arg,rs4986860 A2440G

./lollipops -f /Library/Fonts/Microsoft/Arial.ttf -hide-motifs -o BRCA1.png BRCA1 T1613C@16 A1236C@8 T1183C@16 T1038C@16 G871A@16 C693T@8

   4 chr17,BRCA1,41223094,missense,T,C,Ser>Gly,rs1799966 T1613C@4
   4 chr17,BRCA1,41234470,synonymous,A,G,Ser>Ser,rs1060915 A1436@4
   2 chr17,BRCA1,41243840,missense,A,C,Asn>Lys,rs28897687 A1236C@2
   4 chr17,BRCA1,41244000,missense,T,C,Lys>Arg,rs16942 T1183C@4
   4 chr17,BRCA1,41244435,missense,T,C,Glu>Gly,rs16941 T1038C@4
   4 chr17,BRCA1,41244936,missense,G,A,Pro>Leu,rs799917 G871A@4
   4 chr17,BRCA1,41245237,synonymous,A,G,Leu>Leu,rs16940 A771@4
   4 chr17,BRCA1,41245466,synonymous,G,A,Ser>Ser,rs1799949 G694@4
   2 chr17,BRCA1,41245471,missense,C,T,Asp>Asn,rs4986850 C693T@2
 
./lollipops -f /Library/Fonts/Microsoft/Arial.ttf -hide-motifs -o BARD1.png BARD1 C580T C507T@8 C378G G40A G24A@8

./lollipops -f /Library/Fonts/Microsoft/Arial.ttf -hide-motifs -o BARD1del.png BARD1 R359#00ff00 R365#00ff00

   1 chr2,BARD1,215610518,missense,C,T,Glu>Lys,rs35306212 C580T
   2 chr2,BARD1,215632255,missense,C,T,Val>Met,rs2070094 C507T@2
   3 chr2,BARD1,215632256,synonymous,A,G,His>His,rs2070093 A506@3
   1 chr2,BARD1,215645464,missense,C,G,Arg>Ser,rs2229571 C378G
   2 chr2,BARD1,215645545,synonymous,C,G,Thr>Thr,rs2070096 C351@2
   1 chr2,BARD1,215674175,missense,G,A,Ala>Val,rs71579841 G40A
   2 chr2,BARD1,215674224,missense,G,A,Pro>Ser,rs1048108 G24A@2
   1 chr2,inframe_deletion,215645503,,TGGTGAAGAACATTCAGGCAA,rs28997575,,BARD1 R359#00ff00 R365#00ff00

./lollipops -f /Library/Fonts/Microsoft/Arial.ttf -hide-motifs -o ATM.png ATM G514A C1380T C1420T G1853A@2 A1853T@2

   1 chr11,ATM,108121733,missense,G,A,Gly>Asp,rs2235000 G514A
   1 chr11,ATM,108159732,missense,C,T,His>Tyr,rs3092856 C1380T
   1 chr11,ATM,108160350,missense,C,T,Leu>Phe,rs1800058 C1420T
   1 chr11,ATM,108163382,synonymous,C,T,Phe>Phe,rs4988008 C1491
   2 chr11,ATM,108175462,missense,G,A,Asp>Asn,rs1801516 G1853A@2
   2 chr11,ATM,108175463,missense,A,T,Asp>Val,rs1801673 A1853T@2

./lollipops -f /Library/Fonts/Microsoft/Arial.ttf -hide-motifs -o ERBB2.png ERBB2 C4A A625G@16 C1140G@16

   1 chr17,ERBB2,37856502,missense,C,A,Ala>Glu,. C4A
   4 chr17,ERBB2,37879588,missense,A,G,Ile>Val,rs1136201 A625G@4
   1 chr17,ERBB2,37883175,synonymous,C,T,Pro>Pro,rs4252655
   4 chr17,ERBB2,37884037,missense,C,G,Pro>Ala,rs1058808 C1140G@4

./lollipops -f /Library/Fonts/Microsoft/Arial.ttf -hide-motifs -o PALB2.png PALB2 T559C@4 G210A

   4 chr16,PALB2,23646191,missense,T,C,Gln>Arg,rs152451 T559C@4
   1 chr16,PALB2,23647238,missense,G,A,Pro>Leu,rs57605939 G210A

## variants for each gene below are listed, but lollipops not coded
#BRIP1
#   5 chr17,BRIP1,59760996,synonymous,A,G,Tyr>Tyr,rs4986763
#   5 chr17,BRIP1,59763347,missense,A,G,Ser>Pro,rs4986764
#   4 chr17,BRIP1,59763465,synonymous,T,C,Glu>Glu,rs4986765
#
# CASP8
#    3 chr2,CASP8,202122995,missense,A,G,Lys>Arg,rs3769823
#    2 chr2,CASP8,202149696,synonymous,G,A,Lys>Lys,rs1045487
# 
# CDH1
#    4 chr16,CDH1,68857441,synonymous,T,C,Ala>Ala,rs1801552
# 
# CHEK2
#    2 chr22,CHEK2,29085168,synonymous,C,G,Leu>Leu,.
#    2 chr22,CHEK2,29121019,missense,G,A,Arg>Cys,rs77130927
# 
# NBN
#    1 chr8,NBN,90955583,synonymous,A,C,Pro>Pro,rs7823648
#    2 chr8,NBN,90958422,synonymous,T,C,Pro>Pro,rs1061302
#    3 chr8,NBN,90967711,synonymous,A,G,Asp>Asp,rs709816
#    2 chr8,NBN,90990479,missense,C,G,Glu>Gln,rs1805794
#    3 chr8,NBN,90995019,synonymous,C,T,Leu>Leu,rs1063045
#    
# TGFB1
#    2 chr19,TGFB1,41858602,synonymous,G,A,Thr>Thr,rs56281462
#    1 chr19,TGFB1,41858637,missense,C,A,Ala>Ser,.
#    3 chr19,TGFB1,41858876,missense,C,G,Arg>Pro,rs1800471
#    3 chr19,TGFB1,41858921,missense,G,A,Pro>Leu,rs1800470
#    
# TP53 
#    4 chr17,TP53,7579472,missense,G,C,Pro>Arg,rs1042522
# 
# AR
#    1 chrX,AR,66765158,missense,T,A,Leu>Gln,rs78686797
#    3 chrX,AR,66765627,synonymous,G,A,Glu>Glu,rs6152
#    1 chrX,inframe_deletion,66766357,,GGCGGCGGCGGC,NA,,AR
#    2 chrX,inframe_deletion,66766357,,GGCGGCGGCGGCGGCGGC,NA,,AR
# 
# DIRAS3
#    1 chr1,DIRAS3,68512441,synonymous,A,G,Ile>Ile,rs61736596
#    
# RAD50
#    1 chr5,RAD50,131977963,synonymous,T,C,Tyr>Tyr,rs1804670
