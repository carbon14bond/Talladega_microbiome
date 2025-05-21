# Talladega Map, Charles Bond et al. microbiome Tal Synoptic manuscript
#### generating map of sites labeled with metadata

## Shapefiles for maps are available on Hyddroshare:
#### Peterson, D., N. Jones (2025). AIMS_SE_TAL_ENVI, HydroShare, http://www.hydroshare.org/resource/81c003a7b8474d63a31641a4f375fd18

# setup
rm(list = ls())

library(tidyverse)
library(RColorBrewer)
# library(rgdal) # might be necessary to use earlier version of R
library(sf)

theme_set(theme_bw() + theme(
  plot.title = element_text(size=20, color="black"),
  axis.text.x = element_text(size=15, color="black"),
  axis.text.y = element_text(size=15, color="black"),
  axis.title.x = element_text(size=15),
  axis.title.y = element_text(size=15),
  legend.text = element_text(size=12),
  legend.title = element_text(size=15),
  #  legend.position = "bottom",
  #  legend.key=element_blank(),
  #  legend.key.size = unit(0.5, "cm"),
  #  legend.spacing.x = unit(0.1, "cm"),
  #  legend.spacing.y = unit(0.1, "cm"),
  panel.background = element_blank(), 
  #panel.border = element_rect(colour = "black", fill=NA, size=1),
  plot.background = element_blank()))

setwd("/Users/chunk/Talladega_synoptic/meta_prep/map")

talmap<- st_read("streamnetwork_TAL.shp")

talmap_ll <- st_transform(talmap, "+proj=longlat +ellps=WGS84 +datum=WGS84")

talws<- st_read("watershed_TAL.shp")
talws_ll <- st_transform(talws, "+proj=longlat +ellps=WGS84 +datum=WGS84")

#head(st_coordinates(kzmap_ll))
# Check the extent of the transformed data
print(st_bbox(talmap_ll))

# Check the CRS of the transformed data
print(st_crs(talmap_ll))

strmp1 <- ggplot() +
  geom_sf(data = talws_ll) +
  geom_sf(data = talmap_ll) +
  coord_sf(ylim=c(33.7590, 33.7685), xlim = c(-85.607, -85.595))
strmp1

meta_tab<- read.csv("meta_test_05.12.2025.csv", row.names=1)
meta_tab <- meta_tab %>% 
  mutate(class_state = interaction(int_eph, WetDry, sep = "_"))
## percent wet color scale, same as for dbRDA plots
#pal<- c("#046C9A","#3A9AB2","#85B7B9","#ADC397","#DCCB4E","#E5A208","#ED6E04","#F11B00") # too red
#common_limits <- c(0, 1) 
meta_tab$int_eph<-as.factor(meta_tab$int_eph)
intcolcolors<-c("goldenrod","forestgreen","darkblue")

intmap<- ggplot(data=meta_tab, aes(x=long, y=lat, colour=int_eph, shape=WetDry))+
  geom_point(size=3.5)+
  scale_colour_manual(values = intcolcolors)+
  scale_shape_manual(values = c(1,16))
intmap

TALmap <- ggplot() +
  geom_sf(data = talws_ll) +
  geom_sf(data = talmap_ll) +
  coord_sf(ylim=c(33.7576, 33.7715), xlim = c(-85.60915, -85.5952))+
 # coord_sf(ylim=c(39.071, 39.093), xlim = c(-96.595, -96.565))+
  geom_point(data=meta_tab, aes(x=long, y=lat, colour=int_eph, shape=WetDry), size=3.3)+
  #geom_text(data=meta_tab, aes(x=long, y=lat, label = siteId, hjust=1.25, vjust=0.3
  #                             ), size = 1.6)+
  scale_colour_manual(values = intcolcolors)+
  scale_shape_manual(values = c(1,16))+
  labs(legend="right", shape="Wet/Dry:", color="Classification:", x="Longitude", y="Latitude"
  )+ 
  theme(axis.text.x = element_text(size = 8), axis.text.y = element_text(size = 8), legend.title=element_text(size=10), 
        legend.text=element_text(size=10))
TALmap

#meta_tab$classification <- factor(meta_tab$classification, levels = c('ephemeral','intermittent','semipermanent','no_sensor'))

## percent wet color scale, same as for dbRDA plots
pal<- c("#046C9A","#3A9AB2","#85B7B9","#ADC397","#DCCB4E","#E5A208","#ED6E04","#F11B00")
common_limits <- c(0, 1) 
sticwet<- ggplot(data=meta_tab, aes(x=long, y=lat, colour=percentwet_11month))+
  geom_point(size=3.5)+
  scale_colour_gradientn(colors = rev(pal), labels = scales::percent_format(), limits = common_limits)
sticwet

TALmap <- ggplot() +
  geom_sf(data = talws_ll) +
  geom_sf(data = talmap_ll) +
  coord_sf(ylim=c(33.7576, 33.7715), xlim = c(-85.60915, -85.5952))+
  # coord_sf(ylim=c(39.071, 39.093), xlim = c(-96.595, -96.565))+
  geom_point(data=meta_tab, aes(x=long, y=lat, colour=percentwet_11month, shape=class_state), size=3.3)+
  scale_colour_gradientn(colors = rev(pal), labels = scales::percent_format(), limits = common_limits)+
  scale_shape_manual(values = c(1,16,17,15))+
  labs(legend="right", shape="Site class:", color="Percent Wet (11-month avg.):", x="Longitude", y="Latitude"
  )+ 
  theme(axis.text.x = element_text(size = 8), axis.text.y = element_text(size = 8), legend.title=element_text(size=10), 
        legend.text=element_text(size=10))
TALmap


plotout <- "TALmap5.17.2025.tiff"
agg_tiff(filename=plotout, width=2500, height=2000, units="px",
         pointsize=10, res=600, compression="lzw", scaling=0.5)
TALmap
invisible(dev.off())