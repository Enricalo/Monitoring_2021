#species distribution modelling
library(raster) #predictors
library(rgdal) #species
library(sdm)

#importing species data
file <- system.file("external/species.shp", package="sdm") 
species <- shapefile(file)

# looking at the set
species

# plot
plot(species)

# looking at the occurrences
# $ link the column to the dataset
species$Occurrence

# copy and then write:
# 1 means presence "," stops the selecton
plot(species[species$Occurrence == 1,],col='blue',pch=17)
#points function adds somenthing to the previous plot
points(species[species$Occurrence == 0,],col='red',pch=17)

path <- system.file("external", package="sdm")
# list the predictors
lst <- list.files(path=path,pattern='asc$',full.names = T) #
lst

# stack = all the data plotted together
preds <- stack(lst)

# plot preds = predict weather the species is present or not
cl <- colorRampPalette(c('blue','orange','red','yellow')) (100)
plot(preds, col=cl)

#plot one set at a time
plot(preds$elevation, col=cl, main='elevation')
points(species[species$Occurrence == 1,], pch=17)

plot(preds$temperature, col=cl, main='temperature')
points(species[species$Occurrence == 1,], pch=17)

plot(preds$precipitation, col=cl)
points(species[species$Occurrence == 1,], pch=16)

plot(preds$vegetation, col=cl)
points(species[species$Occurrence == 1,], pch=16)

# model

# set the data for the sdm
datasdm <- sdmData(train=species, predictors=preds)
datasdm

# model
# presence/absence (=occurence) -> = sum of all the predictions
m1 <- sdm(Occurrence ~ elevation + precipitation + temperature + vegetation, data=d, methods = "glm")


# make the raster output layer
p1 <- predict(m1, newdata=preds) 

# plot the output
plot(p1, col=cl)
points(species[species$Occurrence == 1,], pch=16)

# add to the stack
s1 <- stack(preds,p1)
plot(s1, col=cl)
