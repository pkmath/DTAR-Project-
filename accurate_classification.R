accurate_classification <- function(){
  #url_cat <- "" 
  #categories <- read.csv(url_cat)
  #url_data <- "" 
  #data <- read.csv(url_data)
  categories <- read.csv("/cloud/project/datasets/categories.csv")
  data <- read.csv("/cloud/project/datasets/data.csv")
  for(i in 1:nrow(data)){
    for(k in 1:nrow(categories)){
      cases <- sapply(categories[k,c("key1","key2","key3","key4","key5")],grepl, data$concept[i])
      if(any(cases) == T) data$class <- categories$Category[k]
    }
  }
  write.csv(categories,"/cloud/project/datasets/categories.csv",row.names =F)
  write.csv(data,"/cloud/project/datasets/data.csv",row.names =F)
}
