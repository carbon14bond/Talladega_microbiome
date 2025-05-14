# Talladega Non-Perennial Stream Microbiome Analysis
## This is a work in progress for a manuscript in preparation:

This repository contains code for replicating **preliminary** an analysis of fungal and prokaryotic communities collected from an intermittent stream network, associated with a manuscript (Bond et al. In Preparation).

This research was conducted as part of the AIMS Project (Aquatic Intermittency effects on Microbiomes in Streams), supported by an NSF EPSCoR Track II Grant # OIA 2019603

# Bioinformatics and Analysis Pipelines
This project is composed of three main components:
1) Metadata preparation
   - Combining various metadata for downstream analyses (i.e., hydrographic, network, and biogeochemistry data from sites).
   - Map preparation, making the map of sites along the network.
2) Bioinformatics pipelines
   - dada2 pipelines for 16S V4 (prokaryotes) and ITS (fungi) to generate ASV counts and taxonomy
   - picrust2 for functional gene estimation for 16S data
   - DECIPHER classifier training to help improve taxonomy assignment for fungi.
3) Data analysis (statistical tests and figure generation).
   - Combined analyses of prokaryote and fungal communities 
   - picrust2 analysis
  
This repository is a work in progress and dos no yet contain all code or data.

## Introduction
Our non-perennial stream network is located in a 0.92 hectare watershed in the Talladeda National Foest, Alabama, in the Piedmont region. 
STIC sensors deployed across most sites allowed us to estimate the percent of time surface water was present over an 11-month period.
![alt text](https://ctbond.weebly.com/uploads/1/5/2/6/152638843/tal-map-prc-wet_orig.png)
Figure 1) Map of the stream network, with all samplling locations indicated by shapes. 

### Data availability:
Where needed, references are provided in-line with code for data sources that must be downloaded externally. This is a work in progress, data resources published so far are listed below: 
- Microbial field sampling metadata:
  Bond, C. T., A. Stafford, K. A. Kuehn (2025). AIMS_SE_approach2_approach3_CHLA, HydroShare, http://www.hydroshare.org/resource/cd2852e4a0ca4e8d8d65dd3bcd7bd8ad, accessed on: 04/23/2025
- Hydrographic / Environmental data
  Peterson, D., N. Jones (2025). AIMS_SE_TAL_ENVI, HydroShare, http://www.hydroshare.org/resource/81c003a7b8474d63a31641a4f375fd18
- Chlorophyll-a data:
  Bond, C. T., A. Stafford, K. A. Kuehn (2025). AIMS_SE_approach2_approach3_CHLA, HydroShare, http://www.hydroshare.org/resource/cd2852e4a0ca4e8d8d65dd3bcd7bd8ad
- Stream temperature, intermittency, and relative conductivity logger data used to estimate percent of time sites were wet:
  Peterson, D., N. Jones (2025). Talladega Stream Temperature, Intermittency, and Conductivity Data (AIMS_SE_TAL_approach1_STIC), HydroShare, http://www.hydroshare.org/resource/ff306bec9fb24e52aa809dbb4d074731
- MIMS (dissolved O2, N2, and Ar):
  Zarek, K., A. Burgin, S. Speir (2025). AIMS_SE_Approach3_MIMS, HydroShare, http://www.hydroshare.org/resource/3077feeca19e4bcaaf708d380203be00
- Dissolved Greenhouse (CO2, CH4, N2O)

- NCBI for sequencing data (TBD)

### Preliminary analysis
Leaf litter, rock surfaces, and sediments differed in both prokaryotic and fungal community composition. 
![alt text](https://ctbond.weebly.com/uploads/1/5/2/6/152638843/beta-sixway-05-13-2025_orig.png)
Figure 2) For prokaryotes and fungi, ASV accumulations curves for each substrate across all sites, Venn diagrams showing unique ASVs occurring in substrates, and NMDS plots showing difference between substrates and between intermittent and ephemeral sites. 
