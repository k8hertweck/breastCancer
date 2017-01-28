# plotting mutation types from target breast cancer genes

library(dplyr)
library(tidyr)
library(ggplot2)

## all somatic mutations
# import data
datAll <- read.delim("mutationFigures/combVariants.csv", row.names=NULL)
# filter out inframe deletions (not really somatic)
datAll <- datAll %>%
  filter(where_in_gene != "inframe_deletion")

# plot by gene and type of mutation
# blue is synonymous, red is missense
ggplot(datAll, aes(Gene, fill=where_in_gene)) + 
  geom_bar(position="dodge") + 
  geom_bar(position="dodge", colour="black", show.legend=FALSE) + 
  scale_fill_brewer(palette="Set1") + 
  ylab("number of somatic mutations from all samples") + 
  xlab("genes harboring mutations") +
  scale_y_continuous(breaks=seq(1,10, 1)) +
  theme_bw() + 
  guides(fill=FALSE)
ggsave(file="mutationFigures/variantsAll.jpg")

# unique somatic mutations
datUniq <- read.delim("mutationFigures/uniqVariants.csv", row.names=NULL)
# filter out inframe deletions (not really somatic)
datUniq <- datUniq %>%
  filter(where_in_gene != "inframe_deletion")

# plot by gene and type of mutation
# blue is synonymous, red is missense
ggplot(datUniq, aes(Gene, fill=where_in_gene)) + 
  geom_bar(position="dodge") + 
  geom_bar(position="dodge", colour="black", show.legend=FALSE) + 
  scale_fill_brewer(palette="Set1") + 
  ylab("number of unique somatic mutations among all samples") + 
  xlab("genes harboring mutations") +
  theme_bw() + 
  guides(fill=FALSE)
ggsave(file="mutationFigures/variantsUniq.jpg")
