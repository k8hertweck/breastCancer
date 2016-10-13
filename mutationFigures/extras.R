# extras

library(dplyr)
library(ggplot2)

# number of variants per person
system("cat ../snpsProcessed.lst | tr -d ' ' | grep -v .tsv > temp")
dat <- read.csv("temp", header=FALSE)
ggplot(dat, aes(V1)) + geom_histogram(binwidth = 1) + labs(title="Histogram of number of variants per individual", x="number of variants", y="number of individuals")
ggsave("figures/varPerIndividual.pdf")

# unique variants across all individuals
uniqVar <- read.delim("../combined/uniqVariants.lst")
reorder_size <- function(x) {
  factor(x, levels = names(sort(table(x), decreasing=TRUE)))
}
ggplot(uniqVar, aes(reorder_size(Gene))) + geom_bar() + labs(title="Number of variants in all individuals sampled", x="gene", y="number of variants")
ggsave("figures/totalVariants.pdf")

# plot variation in three individuals with most variants
# BC01, BR03, BR12

# parse and import data
system("cut -f 1-9 ../processed/BC01.csv.table > BC01.csv")
system("cut -f 1-9 ../processed/BR03.csv.table > BR03.csv")
system("cut -f 1-9 ../processed/BR12.csv.table > BR12.csv")
BC01 <- read.delim("BC01.csv")
BR03 <- read.delim("BR03.csv")
BR12 <- read.delim("BR12.csv")

# add identifier
BC01$individual <- "BC01"
BR03$individual <- "BR03"
BR12$individual <- "BR12"
comb <- rbind(BC01, BR03, BR12)

# plot individual
ggplot(BC01, aes(x=Gene, stat=snpEffEffect)) + geom_bar(aes(position="stack", fill=snpEffEffect))

# plot combined
ggplot(comb, aes(x=Gene, stat=snpEffEffect)) + geom_bar(aes(position="stack", fill=snpEffEffect)) + theme_bw() + theme(axis.text.x = element_text(angle=90, vjust=0)) + ylab("number of variants")


# import data
BC01dat <- read.delim("BC01.csv")
BR03dat<-read.delim("BR03.csv")
BR12dat<-read.delim("BR12.csv")

combined <- rbind(BC01dat, BR03dat, BR12dat)
effectList<-combined %>%
  group_by(snpEffEffect)%>%
  tally()
ggplot()+
  geom_bar(data=effectList, aes(x=snpEffEffect,y=n), stat="identity", fill="pink")+
  labs(title="Number of Each Type of Effect",x="Effect Name",y="Amount of Effects")+
  theme_bw()

#Number of effect types vs. number of effects
BCeffectList<-BC01dat%>%
  group_by(snpEffEffect)%>%
  tally()
BR0effectList<-BR03dat%>%
  group_by(snpEffEffect)%>%
  tally()
BR1effectList<-BR12dat%>%
  group_by(snpEffEffect)%>%
  tally()
ggplot()+
  geom_bar(data=BR1effectList, aes(x=snpEffEffect,y=n), stat="identity", fill="pink")+
  geom_bar(data=BCeffectList, aes(x=snpEffEffect,y=n), stat="identity", fill="pink")+
  geom_bar(data=BR0effectList, aes(x=snpEffEffect,y=n),stat="identity", fill="pink")+
  labs(title="Number of Each Type of Effect",x="Effect Name",y="Amount of Effects")+
  theme_bw()

#Number of mutations vs chromsome number
BCmutateList<-BC01dat%>%
  group_by(chromosome,snpEffEffect)%>%
  tally()
BR0mutateList<-BR03dat%>%
  group_by(chromosome,snpEffEffect)%>%
  tally()
BR1mutateList<-BR12dat%>%
  group_by(chromosome,snpEffEffect)%>%
  tally()
ggplot()+
  geom_bar(data=BCmutateList, aes(x=chromosome,y=n), stat="identity", fill="pink")+
  geom_bar(data=BR0mutateList, aes(x=chromosome,y=n),stat="identity", fill="pink")+
  geom_bar(data=BR1mutateList, aes(x=chromosome,y=n), stat="identity", fill="pink")+
  labs(title="Number of Mutations per Chromosome",x="Chromosome",y="Number of Mutations")+
  theme_bw()

#Type of effect vs. gene
BCgeneList<-BC01dat%>%
  group_by(Gene,snpEffEffect)%>%
  tally()
BR0geneList<-BR03dat%>%
  group_by(Gene,snpEffEffect)%>%
  tally()
BR1geneList<-BR12dat%>%
  group_by(Gene,snpEffEffect)%>%
  tally()
ggplot()+
  geom_bar(data=BCgeneList, aes(x=Gene,y=n), stat="identity", fill="pink")+
  geom_bar(data=BR0geneList, aes(x=Gene,y=n),stat="identity", fill="pink")+
  geom_bar(data=BR1geneList, aes(x=Gene,y=n), stat="identity", fill="pink")+
  facet_wrap(~snpEffEffect)+
  labs(title="Number of Mutations per Gene",x="Gene",y="Number of Mutations")+
  theme_bw()+
  theme(axis.text.x=element_text(angle=90))

# plot by synonymous/nonsynonymous
CDS <- dat %>%
  select(gene, where_in_gene, annot_cancer) %>%
  filter(where_in_gene == "CDS")
CDS$annot_cancer <- gsub(".*->.*", "nonsynonymous", CDS$annot_cancer)

ggplot(CDS, aes(gene, fill=annot_cancer)) + geom_bar(position="dodge") + geom_bar(position="dodge", colour="black", show.legend=FALSE) + scale_fill_brewer(palette="Set1", name="") + ylab("number of mutations") + theme_bw()
ggsave(file="figures/synnonsyn.pdf")