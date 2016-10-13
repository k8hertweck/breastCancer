# plotting mutation types from target breast cancer genes

library(dplyr)
library(tidyr)
library(ggplot2)

# import data
dat <- read.delim("mutationFigures/combVariants.tsv", row.names=NULL)
# filter out synonymous variants
datFunc <- dat %>%
    filter(where_in_gene != "synonymous_variant")

# plot by gene and type of mutation
ggplot(datFunc, aes(Gene, fill=where_in_gene)) + geom_bar(position="dodge") + geom_bar(position="dodge", colour="black", show.legend=FALSE) + scale_fill_brewer(palette="Set1", name="location in\ngene") + ylab("number of mutations") + theme_bw() + guides(fill=FALSE)
ggsave(file="mutationFigures/mutations.pdf")
ggsave(file="mutationFigures/mutations.jpg")
