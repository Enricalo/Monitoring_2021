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

#deforestation example
library(raster)
library(RStoolbox)
setwd("C:/LAB_2020_2021/")

#import several layer of images all together
defor1 <- brick("defor1_.jpg")
#1,2,3 rgb code = plotRGB(defor1, r=1, g=2, b=3, stretch="Lin")
plotRGB(defor1, 1, 2, 3, stretch="Lin")
defor2 <- brick("defor2_.jpg")
plotRGB(defor2, 1, 2, 3, stretch="Lin")

#put images one beside the other
par(mfrow=c(2,1))
plotRGB(defor1, r=1, g=2, b=3, stretch="Lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="Lin")

#dvi = calculating differences between the images and the dataset
[10:22] Duccio Rocchini
    
# dvi for the first period
dvi1 <- defor1$defor1_.1 - defor1$defor1_.2
dev.off()
plot(dvi1)
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme
plot(dvi1, col=cl)

dvi2 <- defor2$defor2_.1 - defor2$defor2_.2
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme
plot(dvi2, col=cl)

par(mfrow=c(2,1))
plot(dvi1, col=cl)
plot(dvi2, col=cl)

par(mfrow=c(2,1))
plot(dvi1, col=cl, main="DVI before cut")
plot(dvi2, col=cl, main="DVI after cut")

# difference biomass before cut and after cut
difdvi <- dvi1 -dvi2
dev.off()
plot(difdvi)
cldif <- colorRampPalette(c('blue','white','red'))(100) 
plot(difdvi, col=cldif)

cldif <- colorRampPalette(c('blue','white','red'))(100) 
#main function to give it a label
plot(difdvi, col=cldif, main="amount of energy lost!")

hist(difdvi, col="red")
 
par(mfrow=c(3,2))
plotRGB(defor1, r=1, g=2, b=3, stretch="Lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="Lin")
plot(dvi1, col=cl, main="biomass before cut")
plot(dvi2, col=cl, main="biomass after cut")
plot(difdvi, col=cldif, main="amount of energy lost!")
hist(difdvi,col="red")
