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
