library(rgbif)
apis_mel_2010<-occ_data(taxonKey=1341976, scientificName="Apis mellifera",hasCoordinate=TRUE, year=2010)
apis_mel_2010_map<-map_fetch(source="density",x=0, y=0, z=0,format="@1x.png",srs = "EPSG:4326", bin = NULL,hexPerTile = NULL, squareSize = NULL,style = "classic.point",taxonKey = 1341976)
apis_mel_2010_map
library(raster)
plot(apis_mel_2010_map)
