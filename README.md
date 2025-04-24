# Talladega_microbiome

## This is a work in progress for a manuscript in preparation:

Microbial communities across a non-perennial stream continuum in an Alabama Piedmont forest.

Bioinformatics and Data analysis

This repository contains code for replicating an analysis of fungal and prokaryotic communities collected from an intermittent stream network, associated with a manuscript (Bond et al. In Preparation).

This research was conducted as part of the AIMS Project (Aquatic Intermittency effects on Microbiomes in Streams), supported by an NSF EPSCoR Track II Grant # OIA 2019603

### Data availability:
Where needed, references are provided in-line with code for data sources that must be downloaded externally. This is a work in progress, data resources published so far are listed below: 
- Microbial field sampling metadata:
  Bond, C. T., A. Stafford, K. A. Kuehn (2025). AIMS_SE_approach2_approach3_CHLA, HydroShare, http://www.hydroshare.org/resource/cd2852e4a0ca4e8d8d65dd3bcd7bd8ad, accessed on: 04/23/2025
- Chlorophyll-a data:
  Bond, C. T., A. Stafford, K. A. Kuehn (2025). AIMS_SE_approach2_approach3_CHLA, HydroShare, http://www.hydroshare.org/resource/cd2852e4a0ca4e8d8d65dd3bcd7bd8ad
- Stream temperature, intermittency, and relative conductivity logger data used to estimate percent of time sites were wet:
  Peterson, D., N. Jones (2025). Talladega Stream Temperature, Intermittency, and Conductivity Data (AIMS_SE_TAL_approach1_STIC), HydroShare, http://www.hydroshare.org/resource/ff306bec9fb24e52aa809dbb4d074731
- MIMS data (for dissolved oxygen):
  Zarek, K., A. Burgin, S. Speir (2025). AIMS_SE_Approach3_MIMS, HydroShare, http://www.hydroshare.org/resource/3077feeca19e4bcaaf708d380203be00
- NCBI for sequencing data (TBD)


# Bioinformatics and Analysis Pipelines
This project is composed of two main components:
1) The bioinformatics pipelines for 16S and ITS (amplicon sequence processing via dada2).
   and
2) Data analysis (statistical tests and figure generation).

Note the we include some prerequisite code as well:
- Metadata preparation
- DECIPHER classifier training for taxonomic identification of ITS
- Code for running picrust2 for 16S amplicons.

This is a work in progress and we will denote code included so far below:
- DECIPHER classifier training for taxonomic identification of ITS
