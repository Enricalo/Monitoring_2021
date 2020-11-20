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
cl <- colorRampPalette(c('white','blue','purprle'))(100)
plot(density_map, col = cl)
points(covid_planar)
#all potential colors in http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf
