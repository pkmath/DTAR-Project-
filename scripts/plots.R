library(ggplot2)
getwd()
data<-read.csv("/cloud/project/datasets/data.csv")
View(data)

data_by_class <- group_by(data, class)
data_by_class <- summarise(by.code, 
                     SumQuant = sum(quantity))
data_by_class

# create a dataset
specie=c(rep("sorgho" , 3) , rep("poacee" , 3) , rep("banana" , 3) , rep("triticum" , 3) )
condition=rep(c("normal" , "stress" , "Nitrogen") , 4)
value=abs(rnorm(12 , 0 , 15))
data=data.frame(specie,condition,value)

# Grouped
ggplot(data, aes(fill=condition, y=value, x=specie)) + 
  geom_bar(position="dodge", stat="identity")

# Stacked
ggplot(data, aes(fill=condition, y=value, x=specie)) + 
  geom_bar( stat="identity")


