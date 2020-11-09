#plotting the relationships among ecological variables

#Download and install packages from CRAN-like repositories or from local files. always remember, the name of the package has to be written in ("") because the package is outside R

install.packages("sp")

#use the package -> library function or require funcion

library(sp)

#recall datasets -> function data

data(meuse)

#look inside the set

meuse

#another way to view the data -> View function (with the capital letter!)

View(meuse)

#read only the first lines -> function head

head(meuse)

#mean of all the variables -> function summary is the quickest way to do it = all univariate statistics for all the value in the data set
summary(meuse)

#make an x and y plot with cadmium and zinc
#error -> R doesn't find the data
plot(cadmium,zinc)
#use $ to link the element and the data set
plot(meuse$cadmium,meuse$zinc)

#link all the variables to the data set, you don't need $ -> function attach
attach(meuse)

#plot other variables 
plot(cadmium,lead)

#let's see if there are other relationships among all the variables -> scatterplot matrix -> function pairs
pairs(meuse)

#EXERCISE
#how to pair only the elements part of the data set (cadmium,copper,lead and zinc). Remembrer to put the , (=start from here)
pairs(meuse[,3:6])

#you can do it with the names of the coloumns. ~ this means "=" in R
pairs(~ cadmium + copper + lead + zinc, data = meuse)

#change the colour
pairs(meuse[,3:6], col="blue")

#change shape
pairs(meuse[,3:6], col="blue", pch=17)

#change size
pairs(meuse[,3:6], col="blue", pch=17, cex=3)
