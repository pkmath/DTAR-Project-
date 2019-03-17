library(dplyr)
library(tidyr)
library(xlsx)
##Load the data set
datatest <- read.xlsx("C:/Users/Notis/Desktop/example_bank_movements.xlsx",1,header = FALSE,stringsAsFactors=FALSE)

##cleaning data, drop empty columns and rows
test <- datatest %>%
  select_if(function(x) !(all(is.na(x)) | all(x==""))) %>%
  na.omit()

#setting the correct column names
tempDF <- test 
tempDF[] <- lapply(test, as.character)
colnames(test) <- tempDF[1, ]
test <- test[-1,]
View(test)

##convert importe to numeric

if (class(test$`IMPORTE EUR`) != "numeric"){
test$`IMPORTE EUR` <- as.numeric(test$`IMPORTE EUR`)
}

###creating Type variable
test=mutate(test,Type=NA)



##put entries into type category according if they are income or expenses

for (i in 1:nrow(test)){
  if (test$`IMPORTE EUR`[i]>0){
    test$Type[i] = "Income"} else{
      (test$Type[i]= "Expense") }
  
}

##trying to identify categories of trancactions
v=NULL
for (i in 1:nrow(test)){
v = c(v,strsplit(test$CONCEPTO[i],split = " ")[[1]])
}
v=as.data.frame(table(v))
##now in v we see the words used in concepto with frequencies

##filter the most used words
v%>%
  filter(Freq >= 100)

##I notice that TRANSFERENCIA is associated with income money
## but i am not sure if all incomes are of the same category
##also recibo is associated with expenses