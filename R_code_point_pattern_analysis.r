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

#use spatstat, range x, y (in the dataset are called lon and lat), array= c, max and min for each variable
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
library(rgidal)

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


