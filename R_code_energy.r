library(rasterdiv)

#load the data
data(copNDVI)
plot(copNDVI)
copNDVI <- reclassify(copNDVI, cbind(253:255, NA))
install.packages("rasterVis")
library(rasterVis)
levelplot(copNDVI)
clymin <- colorRampPalette(c('yellow','red','blue'))(100) #
plot(copNDVI, col=clymin)

 #how to lie with colors - human eyes percive yellow more than other colors
 clymed <- colorRampPalette(c('red','yellow','blue'))(100) # 
plot(copNDVI, col=clymed)
clymax <- colorRampPalette(c('red','blue','yellow'))(100) #
plot(copNDVI, col=clymax)

#compare two maps
par(mfrow=c(1,2))
clymed <- colorRampPalette(c('red','yellow','blue'))(100) #
plot(copNDVI, col=clymed)
clymax <- colorRampPalette(c('blue','red','yellow'))(100) #
plot(copNDVI, col=clymax)

#crop the map on a specific place in the world
#define the extent
ext <- c(0,20,35,55)  # xmin xmax ymin ymax
#ext is a fixed argument so you must write it like this
#give it a name
copNDVI_Italy <- crop(copNDVI, ext)
plot(copNDVI_Italy, col=clymax)
