# creating gene figures in R

source("https://bioconductor.org/biocLite.R")
biocLite("GenVisR")
library(GenVisR)
biocLite("trackViewer")
library(trackViewer)

## GenVisR
# https://github.com/griffithlab/GenVisR#lolliplot-mutation-hotspot-graphic
# Create input data
data <- brcaMAF[brcaMAF$Hugo_Symbol == "TP53", c("Hugo_Symbol", "amino_acid_change_WU")]
data <- as.data.frame(cbind(data, "ENST00000269305"))
colnames(data) <- c("gene", "amino_acid_change", "transcript_name")

# Call lolliplot
lolliplot(data)

data <- brca1[brca1$Hugo_Symbol == "BCRA1", c("Hugo_Symbol", "amino_acid_change_WU")]

## trackViewer
# https://www.bioconductor.org/packages/release/bioc/vignettes/trackViewer/inst/doc/trackViewer.html#steps-of-using
SNP <- c(10, 100, 105, 108, 400, 410, 420, 600, 700, 805, 840, 1400, 1402)
x <- sample.int(100, length(SNP))
sample.gr <- GRanges("chr1", IRanges(SNP, width=1, names=paste0("snp", SNP)))
features <- GRanges("chr1", IRanges(c(1, 501, 1001), 
                                    width=c(120, 400, 405),
                                    names=paste0("block", 1:3)))
lolliplot(sample.gr, features)
