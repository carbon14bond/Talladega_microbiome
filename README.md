# Talladega Non-Perennial Stream Microbiome Analysis
## This is a work in progress for a manuscript in preparation:

This repository contains code for replicating **preliminary** an analysis of fungal and prokaryotic communities collected from an intermittent stream network, associated with a manuscript (Bond et al. In Preparation).

This research was conducted as part of the AIMS Project (Aquatic Intermittency effects on Microbiomes in Streams), supported by an NSF EPSCoR Track II Grant # OIA 2019603

# Bioinformatics and Analysis Pipelines
This project is composed of three main components:
1) Metadata preparation
   - Combining environmental / hydrographic / biogeochemistry / microbial metadata into a single metadata table for downstream analyses.
   - Map preparation, making the map of the watershed / stream network / sampling sites. 
2) Bioinformatics pipelines
   - dada2 pipelines generating ASV counts and taxonomy:
       - 16S V4 (prokaryotes)
       - ITS (fungi)
          - DECIPHER classifier training for ITS to help improve taxonomy assignment for fungi.
3) Data analysis (processing, statistical tests, and figure generation).
   - Analyses divided into multiple sections (With corresponding Rmarkdown files):
     - 0.1: Overview and rarefaction (summarizing ASV count data and rarefying for downstream analyses).
     - 0.2: Community Composition Analysis (alpha and beta diversity tests, NMDS, Mantel, etc).
     - 0.3: Kingdoms, Phyla, and Classes, Genera and species across stream continuum.
  
This repository is a work in progress and may not yet contain all code or data.

## Introduction
Our non-perennial stream network is located in a 0.92 hectare watershed in the Talladeda National Foest, Alabama, in the Piedmont region. 
STIC sensors deployed across most sites allowed us to estimate the percent of time surface water was present over an 11-month period.
![Figure_1_TAL_map_corrplots_08 28 2025 Large](https://github.com/user-attachments/assets/f207e271-5475-42ce-bf32-858ffb41473e)

![alt text](https://ctbond.weebly.com/uploads/1/5/2/6/152638843/figure1_orig.jpg)

Figure 1) Study watershed and stream network, with STIC sensor-equipped sites colored by the percent of time they were wet over an 11-month period, and non-sensor-equipped sites colored in grey. Sites were also classified as ephemeral or intermittent based on flow permanence, and one beaver pond site was permanent. Some ephemeral sites were dry at the time of sampling, shown on the map as hollow circles. 

### Data availability:
Where needed, references are provided in-line with code for data sources that must be downloaded externally. This is a work in progress, data resources published so far are listed below: 
- Microbial field sampling metadata:
  Bond, C. T., K. A. Kuehn (2025). AIMS_SE_approach2_approach3_MIME, HydroShare, http://www.hydroshare.org/resource/3161225427d8472d9f347068e1afab61
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

### Analyses
The `Analysis` folder contains files needed to replicate all analyses. 
For both 16S and ITS datasets, phyloseq objects containing rarefied count data, taxonomy, and metadata were saved as Rdata files and are availble in the `Analysis` folder. These can be used with the `Analysis` Rmarkdown files to replicate all teests and figures. 
Analysis:
- 0.1: Overview and rarefaction (summarizing ASV count data and rarefying for downstream analyses).
- 0.2: Community Composition Analysis (alpha and beta diversity tests, NMDS, Mantel, etc).
- 0.3: Kingdoms, Phyla, and Classes across stream continuum.
- Bonus analysis (not included in paper) examining predicted gene relative abundance (PICRUSt2) across the stream continuum.

### Analysis 0.1 and 0.2
Leaf litter, rock surfaces, and sediments differed in both prokaryotic and fungal community composition. 
![alt text](https://ctbond.weebly.com/uploads/1/5/2/6/152638843/published/figure2-08-28-2025.jpg?1757785164)
Figure 2) For prokaryotes and fungi, ASV accumulations curves for each substrate across all sites, Venn diagrams showing unique ASVs occurring in substrates, and NMDS plots showing difference between substrates and between intermittent and ephemeral sites. 

### Analysis 0.3
Dominant prokaryotic and fungal phyla or classes across the dry, recently dry, and relatively wet sites. 
![alt text](https://ctbond.weebly.com/uploads/1/5/2/6/152638843/figure-3_orig.jpg)
Figure 3. Bars show average percent abundances in each microhabitat, separated into dry ephemeral sites, wet ephemeral sites, and wet intermittent sites.
   (A) the top prokaryotic phyla, or classes of Pseudomonadota (formerly Proteobacteria).
   (B) the top fungal phyla or classes of Ascomycota. 
   
Generalized linear latent variable models test for correlations between 11-month water persistence and relative abundance of the dominant prokaryotic and fungal genera or species in each microhabitat. 
![alt text](https://ctbond.weebly.com/uploads/1/5/2/6/152638843/figure-4_orig.jpg)

### Bonus
Trends in PICRUSt2-based MetaCyc pathways or KO relative abundances. (A-C) Generalized linear latent variable models testing for correlations between 11-month water persistence and relative abundance of the MetaCyc pathways prokaryotic and fungal genera or species in each microhabitat. 
![alt text](https://ctbond.weebly.com/uploads/1/5/2/6/152638843/figure-5-09-03-2025_orig.jpg)
