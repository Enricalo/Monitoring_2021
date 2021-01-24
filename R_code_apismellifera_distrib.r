#comparing apis mellifera occurence data in 2010,2019,2020 (From gbif) with environmental data: FCOVER, land surface temperature from Copernicus

#recall library useful for maps and occurence data analysis
library(maptools)
library(rgeos)
library(raster)
library(rgdal)
library(dismo)
library(readr)

#download map layer
data("wrld_simpl")
#read excel file, gbif download are in tab
apis2010 <- read_delim("apis2010.csv", "\t", escape_double = FALSE, trim_ws = TRUE)
View(apis2010)
#plot the map layer
plot(wrld_simpl) 
#plot the point layer, $ to link variable and dataset together
points(apis2010$decimalLongitude, apis2010$decimalLatitude, col="red", pch=1, cex = 0.3)
#dataset bias: data from several nations are missing

