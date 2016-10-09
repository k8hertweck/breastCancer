# plotting mutation types from target breast cancer genes

library(dplyr)
library(tidyr)
library(ggplot2)

# import data
dat <- read.delim("data/combVariants.tsv", row.names=NULL)

# plot by gene and type of mutation
ggplot(dat, aes(Gene, fill=where_in_gene)) + geom_bar(position="dodge") + geom_bar(position="dodge", colour="black", show.legend=FALSE) + scale_fill_brewer(palette="Set1", name="location in\ngene") + ylab("number of mutations") + theme_bw()
ggsave(file="figures/mutations.pdf")

# plot by synonymous/nonsynonymous
CDS <- dat %>%
  select(gene, where_in_gene, annot_cancer) %>%
  filter(where_in_gene == "CDS")
CDS$annot_cancer <- gsub(".*->.*", "nonsynonymous", CDS$annot_cancer)

ggplot(CDS, aes(gene, fill=annot_cancer)) + geom_bar(position="dodge") + geom_bar(position="dodge", colour="black", show.legend=FALSE) + scale_fill_brewer(palette="Set1", name="") + ylab("number of mutations") + theme_bw()
ggsave(file="figures/synnonsyn.pdf")