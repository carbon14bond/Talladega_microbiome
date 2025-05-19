## PICRUSt2 usage notes

For our PICRUSt2 pipeline, we used the standalone install of picrust2 version 2.5.3., installed on a Mac (MacOS Sequoia v15.3.1), working in the Terminal, with python 3.10.14. 

As inputs, we use:
- ASV FASTA sequences output from our bioinformatics pipeline
- rarefied ASV counts .tsv file generated in the picrust prep Rscript

In the terminal, we ran the complete picrust2 pipeline as follows:

`picrust2_pipeline.py -s TalSyn_16S_dada2_ASVs_04.25.2025.fasta -i TalSyn_16S_dada2_ASV_counts_for_pricust2_04.30.2025.tsv -o picrust2_out_pipeline -p 1`

Outputs were then used in the picrust data analysis .Rmd
