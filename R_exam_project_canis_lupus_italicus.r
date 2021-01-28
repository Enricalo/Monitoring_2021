library(raster) #
library(readr) #
library(ncdf4) #

setwd("C:/LAB_2020_2021/")

#recall geographic data from raster package
#altitude data, crop map on Italy
IT<-getData('alt', country='IT', mask=TRUE, col=cl)

#alternative map
#library(maptools)
#data("wrld_simpl")
#plot(wrld_simpl)
#plot(wrld_simpl, xlim=c(10,15), ylim=c(36,48), axes=T)
#map not detailed enough

#first graph wolf distribution 2010-2015
wolf1015 <- read_delim("canislupus1015.csv", "\t", escape_double = FALSE, trim_ws = TRUE)
#change colors to look like a geographical map on a book
cl1 <- colorRampPalette(c('darkolivegreen2','darkolivegreen4', 'chocolate', 'chocolate4', 'coral4', 'brown4', 'grey34', 'grey58', 'grey', 'white'))(100) #
#plot new colors and name
plot(IT, col=cl1, , main="wolf_2010_2015")
#plot points about wolfs occurence data in Italy from 2010 to 2015
wolf_2010_2015<-points(wolf1015$decimalLongitude, wolf1015$decimalLatitude, col="turquoise1", pch=19, cex = 0.7)

#second graph wolf distribution 2018-2020

wolf1820 <- read_delim("canislupus1820.csv", "\t", escape_double = FALSE, trim_ws = TRUE)

#recall geographic data from raster package
#altitude data, crop map on Italy
#IT<-getData('alt', country='IT', mask=TRUE, col=cl)
#change colors to look like a geographical map on a book
#cl1 <- colorRampPalette(c('darkolivegreen2','darkolivegreen4','gold4','sienna1', 'chocolate4', 'brown', 'brown4', 'orangered4','grey58', 'white'))(100) #
#plot new colors
plot(IT, col=cl1, main="wolf_2018_2020")
#plot points about wolfs occurence data in Italy from 2010 to 2015
points(wolf1820$decimalLongitude, wolf1820$decimalLatitude, col="black", pch=19, cex = 0.7)

#compare
par(mfrow=c(1,2))

plot(IT, col=cl1, , main="wolf_2010_2015")
points(wolf1015$decimalLongitude, wolf1015$decimalLatitude, col="turquoise1", pch=19, cex = 0.7, main="wolf_2010_2015")

plot(IT, col=cl1, main="wolf_2018_2020")
points(wolf1820$decimalLongitude, wolf1820$decimalLatitude, col="black", pch=19, cex = 0.7, main="wolf_2018_2020")


#save picture
png("wolf_occurences_2010_2020.png")
par(mfrow=c(1,2))

plot(IT, col=cl1, , main="wolf_2010_2015")
points(wolf1015$decimalLongitude, wolf1015$decimalLatitude, col="turquoise1", pch=19, cex = 0.7, main="wolf_2010_2015")

plot(IT, col=cl1, main="wolf_2018_2020")
points(wolf1820$decimalLongitude, wolf1820$decimalLatitude, col="black", pch=19, cex = 0.7, main="wolf_2018_2020")

dev.off()

#clear the screen
dev.off()



###
#plot preys during the years

#plot wild boars 2010 2015
boar1015 <- read_delim("susscrofa1015.csv", "\t", escape_double = FALSE, trim_ws = TRUE)

#recall geographic data from raster package
#altitude data, crop map on Italy

plot(IT, col=cl1, main="wild_boar_prey_2010_2015")
#plot points about boars occurence data in Italy from 2010 to 2015
points(boar1015$decimalLongitude, boar1015$decimalLatitude, col="turquoise1", pch=17, cex = 0.7, main="boar_2010_2015")

#plot wild boars 2018 2020
boar1820 <- read_delim("susscrofa1820.csv", "\t", escape_double = FALSE, trim_ws = TRUE)

#recall geographic data from raster package
#altitude data, crop map on Italy

plot(IT, col=cl1, main="wild_boar_prey_2018_2020")
#plot points about boars occurence data in Italy from 2010 to 2015
points(boar1820$decimalLongitude, boar1820$decimalLatitude, col="black", pch=17, cex = 0.7, main="boar_2018_2020")

#compare
par(mfrow=c(1,2))

plot(IT, col=cl1, main="wild_boar_prey_2010_2015")
points(boar1015$decimalLongitude, boar1015$decimalLatitude, col="turquoise1", pch=17, cex = 0.7, main="boar_2010_2015")

plot(IT, col=cl1, main="wild_boar_prey_2018_2020")
points(boar1820$decimalLongitude, boar1820$decimalLatitude, col="black", pch=17, cex = 0.7, main="boar_2018_2020")

# save picture
png("boar_occurences_2010_2020.png")
par(mfrow=c(1,2))

plot(IT, col=cl1, main="wild_boar_prey_2010_2015")
points(boar1015$decimalLongitude, boar1015$decimalLatitude, col="turquoise1", pch=17, cex = 0.7, main="boar_2010_2015")

plot(IT, col=cl1, main="wild_boar_prey_2018_2020")
points(boar1820$decimalLongitude, boar1820$decimalLatitude, col="black", pch=17, cex = 0.7, main="boar_2018_2020")

dev.off()

#clear the screen
dev.off()


#plot deers 2010 2015
deer1015 <- read_delim("cervelaph1015.csv", "\t", escape_double = FALSE, trim_ws = TRUE)

#recall geographic data from raster package
#altitude data, crop map on Italy
plot(IT, col=cl1, main="deer_prey_2010_2015")

#plot points about deers occurence data in Italy from 2010 to 2015
points(deer1015$decimalLongitude, deer1015$decimalLatitude, col="turquoise1", pch=17, cex = 0.7, main="deer_2010_2015")

#plot deers 2018 2020
deer1820 <- read_delim("cervelaph1820.csv", "\t", escape_double = FALSE, trim_ws = TRUE)

#recall geographic data from raster package
#altitude data, crop map on Italy
plot(IT, col=cl1, main="deer_prey_2018_2020")

#plot points about deers occurence data in Italy from 2010 to 2015
points(deer1820$decimalLongitude, deer1820$decimalLatitude, col="black", pch=17, cex = 0.7, main="deer_2018_2020")

#compare 
par(mfrow=c(1,2))

plot(IT, col=cl1, main="deer_prey_2010_2015")
points(deer1015$decimalLongitude, deer1015$decimalLatitude, col="turquoise1", pch=17, cex = 0.7, main="deer_2010_2015")

plot(IT, col=cl1, main="deer_prey_2018_2020")
points(deer1820$decimalLongitude, deer1820$decimalLatitude, col="black", pch=17, cex = 0.7, main="deer_2018_2020")

#save picture
png("deer_occurences_2010_2020.png")
par(mfrow=c(1,2))

plot(IT, col=cl1, main="deer_prey_2010_2015")
points(deer1015$decimalLongitude, deer1015$decimalLatitude, col="turquoise1", pch=17, cex = 0.7, main="deer_2010_2015")

plot(IT, col=cl1, main="deer_prey_2018_2020")
points(deer1820$decimalLongitude, deer1820$decimalLatitude, col="black", pch=17, cex = 0.7, main="deer_2018_2020")

dev.off()

#clear the screen
dev.off ()

####
#plot the spatial extent of vegetation cover
#download copernicus data FCOVER May 2010 and May 2020
#plot the data

FCOVER2010 <- raster("c_gls_FCOVER_201005240000_GLOBE_VGT_V1.4.1.nc")
cl2 <- colorRampPalette(c('tan2','tan4','sienna','darkolivegreen2','darkolivegreen4','darkgreen'))(100) #
plot(FCOVER2010, col=cl2, main="VegetationIndex_2010")
ext <- c(0,20,35,55) # xmin xmax ymin ymax
FCOVER2010_Italy <- crop(FCOVER2010, ext)
plot(FCOVER2010_Italy, col=cl2, , main="VegetationIndex_2010")
#save a picture
png("FCOVER2010.png")
plot(FCOVER2010_Italy, col=cl2, main="VegetationIndex_2010")
dev.off()

