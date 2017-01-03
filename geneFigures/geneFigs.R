# creating gene figures in R

source("https://bioconductor.org/biocLite.R")
biocLite("trackViewer")
library(trackViewer)

## BRCA2 combined UniProt http://www.uniprot.org/uniprot/P51587#showFeaturesViewer
BRCA2snps <- c(289, 372, 991, 2034, 289, 326, 372, 991, 2034, 2108, 2440) # enter data (somatic first, then germline)
# specify genomic range for SNPs
BRCA2.gr <- GRanges("chr1", IRanges(BRCA2snps, width=1, names=paste0(BRCA2snps)))
BRCA2.gr$color <- c(replicate(4, "red"), replicate(7, "blue")) # define SNP color
BRCA2.gr$score <- c(1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1) # define number of each SNP
# specify genomic range for features (repeats)
BRCA2features <- GRanges("chr1", IRanges(c(1, 1002, 1212, 1421, 1517, 1664, 1837, 1971, 2051, 3418), 
                                         width=c(1, 34, 34, 34, 34, 34, 34, 34, 34, 1),
                                         names=paste0("block", 1:3)))
BRCA2features$fill <- c("gray", "green", "green", "green", "green", "green", "green", "green", "green", "gray") # change color
# plot lolliplot
jpeg("geneFigures/BRCA2combined.jpg")
lolliplot(BRCA2.gr, BRCA2features, ylab = FALSE, yaxis = FALSE, xaxis=c(1, 3418))
dev.off()

## BRCA2 somatic UniProt http://www.uniprot.org/uniprot/P51587#showFeaturesViewer
BRCA2snps <- c(289, 372, 991, 2034) # enter somatic data 
# specify genomic range for SNPs
BRCA2.gr <- GRanges("chr1", IRanges(BRCA2snps, width=1, names=paste0(BRCA2snps)))
BRCA2.gr$color <- "red" # define SNP color
BRCA2.gr$score <- c(1, 1, 1, 1) # define number of each SNP
# specify genomic range for features (repeats)
BRCA2features <- GRanges("chr1", IRanges(c(1, 1002, 1212, 1421, 1517, 1664, 1837, 1971, 2051, 3418), 
                                         width=c(1, 34, 34, 34, 34, 34, 34, 34, 34, 1),
                                         names=paste0("block", 1:3)))
BRCA2features$fill <- c("gray", "green", "green", "green", "green", "green", "green", "green", "green", "gray") # change color
# plot lolliplot
jpeg("geneFigures/BRCA2somatic.jpg")
lolliplot(BRCA2.gr, BRCA2features, ylab = FALSE, yaxis = FALSE, xaxis=c(1, 3418))
dev.off()

## BRCA2 germline UniProt http://www.uniprot.org/uniprot/P51587#showFeaturesViewer
BRCA2snps <- c(289, 326, 372, 991, 2034, 2108, 2440) # enter germline data 
# specify genomic range for SNPs
BRCA2.gr <- GRanges("chr1", IRanges(BRCA2snps, width=1, names=paste0(BRCA2snps)))
BRCA2.gr$color <- "blue" # define SNP color
BRCA2.gr$score <- c(1, 1, 1, 2, 1, 1, 1) # define number of each SNP
# specify genomic range for features (repeats)
BRCA2features <- GRanges("chr1", IRanges(c(1, 1002, 1212, 1421, 1517, 1664, 1837, 1971, 2051, 3418), 
                                         width=c(1, 34, 34, 34, 34, 34, 34, 34, 34, 1),
                                         names=paste0("block", 1:3)))
BRCA2features$fill <- c("gray", "green", "green", "green", "green", "green", "green", "green", "green", "gray") # change color
# plot lolliplot
jpeg("geneFigures/BRCA2.jpg")
lolliplot(BRCA2.gr, BRCA2features, ylab = FALSE, yaxis = FALSE, xaxis=c(1, 3418))
dev.off()

## BRCA1 combined UniProt http://www.uniprot.org/uniprot/P38398#showFeaturesViewer
BRCA1snps <- c(871, 1038, 1183, 1236, 1613, 693, 871, 1038, 1183, 1236, 1613) # enter data (somatic first, then germline)
# specify genomic range for SNPs
BRCA1.gr <- GRanges("chr1", IRanges(BRCA1snps, width=1, names=paste0(BRCA1snps)))
BRCA1.gr$color <- c(replicate(5, "red"), replicate(6, "blue")) # define SNP color
BRCA1.gr$score <- c(1, 1, 1, 1, 1, 1, 2, 2, 2, 1, 2) # define number of each SNP
# specify genomic range for features (zinc finger and domains)
BRCA1features <- GRanges("chr1", IRanges(c(1, 24, 1642, 1756, 1863), 
                                         width=c(1, 41, 94, 99, 1),
                                         names=paste0("block", 1:3)))
BRCA1features$fill <- c("gray", "green", "red", "blue", "gray") # change color
# plot lolliplot
jpeg("geneFigures/BRCA1combined.jpg")
lolliplot(BRCA1.gr, BRCA1features, ylab = FALSE, yaxis = FALSE, xaxis=c(1, 1863), cex=0.8)
dev.off()

## BRCA1 somatic UniProt http://www.uniprot.org/uniprot/P38398#showFeaturesViewer
BRCA1snps <- c(871, 1038, 1183, 1236, 1613) # enter somatic data
# specify genomic range for SNPs
BRCA1.gr <- GRanges("chr1", IRanges(BRCA1snps, width=1, names=paste0(BRCA1snps)))
BRCA1.gr$color <- "red" # define SNP color
BRCA1.gr$score <- c(1, 1, 1, 1, 1) # define number of each SNP
# specify genomic range for features (zinc finger and domains)
BRCA1features <- GRanges("chr1", IRanges(c(1, 24, 1642, 1756, 1863), 
                                         width=c(1, 41, 94, 99, 1),
                                         names=paste0("block", 1:3)))
