### Rarefy 16S Count table for PICRUSt2

### Load count table output from 16S dada2 pipeline
asvtab <- read.table("/Users/kuehnlab/AIMS_Talladega_synoptic/16S/dada2_16S_TalSyn_CTB/TalSyn_16S_dada2_ASVs_04.25.2025.count_table", header=T, row.names=1, check.names=F, sep="\t")

## summarize read depths
summary(rowSums(asvtab))

### rarefy to minimum depth 
dmin<- min(rowSums(asvtab))
library(GUniFrac)
rarefied <- Rarefy(asvtab, dmin)
rarefied <-as.data.frame(rarefied$otu.tab.rff)
### check 
summary(rowSums(rarefied))

## format for PICRUSt2
rarefiedt<- as.data.frame(t(rarefied))
rarefiedt <- tibble::rownames_to_column(rarefiedt, "ASV_ID")
library(readr)
write_tsv(rarefiedt,"TalSyn_16S_dada2_ASV_counts_for_pricust2_04.30.2025.tsv")
