#R_code_multivar.r
library(vegan)
setwd("C:/LAB_2020_2021/")
load("biomes_multivar.RData")
#function to list everything you have in the workspace
ls()
head(biomes)

# DEtrended CORrespondence ANAlysis
multivar<-decorana(biomes)
#shows how much variance there is in each axis
multivar

plot(multivar)

# biomes types
head(biomes_types)

attach(biomes_types)

#"put an ellispe in ordination" (=multivariate analysis")

#type is the column we are going to use for ordering the data
#ehull is the kind of shape we are going to use 
ordiellipse(multivar, type, col=c("black","red","green","blue"), kind = "ehull", lwd=3)
# or col=1:4

#lines connecting involved species and label for each group
ordispider(multivar, type, col=c("black","red","green","blue"), label = T) 

pdf("multivar.pdf")
plot(multivar)
ordiellipse(multivar, type, col=c("black","red","green","blue"), kind = "ehull", lwd=3)
ordispider(multivar, type, col=c("black","red","green","blue"), label = T)
dev.off()
