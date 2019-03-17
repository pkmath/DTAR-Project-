clean_data <- function(data){
  # INPUT: 'data' : a data.frame from the Santander bank account
  # OUTPUT:         a data.frame with understandable and ordered values
  # Tidy the data.frame
  data<-data[-(1:14),]
  data<-data[-2,]
  data<-data[,-2]
  data<-data[,-3]
  data<-data[,-4]
  data<-data[,-5]
  names(data)=data[1,]
  data<-data[-1,]
  data<-data[,-1]
  data$`IMPORTE EUR`=as.numeric(data$`IMPORTE EUR`)
  data$`IMPORTE EUR`<-round(data$`IMPORTE EUR`,digits=2)
  data$SALDO=as.numeric(data$SALDO)
  data$SALDO<-round(data$SALDO,digits=2)
  names(data) <- c("date","concept","quantity","balance")
  data$date <- as.Date(data$date, format = "%d/%m/%Y")
  num <- data.frame(num = rep(NA,nrow(data)))
  check <- data.frame(check = rep(0,nrow(data)))
  check1 <- data.frame(check1 = rep(0,nrow(data)))
  class <- data.frame(class = rep(NA,nrow(data)))
  data <- cbind(check1,check,num,data,class)
  
  return(data)
} 

