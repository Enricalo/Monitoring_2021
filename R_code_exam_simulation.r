install.packages("ncdf4")
library(ncdf4)
setwd("C:/LAB_2020_2021/")
library(raster)

tjan <- raster("c_gls_LST10-DC_202101010000_GLOBE_GEO_V1.2.1.nc")
plot(tjan)

#different color for each pic (the first one you put is for the lowest value)
cltjan <- colorRampPalette(c('red','green','blue'))(100) # 
plot(tjan, col=cltjan)

toct <- raster("c_gls_LST10-DC_202010010000_GLOBE_GEO_V1.2.1.nc")
plot(toct)

#plot the differences between the data
dift <- tjan - toct
#the higher the difference the redder the graph
cldif <- colorRampPalette(c('blue','yellow','red'))(100) # 
plot(dift, col=cldif)
