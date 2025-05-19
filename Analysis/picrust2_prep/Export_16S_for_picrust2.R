### Rarefy 16S Count table for PICRUSt2

library('tidyverse')
library('phyloseq')

## Following Analysis 0.1, used rarefied 16S phyloseq object 
setwd("/Users/kuehnlab/AIMS_Talladega_synoptic/picrust2_prep")
load("pseqtest16S.rdata")
pseqtest16S

asvtab<-as.data.frame(pseqtest16S@otu_table)

## sanity check to confirm this is the rarefied data: summarize read depths
summary(rowSums(asvtab))

### now export as appropriate format for PICRUSt2 (TSV)
asvtab <- tibble::rownames_to_column(asvtab, "ASV_ID")
library(readr)
write_tsv(asvtab,"TalSyn_16S_dada2_ASV_counts_for_pricust2_05.19.2025.tsv")