BRCA1features$fill <- c("gray", "green", "red", "blue", "gray") # change color
# plot lolliplot
jpeg("geneFigures/BRCA1somatic.jpg")
lolliplot(BRCA1.gr, BRCA1features, ylab = FALSE, yaxis = FALSE, xaxis=c(1, 1863), cex=0.8)
dev.off()

## BRCA1 germline UniProt http://www.uniprot.org/uniprot/P38398#showFeaturesViewer
BRCA1snps <- c(693, 871, 1038, 1183, 1236, 1613) # enter germline data
# specify genomic range for SNPs
BRCA1.gr <- GRanges("chr1", IRanges(BRCA1snps, width=1, names=paste0(BRCA1snps)))
BRCA1.gr$color <- "blue" # define SNP color
BRCA1.gr$score <- c(1, 2, 2, 2, 1, 2) # define number of each SNP
# specify genomic range for features (zinc finger and domains)
BRCA1features <- GRanges("chr1", IRanges(c(1, 24, 1642, 1756, 1863), 
                                         width=c(1, 41, 94, 99, 1),
                                         names=paste0("block", 1:3)))
BRCA1features$fill <- c("gray", "green", "red", "blue", "gray") # change color
# plot lolliplot
jpeg("geneFigures/BRCA1germline.jpg")
lolliplot(BRCA1.gr, BRCA1features, ylab = FALSE, yaxis = FALSE, xaxis=c(1, 1863), cex=0.8)
dev.off()

## BARD1 UniProt http://www.uniprot.org/uniprot/Q99728#showFeaturesViewer
BARD1snps <- c(24, 40, 378, 507) # enter data
# specify genomic range 
BARD1.gr <- GRanges("chr1", IRanges(BARD1snps, width=1, names=paste0(BARD1snps)))
BARD1.gr$color <- "red" # define SNP color
BARD1.gr$score <- c(1, 1, 1, 1) # define number of each SNP
# specify genomic range for features (repeats, zinc finger, domain)
BARD1features <- GRanges("chr1", IRanges(c(1, 50, 427, 460, 493, 526, 560, 667, 777), 
                                         width=c(1, 37, 32, 32, 32, 20, 93, 110, 1),
                                         names=paste0("block", 1:3)))
BARD1features$fill <- c("gray", "green", "red", "red", "red", "red", "blue", "yellow", "gray") # change color
# plot lolliplot
jpeg("geneFigures/BARD1.jpg")
lolliplot(BARD1.gr, BARD1features, ylab = FALSE, yaxis = FALSE, xaxis=c(1, 777))
dev.off()

## ATM UniProt http://www.uniprot.org/uniprot/Q13315#showFeaturesViewer
ATMsnps <- c(1853, 1853) # enter data
# specify genomic range for SNPs
ATM.gr <- GRanges("chr1", IRanges(ATMsnps, width=1, names=paste0(ATMsnps)))
ATM.gr$color <- "red" # define SNP color
ATM.gr$score <- c(1, 2) # define number of each SNP
# specify genomic range for features
ATMfeatures <- GRanges("chr1", IRanges(c(1, 1960, 2712, 3024, 3056), 
                                         width=c(1, 606, 250, 32, 1),
                                         names=paste0("block", 1:4)))
ATMfeatures$fill <- c("gray", "green", "red", "blue", "gray") # change color
# plot lolliplot
jpeg("geneFigures/ATM.jpg")
lolliplot(ATM.gr, ATMfeatures, ylab = FALSE, yaxis = FALSE, xaxis=c(1, 3056))
dev.off()

## ERBB2 UniProt http://www.uniprot.org/uniprot/P04626#showFeaturesViewer
ERBB2snps <- c(625, 1140) # enter data
# specify genomic range for SNPs
ERBB2.gr <- GRanges("chr1", IRanges(ERBB2snps, width=1, names=paste0(ERBB2snps)))
ERBB2.gr$color <- "red" # define SNP color
ERBB2.gr$score <- c(3, 3) # define number of each SNP
# specify genomic range for features
ERBB2features <- GRanges("chr1", IRanges(c(1, 720, 1255), 
                                       width=c(1, 267, 1),
                                       names=paste0("block", 1:3)))
ERBB2features$fill <- c("gray", "green", "gray") # change color
# plot lolliplot
jpeg("geneFigures/ERBB2.jpg")
lolliplot(ERBB2.gr, ERBB2features, ylab = FALSE, yaxis = FALSE, xaxis=c(1, 1255))
dev.off()

## PALB2 UniProt http://www.uniprot.org/uniprot/Q86YC2#showFeaturesViewer
PALB2snps <- c(559) # enter data
# specify genomic range for SNPs
PALB2.gr <- GRanges("chr1", IRanges(PALB2snps, width=1, names=paste0(PALB2snps)))
PALB2.gr$color <- "red" # define SNP color
PALB2.gr$score <- c(2) # define number of each SNP
# specify genomic range for features (repeats)
PALB2features <- GRanges("chr1", IRanges(c(1, 837, 1186), 
                                    width=c(1, 349, 1),
                                    names=paste0("block", 1:3)))
PALB2features$fill <- c("gray", "green", "gray") # change color
# plot lolliplot
jpeg("geneFigures/PALB2.jpg")
lolliplot(PALB2.gr, PALB2features, ylab = FALSE, yaxis = FALSE, xaxis=c(1, 1186))
dev.off()
