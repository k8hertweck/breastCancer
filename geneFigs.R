# creating gene figures in R

source("https://bioconductor.org/biocLite.R")
biocLite("trackViewer")
library(trackViewer)

## BRCA2 UniProt
BRCA2snps <- c(289, 326, 372, 991, 2034, 2108, 2440) # enter data
# specify genomic range for SNPs
BRCA2.gr <- GRanges("chr1", IRanges(BRCA2snps, width=1, names=paste0(BRCA2snps)))
BRCA2.gr$color <- "red" # define SNP color
BRCA2.gr$score <- c(2, 1, 4, 2, 2, 1, 1) # define number of each SNP
# specify genomic range for features
BRCA2features <- GRanges("chr1", IRanges(c(1, 1002, 1212, 1421, 1517, 1664, 1837, 1971, 2051, 3418), 
                                         width=c(1, 34, 34, 34, 34, 34, 34, 34, 34, 1),
                                         names=paste0("block", 1:3)))
BRCA2features$fill <- c("gray", "green", "green", "green", "green", "green", "green", "green", "green", "gray") # change color
# plot lolliplot
lolliplot(BRCA2.gr, BRCA2features, ylab = FALSE, yaxis = FALSE, xaxis=c(1, 3418))

## BRCA1 UniProt
BRCA1snps <- c(1613, 1236, 1183, 1038, 871, 693) # enter data
# specify genomic range for SNPs
BRCA1.gr <- GRanges("chr1", IRanges(BRCA1snps, width=1, names=paste0(BRCA1snps)))
BRCA1.gr$color <- "red" # define SNP color
BRCA1.gr$score <- c(4, 2, 4, 4, 4, 2) # define number of each SNP
# specify genomic range for features
BRCA1features <- GRanges("chr1", IRanges(c(1, 24, 1642, 1756, 1863), 
                                         width=c(1, 41, 94, 99, 1),
                                         names=paste0("block", 1:3)))
BRCA1features$fill <- c("gray", "green", "red", "blue", "gray") # change color
# plot lolliplot
lolliplot(BRCA1.gr, BRCA1features, ylab = FALSE, yaxis = FALSE, xaxis=c(1, 1863))

## BARD1 deletion UniProt
BARD1snps <- c(359, 365) # enter data
# specify genomic range for SNPs
BARD1.gr <- GRanges("chr1", IRanges(BARD1snps, width=1, names=paste0(BARD1snps)))
BARD1.gr$color <- "green" # define SNP color
BARD1.gr$score <- c(1, 1) # define number of each SNP
# specify genomic range for features
BARD1features <- GRanges("chr1", IRanges(c(1, 50, 427, 460, 493, 526, 560, 667, 777), 
                                         width=c(1, 37, 32, 32, 32, 20, 93, 110, 1),
                                         names=paste0("block", 1:3)))
BARD1features$fill <- c("gray", "green", "red", "red", "red", "red", "blue", "yellow", "gray") # change color
# plot lolliplot
lolliplot(BARD1.gr, BARD1features, ylab = FALSE, yaxis = FALSE, xaxis=c(1, 777))

## BARD1 UniProt
BARD1snps <- c(580, 507, 378, 40, 24) # enter data
# specify genomic range for SNPs
BARD1.gr <- GRanges("chr1", IRanges(BARD1snps, width=1, names=paste0(BARD1snps)))
BARD1.gr$color <- "red" # define SNP color
BARD1.gr$score <- c(1, 2, 1, 1, 2) # define number of each SNP
# specify genomic range for features
BARD1features <- GRanges("chr1", IRanges(c(1, 50, 427, 460, 493, 526, 560, 667, 777), 
                                         width=c(1, 37, 32, 32, 32, 20, 93, 110, 1),
                                         names=paste0("block", 1:3)))
BARD1features$fill <- c("gray", "green", "red", "red", "red", "red", "blue", "yellow", "gray") # change color
# plot lolliplot
lolliplot(BARD1.gr, BARD1features, ylab = FALSE, yaxis = FALSE, xaxis=c(1, 777))

## ATM UniProt
ATMsnps <- c(514, 1380, 1420, 1853, 1853) # enter data
# specify genomic range for SNPs
ATM.gr <- GRanges("chr1", IRanges(ATMsnps, width=1, names=paste0(ATMsnps)))
ATM.gr$color <- "red" # define SNP color
ATM.gr$score <- c(1, 1, 1, 2, 2) # define number of each SNP
# specify genomic range for features
ATMfeatures <- GRanges("chr1", IRanges(c(1, 1960, 2712, 3024, 3056), 
                                         width=c(1, 606, 250, 32, 1),
                                         names=paste0("block", 1:4)))
ATMfeatures$fill <- c("gray", "green", "red", "blue", "gray") # change color
# plot lolliplot
lolliplot(ATM.gr, ATMfeatures, ylab = FALSE, yaxis = FALSE, xaxis=c(1, 3056))

## ERBB2 UniProt
ERBB2snps <- c(4, 625, 1140) # enter data
# specify genomic range for SNPs
ERBB2.gr <- GRanges("chr1", IRanges(ERBB2snps, width=1, names=paste0(ERBB2snps)))
ERBB2.gr$color <- "red" # define SNP color
ERBB2.gr$score <- c(1, 4, 4) # define number of each SNP
# specify genomic range for features
ERBB2features <- GRanges("chr1", IRanges(c(1, 720, 1255), 
                                       width=c(1, 267, 1),
                                       names=paste0("block", 1:3)))
ERBB2features$fill <- c("gray", "green", "gray") # change color
# plot lolliplot
lolliplot(ERBB2.gr, ERBB2features, ylab = FALSE, yaxis = FALSE, xaxis=c(1, 1255))

## PALB2 UniProt
PALB2snps <- c(559, 210) # enter data
# specify genomic range for SNPs
PALB2.gr <- GRanges("chr1", IRanges(PALB2snps, width=1, names=paste0(PALB2snps)))
PALB2.gr$color <- "red" # define SNP color
PALB2.gr$score <- c(4,1) # define number of each SNP
# specify genomic range for features
PALB2features <- GRanges("chr1", IRanges(c(1, 837, 1186), 
                                    width=c(1, 349, 1),
                                    names=paste0("block", 1:3)))
PALB2features$fill <- c("gray", "green", "gray") # change color
# plot lolliplot
lolliplot(PALB2.gr, PALB2features, ylab = FALSE, yaxis = FALSE, xaxis=c(1, 1186))
