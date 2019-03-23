library(ggplot2)
getwd()
data<-read.csv("/cloud/project/datasets/data.csv")
View(data)
data$date<-as.Date(as.character(data$date))

# profits by month
data_by_month <-data
data_by_month$date<-format(data_by_month$date,"%Y-%m")
profits <- aggregate(data_by_month$quantity,
                     by=list(Category=data_by_month$date), FUN=sum)
expenses <- data_by_month[data_by_month$quantity<0,]
expenses$date<-format(expenses$date,"%Y-%m")
expenses<- abs(aggregate(expenses$quantity,
                     by=list(Category=expenses$date), FUN=sum))
incomes <- data_by_month[data_by_month$quantity>0,]
incomes <- aggregate(incomes$quantity,
                     by=list(Category=incomes$date), FUN=sum)

# Plot of classes of categories ----
data_by_class <- group_by(data, class)
data_by_class <- summarise(data_by_class, 
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


