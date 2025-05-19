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

asvlist<- colnames(asvtab[,1:ncol(asvtab)])

### now export as appropriate format for PICRUSt2 (TSV)
tasvtab<-as.data.frame(t(asvtab))
tasvtab <- tibble::rownames_to_column(tasvtab, "ASV_ID")
library(readr)
write_tsv(tasvtab,"TalSyn_16S_dada2_ASV_counts_for_pricust2_05.19.2025.tsv")

### now filter fastas to remove ASVs not included above:
library("Biostrings")
s <- readDNAStringSet("TalSyn_16S_dada2_ASVs_04.25.2025.fasta")

ns<- s[names(s) %in% asvlist]
head(ns)
library(ShortRead)
fasta_dir <- file.path(getwd(), "refs")
outfile <- file.path(dirname(fasta_dir), "TalSyn_16S_ASV_fasta_for_picrust2.fasta")
writeFasta(ns, outfile, mode = "a")
