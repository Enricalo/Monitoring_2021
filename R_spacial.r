# R spacial
library(sp)
data(meuse)
head(meuse)

# dataset coordinates x-y 
# ~  and + are used to group things in the dataset
coordinates(meuse) = ~x+y

#plot
plot(meuse)

#see the spread of one of the element in space (in our dataset) - use "" to choose the coloumn to plot
spplot (meuse, "zinc")

# Exercise: plot the spatial amount of copper
spplot(meuse, "copper", main="Copper concentration")

#plot two variables together
spplot(meuse, c("copper","zinc"))

#bubble plot 
bubble(meuse, "zinc")

# Exercise: bubble lead in red
bubble(meuse, "lead", main="lead concentration", col="red")

#install ggplot and open it
instal.packages("ggplot2")
library(ggplot2)

#build a new set
#biofuels data set. array values "c"
biofuels <- c(120,200,350,570,750)
#enzimes data set
oxydative <- c(1200,1300,21000,34000,50000)

#build the table
D<-data.frame (biofuels,oxydative)
D

#ggplot data.frame -> table and plot
ggplot(D, aes(x=biofuels , y=oxydative)) + geom_point()

#make it better
ggplot(D, aes(x = biofuels, y = oxydative)) + geom_point(size = 5, col = "red")
ggplot(D, aes(x = biofuels, y = oxydative)) + geom_line(size = 5, col = "red")
ggplot(D, aes(x = biofuels, y = oxydative)) + geom_point(size = 5, col = "red")  +  geom_line()
ggplot(D, aes(x = biofuels, y = oxydative)) + geom_polygon()

## IMPORT DATA FROM AN EXTERNAL SOURCE (set working directory("disc:/name of the folder/")
setwd("C:/LAB_2020_2021/")

#import dataset from outside -> read.table("name of the file", header=TRUE) 
#header=TRUE we tell R that the first row is made by the name of each column #header=FALSE the data start from the first row
covid<-read.table("covid_agg.csv", header=TRUE)
head(covid)
summary(covid)

#make use of ggplot
#first, choose the library. then ask for the graph. lon and lat are the name of the columns, and the coordinates of our data
library(ggplot2)
ggplot(covid, aes(x=lon, y=lat)) + geom_point()

#change the size of the graph, according to the amount of data for each point
ggplot(covid, aes(x=lon, y=lat, size=cases)) + geom_point()