FCOVER2020 <- raster("c_gls_FCOVER_202005240000_GLOBE_PROBAV_V1.5.1.nc")
cl2 <- colorRampPalette(c('tan2','tan4','sienna','darkolivegreen2','darkolivegreen4','darkgreen'))(100) #
plot(FCOVER2020, col=cl2, main="VegetationIndex_2020")
ext <- c(0,20,35,55) # xmin xmax ymin ymax
FCOVER2020_Italy <- crop(FCOVER2020, ext)
plot(FCOVER2020_Italy, col=cl2, , main="VegetationIndex_2020")
#save a picture
png("FCOVER2020.png")
plot(FCOVER2020_Italy, col=cl2, main="VegetationIndex_2020")
dev.off()

#differences between the two images
#Was there any increase in vegetation cover?
cldif<-colorRampPalette(c('grey58', 'sienna4', 'green4', 'orange', 'gold', 'yellow'))(100) #
difV<- FCOVER2010_Italy - FCOVER2020_Italy
plot(difV, col=cldif, main="VegetationIndex_changes_10years")
#save a picture
png("difference_FCOVER.png")
plot(difV, col=cldif, main="VegetationIndex_changes_10years")
dev.off()


#compare 

par(mfrow=c(2,4))

#wolf
plot(IT, col=cl1, , main="wolf_2010_2015")
points(wolf1015$decimalLongitude, wolf1015$decimalLatitude, col="yellow1", pch=19, cex = 0.7, main="wolf_2010_2015")

#boar
plot(IT, col=cl1, main="wild_boar_prey_2010_2015")
points(boar1015$decimalLongitude, boar1015$decimalLatitude, col="turquoise1", pch=17, cex = 0.7, main="boar_2010_2015")

#deer
plot(IT, col=cl1, main="deer_prey_2010_2015")
points(deer1015$decimalLongitude, deer1015$decimalLatitude, col="turquoise1", pch=17, cex = 0.7, main="deer_2018_2020")

#vegetation
plot(FCOVER2010_Italy, col=cl2, main="VegetationIndex_2010")

##
#second row 2020

#wolf
plot(IT, col=cl1, main="wolf_2018_2020")
points(wolf1820$decimalLongitude, wolf1820$decimalLatitude, col="yellow1", pch=19, cex = 0.7, main="wolf_2018_2020")

#boar
plot(IT, col=cl1, main="wild_boar_prey_2018_2020")
points(boar1820$decimalLongitude, boar1820$decimalLatitude, col="black", pch=17, cex = 0.7, main="boar_2018_2020")

#deer
plot(IT, col=cl1, main="deer_prey_2018_2020")
points(deer1820$decimalLongitude, deer1820$decimalLatitude, col="black", pch=17, cex = 0.7, main="deer_2018_2020")

#vegetation
plot(FCOVER2020_Italy, col=cl2, main="VegetationIndex_2020")


#save picture
png("final_considerations_2010_2020.png")
par(mfrow=c(2,4))

plot(IT, col=cl1, , main="wolf_2010_2015")
points(wolf1015$decimalLongitude, wolf1015$decimalLatitude, col="yellow1", pch=19, cex = 0.7, main="wolf_2010_2015")
plot(IT, col=cl1, main="wild_boar_prey_2010_2015")
points(boar1015$decimalLongitude, boar1015$decimalLatitude, col="turquoise1", pch=17, cex = 0.7, main="boar_2010_2015")
plot(IT, col=cl1, main="deer_prey_2010_2015")
points(deer1015$decimalLongitude, deer1015$decimalLatitude, col="turquoise1", pch=17, cex = 0.7, main="deer_2018_2020")

plot(FCOVER2010_Italy, col=cl2, main="VegetationIndex_2010")

plot(IT, col=cl1, main="wolf_2018_2020")
points(wolf1820$decimalLongitude, wolf1820$decimalLatitude, col="yellow1", pch=19, cex = 0.7, main="wolf_2018_2020")
plot(IT, col=cl1, main="wild_boar_prey_2018_2020")
points(boar1820$decimalLongitude, boar1820$decimalLatitude, col="black", pch=17, cex = 0.7, main="boar_2018_2020")
plot(IT, col=cl1, main="deer_prey_2018_2020")
points(deer1820$decimalLongitude, deer1820$decimalLatitude, col="black", pch=17, cex = 0.7, main="deer_2018_2020")

plot(FCOVER2020_Italy, col=cl2, main="VegetationIndex_2020")

dev.off()

#the end
