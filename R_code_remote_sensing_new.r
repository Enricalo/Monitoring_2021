#install ruster and RStoolbox
#remote sensing data analysis in ecosystems

library(raster)
library(RStoolbox)
setwd("C:/LAB_2020_2021/")
#aploading remote sensing data -> brick
#name of file and data: path, row and year
#copypaste the name of the file to analyse after the function
p224r63_2011 <- brick("p224r63_2011_masked.grd")
p224r63_2011
#it shows each layer with different light sensitiveness (infrared ecc). georef system is in meters
#landstat band desctiption to see the layer division with light wavelenghts

#plot the data
plot(p224r63_2011)
#different color for each pic
cl <- colorRampPalette(c('black','grey','light grey'))(100) # 
plot(p224r63_2011, col=cl)

#setting new colors for the graph, different color for each one
par(mfrow=c(2,2))
#set each layer as a single column of a dataset
clb <- colorRampPalette(c('dark blue','blue','light blue'))(100) # 

plot(p224r63_2011$B1_sre, col=clb)
clg <- colorRampPalette(c('dark green','green','light green'))(100) # 
plot(p224r63_2011$B2_sre, col=clg)
clr <- colorRampPalette(c('dark red','red','pink'))(100) # 
plot(p224r63_2011$B3_sre, col=clr)
cly <- colorRampPalette(c('red','orange','yellow'))(100) # 
plot(p224r63_2011$B4_sre, col=cly)

#clear the previous graph
dev.off()
#use the tv color scheme RGB, each layer has its color/ how the landscape appear to human eyes
#add stretch to have clearer image
plotRGB (p224r63_2011, r=3, g=2, b=1, stretch="lin")

#near infrared vision
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
#it is os red because the highest amount of near infrared reflectance has been put in the red color based on the code we've written so leaves are all red

#switch the layer-color correspondance
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")

plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")

#all the colored graph in a single pic
par(mfrow=c(2,2))
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")
#the colors are standard and coded

install.packages("rasterdiv")
