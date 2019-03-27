accurate_classification <- function(data,categories){
  categories <- read.csv("/cloud/project/datasets/categories.csv")
  data <- read.csv("/cloud/project/datasets/data.csv")
  for(i in 1:nrow(data)){
    for(k in 1:nrow(categories)){
      cases <- sapply(categories[k,c("key1","key2","key3","key4","key5")],grepl, data$concept[i])
      if(any(is.na(cases)) == T) cases = FALSE
      if(any(cases,na.rm = FALSE) == T) data$class <- categories$Category[k]
    }
  }
  write.csv(categories,"/cloud/project/datasets/categories.csv",row.names =F)
  write.csv(data,"/cloud/project/datasets/data.csv",row.names =F)
}

