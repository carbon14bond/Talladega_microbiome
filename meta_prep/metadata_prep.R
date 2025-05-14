# Metadata preparation
## Step 1:Setup
rm(list = ls())
library(tidyverse)
setwd("/Users/chunk/Talladega_synoptic/meta_prep")

## Step 2: Load data
###### Field sampling metadata  
# Bond, C. T., A. Stafford, K. A. Kuehn (2025). AIMS_SE_approach2_approach3_CHLA, HydroShare, http://www.hydroshare.org/resource/cd2852e4a0ca4e8d8d65dd3bcd7bd8ad, accessed on: 04/23/2025
micmet <- read.csv("MIME_SE_TAL_20220124-20240129_V1.0.csv")
row.names(micmet)<- micmet$Sample_ID

###### Chlorophyll-a data:
# Bond, C. T., A. Stafford, K. A. Kuehn (2025). AIMS_SE_approach2_approach3_CHLA, HydroShare, http://www.hydroshare.org/resource/cd2852e4a0ca4e8d8d65dd3bcd7bd8ad
chla <- read.csv("CHLA_SE_TAL_20220124_20240129.V1.0.csv")
row.names(chla)<- chla$Sample_ID

###### Ash-free dry mass
# Link TBD
afdm<- read.csv("preliminary_AFDM.csv")
row.names(afdm)<- afdm$Sample_ID
###### Disolved gasses data (MIMS)
#MIMS data (for dissolved oxygen): Zarek, K., A. Burgin, S. Speir (2025). AIMS_SE_Approach3_MIMS, HydroShare, http://www.hydroshare.org/resource/3077feeca19e4bcaaf708d380203be00
MIMS <- read.csv("MIMS_SE_Approach3_20220609_20220610_V1.0.csv")

###### Hydrographic / hydrologic / topographic data
#ENVI <- x
#### Note, percent of time sites were wet wwas prviously generated from sensor data described here:
#Stream temperature, intermittency, and relative conductivity logger data used to estimate percent of time sites were wet: Peterson, D., N. Jones (2025). Talladega Stream Temperature, Intermittency, and Conductivity Data (AIMS_SE_TAL_approach1_STIC), HydroShare, http://www.hydroshare.org/resource/ff306bec9fb24e52aa809dbb4d074731
### 
### Step 3: Merge data
meta_test<- merge(micmet[,1:47], chla[,14:16], by= 'row.names', all=TRUE)
row.names(meta_test)<- meta_test$Row.names

meta_test<- merge(meta_test[,2:ncol(meta_test)], afdm[,7:16], by= 'row.names', all=TRUE)
row.names(meta_test)<- meta_test$Row.names

### Select only the Talladega synoptic (June 2022)
meta_test<- meta_test[meta_test$Event=='Jun_2022',]

### now merge with synoptic gas data by site (after selecting Jun_2022, there should only be one sample per site)
row.names(MIMS)<- MIMS$siteId
row.names(meta_test)<- meta_test$siteId
meta_test<- merge(meta_test[,2:ncol(meta_test)], MIMS[,7:16], by= 'row.names', all=TRUE)
row.names(meta_test)<- meta_test$siteId
meta_test<-meta_test[,2:ncol(meta_test)]

### Greenhouse gases
GHGs <- read.csv("GHGS_SE_Approach3_TAL_20220609_20220610_V1.0.csv")
row.names(GHGs)<- GHGs$siteId
meta_test<- merge(meta_test, GHGs[,3:8], by= 'row.names', all=TRUE)
row.names(meta_test)<- meta_test$siteId
meta_test<-meta_test[,2:ncol(meta_test)]

### Environmental / Hydrographic data
#Peterson, D., N. Jones (2025). AIMS_SE_TAL_ENVI, HydroShare, http://www.hydroshare.org/resource/81c003a7b8474d63a31641a4f375fd18
ENVI <- read.csv("ENVI_SE_TAL.csv")
row.names(ENVI)<- ENVI$siteId
meta_test<- merge(meta_test, ENVI[,2:11], by= 'row.names', all=FALSE)
row.names(meta_test)<- meta_test$siteId
meta_test<-meta_test[,2:ncol(meta_test)]

### STIC data, derived from: 
STIC<- read.csv("STIC_averages.csv")
row.names(STIC)<- STIC$siteId
meta_test<- merge(meta_test, STIC[,2:13], by= 'row.names', all=FALSE)
row.names(meta_test)<- meta_test$siteId
meta_test<-meta_test[,2:ncol(meta_test)]

write.csv(meta_test, "meta_test_05.12.2025.csv")
