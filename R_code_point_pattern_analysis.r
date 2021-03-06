#install spatstat package
install.packages("spatstat")
library(spatstat)

#do not copy in R
# IMPORT DATA FROM AN EXTERNAL SOURCE
# setwd for Windows
# setwd("C:/lab/")
setwd("C:/LAB_2020_2021/")
covid<-read.table("covid_agg.csv", header=TRUE)
covid
attach(covid)

#use spatstat, range x, y (in the dataset are called lon and lat), array= c, set max and min for each variable
covid_planar <- ppp(lon, lat, c(-180,180), c(-90,90))

#density map - function density
density_map<-density(covid_planar)
plot(density_map)

#change colors (100 represent how many colors are in the palette)
cl <- colorRampPalette(c('blue','yellow','orange','red','magenta'))(100) 
plot(density_map, col = cl)
points(covid_planar)
#all potential colors in http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf

#install rgdal
install.packages("rgdal")
library(rgdal)

#data from the folder + overlap the colored graph to the coastline drawing
coastlines <- readOGR("ne_10m_coastline.shp")
plot(density_map, col = cl)
points(covid_planar)
plot(coastlines, add = TRUE)

#colors and graph
cl <- colorRampPalette(c('pink','green','orange','red','magenta'))(100) # 
plot(density_map, col = cl)
points(covid_planar, pch = 19)
plot(coastlines, add = TRUE)

#create and save graph as imagine or pdf -> it will save the file in lab folder
png("figure1.png")
cl <- colorRampPalette(c('pink','green','orange','red','magenta'))(100) #
plot(density_map, col = cl)
points(covid_planar, pch = 19, cex = 0.5)
plot(coastlines, add = TRUE)
dev.off()

#pdf
pdf("figure1.pdf")
cl <- colorRampPalette(c('pink','green','orange','red','magenta'))(100) # 
plot(density_map, col = cl)
points(covid_planar, pch = 19, cex = 0.5)
plot(coastlines, add = TRUE)
dev.off()

#function ggsave to save the file
ggsave("figure1.pdf")
cl <- colorRampPalette(c('pink','green','orange','red','magenta'))(100) # 
plot(density_map, col = cl)
points(covid_planar, pch = 19, cex = 0.5)
plot(coastlines, add = TRUE)
dev.off()

#analyse amount of cases instead of density
marks(covid_planar) <- cases
cases_map <- Smooth(covid_planar)
plot(cases_map, col = cl)
plot(coastlines, add = T)
points(covid_planar)

#plotting points with different size related to covid data together with interpolation
#taking data from outside R
setwd("C:/LAB_2020_2021/")

#recall library
library(spatstat)
library(rgdal)

#racall the data from the folder
covid<-read.table("covid_agg.csv", header=TRUE)
head(covid)
attach(covid)

#create the planar
covid_planar <- ppp(lon, lat, c(-180,180), c(-90,90))

#interpolation
marks(covid_planar) <- cases
cases_map <- Smooth(covid_planar)
cl <- colorRampPalette(c('lightpink2','lightsalmon','tomato1','red3','maroon'))(100)
density_map <- density(covid_planar)
plot(density_map)
plot(cases_map, col = cl)

#install new package
install.packages("sf")
library(sf)

#interpolation and points
covid_planar <- ppp(lon, lat, c(-180, 180), c(-90, 90))
Spoints <- st_as_sf(covid, coords = c("lon", "lat"))
plot(Spoints, cex=Spoints$cases, col = 'purple3', lwd = 3, add=T)
cl <- colorRampPalette(c('lightpink2','lightsalmon','tomato1','red3','maroon'))(100)
plot(cases_map, col = cl)
plot(Spoints, cex=Spoints$cases/10000, col = 'purple3', lwd = 3, add=T)

# add map
library(rgdal)
coastlines <- readOGR("ne_10m_coastline.shp")
plot(coastlines, add=T)

#new exercise
#dati zabotti (external source)
# setwd("C:/lab/")
setwd("C:/LAB_2020_2021/")
leo <- read.table("dati_zabotti.csv", header=T, sep=",")
head(leo)
attach(leo)
library(spatstat)
summary(leo)
#plot point pattern analysis
#min and max for every coordinate should be lower and higher than le lowest and the highest value of each coordinate
leo_ppp <- ppp(x, y, c(2300000,2325000), c(5005000,5045000))

#density map
density_map <- density(leo_ppp)
plot(density_map)
points(leo_ppp)

####
#load an old file
setwd("C:/LAB_2020_2021/")
load("30_11_2020_lesson") #name of the file in lab folder

#make use of spatstat
library(spatstat)
# set and attach the dataset
attach(leo)
# last lesson we plot the points, so we can recall it
marks(leo_ppp) <- chlh
#have colorful map
chlh_map <- Smooth(leo_ppp) 
plot(chlh_map)
points(leo_ppp)

#change colors
cl <- colorRampPalette(c('yellow','orange','red','green'))(100)
plot(chlh_map, col=cl)
points(leo_ppp)

#exercise: sediments
marks(leo_ppp) <- chls
chls_map <- Smooth(leo_ppp) 
plot(chls_map)
points(leo_ppp)

#back to lesson
library(spatstat)
attach(leo)
marks(leo_ppp) <- chlh
chlh_map <- Smooth(leo_ppp)
cl <- colorRampPalette(c('yellow','orange','red','green'))(100)  
plot(chlh_map, col=cl)
points(leo_ppp)

marks(leo_ppp) <- chls
chls_map <- Smooth(leo_ppp)
cl <- colorRampPalette(c('yellow','orange','red','green'))(100)  
plot(chls_map, col=cl)
points(leo_ppp)

# multipanel
par(mfrow=c(1,3))
# first graph: density map
plot(density_map, col=cl)
points(leo_ppp)
#second graph: chlorop. map
plot(chlh_map, col=cl)
points(leo_ppp)plot(chlh_map, col=cl)
    # third graph
plot(chls_map, col=cl)
points(leo_ppp)
points(leo_ppp)

# Exercise: build a multipanel with 3 rows and 1 column
# multipanel
par(mfrow=c(3,1))

 

# first graph: density map
plot(density_map, col=cl)
points(leo_ppp)

 

# second graph
plot(chlh_map, col=cl)
points(leo_ppp)

 

# third graph
plot(chls_map, col=cl)
points(leo_ppp)

 
 
