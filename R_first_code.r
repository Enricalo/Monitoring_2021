# comment the code to explain the functions! always comment the function for the exam. it is important to help others to understand what you are doing.

# this is an array
Primates <- c(3, 5, 9, 15, 40)
Primates

# new set
Crabs <- c(100, 70, 30, 10, 5)
Crabs

#new plot in R
plot(Primates,Crabs)

#add colour
plot(Primates,Crabs,col="red")

#change the shape of the points in the graph
plot(Primates,Crabs,col="red", pch=8)

#character exaggeration
plot(Primates,Crabs,col="red", pch=8, cex=5)

#give the graph a title
plot(Primates,Crabs,col="red", pch=8, cex=5, main="my first ecological graph in R")

#create a dataframe (table)
EcoSet<-data.frame(Primates, Crabs)
EcoSet

#calculating mean of individuals per site
(3+5+9+15+40)/5

#summary of the dataset
summary(EcoSet)
