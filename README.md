# Talladega Non-Perennial Stream Microbiome Analysis
The code in this repository replicates the bioinformatics, analysis, and figure generation for a manuscript entitled 
`Microbial communities across a non-perennial stream network in a humid subtropical forest.`
by Charles T. Bond<sup>1</sup>, Delaney M. Peterson<sup>2</sup>, Andrielle L. Kemajou Tchamba<sup>3</sup>, Chelsea R. Smith<sup>2</sup>, Kaci Zarek<sup>2,4</sup>, Stephen Plont<sup>2</sup>, Jerald Ibal<sup>5</sup>, Ethan Rutledge<sup>1</sup>, Allison Stafford<sup>1</sup>, C. Nate Jones<sup>2</sup>, Carla L. Atkinson<sup>2</sup>, Yaqi You<sup>5</sup>, Ken Aho<sup>6</sup>, Colin R. Jackson<sup>3</sup>, Lydia H. Zeglin<sup>7</sup>, Amy J. Burgin<sup>8</sup>, Kevin A. Kuehn<sup>1*</sup>
<sup>1</sup>School of Biological, Environmental, and Earth Sciences, The University of Southern
 Mississippi, Hattiesburg, MS 39406, USA.
<sup>2</sup>Department of Biology, University of Alabama, Tuscaloosa, AL 35487, USA.
<sup>3</sup>Department of Biology, University of Mississippi, University MS 38677, USA.
<sup>4</sup>Department of Ecology and Evolutionary Biology, Cornell University, Ithaca, NY 14850, USA.
<sup>5</sup>Department of Environmental Resources Engineering, The State University of New York, College of Environmental Science and Forestry, Syracuse, NY 13210, USA.
<sup>6</sup>Department of Biological Sciences, Idaho State University, Pocatello, ID 83209, USA.
<sup>7</sup>Division of Biology, Kansas State University, Manhattan, KS 66506, USA.
<sup>8</sup>Department of Ecology, Evolution and Organismal Biology, Iowa State University, Ames, IA, 50011, USA.

## Funding: 
### This research was conducted as part of the AIMS Project (Aquatic Intermittency effects on Microbiomes in Streams), supported by an NSF EPSCoR Track II Grant # OIA 2019603

Summmary:
This study analyzes fungal and prokaryotic communities collected from a non-perennial stream network.

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
     - 0.2: Community Composition Analysis, alpha and beta diversity, NMDS ordinations, Mantel and Partial Mantel tests).
     - 0.3: Kingdoms, Phyla, and Classes, Genera and species across sites, using generalized linear latent variable models (gllvm) to look for taxa trends with water persistence.
  
This repository is a work in progress and may not yet contain all code or data.

## Introduction
Our non-perennial stream network is located in a 0.92 hectare watershed in the Talladeda National Foest, Alabama, in the Piedmont region. 
STIC sensors deployed across most sites allowed us to estimate the percent of time surface water was present over an 11-month period.
![Figure_1_TAL_map_corrplots_08 28 2025 Large](https://github.com/user-attachments/assets/f207e271-5475-42ce-bf32-858ffb41473e)

Figure 1) Study watershed and stream network, with STIC sensor-equipped sites colored by the percent of time they were wet over an 11-month period, and non-sensor-equipped sites colored in black. 

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

![Figure_2_08 28 2025 Large](https://github.com/user-attachments/assets/a2cd5af3-05b7-40ca-b6ec-2342d8a41edc)

Figure 2) For prokaryotes and fungi, ASV accumulations curves for each substrate across all sites, Venn diagrams showing unique ASVs occurring in substrates, and NMDS plots showing difference between substrates and between intermittent and ephemeral sites. 

### Analysis 0.3
Dominant prokaryotic and fungal phyla or classes across the dry, recently dry, and relatively wet sites. 

![Figure_3_taxa-2-panel_08 28 2025 Large](https://github.com/user-attachments/assets/02579523-1599-4cf9-937f-36a6de0d5a6e)


Figure 3. Bars show average percent abundances in each microhabitat, separated into dry ephemeral sites, wet ephemeral sites, and wet intermittent sites.
   (A) the top prokaryotic phyla, or classes of Pseudomonadota (formerly Proteobacteria).
   (B) the top fungal phyla or classes of Ascomycota. 
   
Generalized linear latent variable models test for correlations between 11-month water persistence and relative abundance of the dominant prokaryotic and fungal genera or species in each microhabitat. 

Prokaryotes
![Figure_4_prokaryote_gllvm_01 23 2026 Large](https://github.com/user-attachments/assets/5a12c10a-6be0-4ae7-a93c-978b63897e95)

Fungi
![Figure_5_fungi_gllvm_01 23 2026 Large](https://github.com/user-attachments/assets/bdd99fb2-9a02-49f5-b7ca-d57885fd9ca8)

### Bonus
Trends in PICRUSt2-based MetaCyc pathways or KO relative abundances. (A-C) Generalized linear latent variable models testing for correlations between 11-month water persistence and relative abundance of the MetaCyc pathways prokaryotic and fungal genera or species in each microhabitat. 
![alt text](https://ctbond.weebly.com/uploads/1/5/2/6/152638843/figure-5-09-03-2025_orig.jpg)

# DATA AVAILABILITY.
The data used in this study were produced as part of the Aquatic Intermittency Effects in Microbiomes in Streams (AIMS) project. Links to each dataset are provided below. 
Raw amplicon sequence data (FASTQ):
NCBI SRA repository through the BioProject accensions: 
PRJNA1288562 (16S) and PRJNA1288519 (ITS). 
Microbial field sampling metadata: 
Bond, C. T., K. A. Kuehn (2025). AIMS_SE_approach2_approach3_MIME, HydroShare, http://www.hydroshare.org/resource/3161225427d8472d9f347068e1afab61
Site environmental, hydrographic, and spatial data: 
Peterson, D., N. Jones (2025). AIMS_SE_TAL_ENVI, HydroShare, http://www.hydroshare.org/resource/81c003a7b8474d63a31641a4f375fd18
Stream Temperature, Intermittency, and Conductivity (STIC) logger data: 
Peterson, D., N. Jones (2025). Talladega Stream Temperature, Intermittency, and Conductivity Data (AIMS_SE_TAL_approach1_STIC), HydroShare, http://www.hydroshare.org/resource/ff306bec9fb24e52aa809dbb4d074731
Chlorophyll-a: 
Bond, C. T., A. Stafford, K. A. Kuehn (2025). AIMS_SE_approach2_approach3_CHLA, HydroShare, http://www.hydroshare.org/resource/cd2852e4a0ca4e8d8d65dd3bcd7bd8ad
AFDM:
Bond, C. T., A. L. Kemajou Tchamba, K. A. Kuehn, C. R. Jackson (2025). AIMS_SE_approach2_approach3_AFDM, HydroShare, http://www.hydroshare.org/resource/df5dff9fd883414a8bf91ddeb268e514
Dissolved gasses: 
Zarek, K., A. Burgin, S. Speir (2025). AIMS_SE_Approach3_MIMS, HydroShare, http://www.hydroshare.org/resource/3077feeca19e4bcaaf708d380203be00
Greenhouse gases:
Burgin, A., c. dorantes, S. Plont (2025). AIMS Talladega Greenhouse Gas Data (AIMS_SE_TAL_GHGS), HydroShare, http://www.hydroshare.org/resource/34b55fc99e94410f8db6766511b448bb

