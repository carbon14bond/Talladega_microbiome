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
       - 0.1: Overview (summarizing ASV count data and rarefying for downstream analyses).
       - 0.2: Community Composition (NMDS, dbRDA, variance partitioning, and alpha diversity)
       - 0.3: Analysis of the dominant microbial taxa (GLLVMs)
  
This repository is a work in progress and may not yet contain all code or data.

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

