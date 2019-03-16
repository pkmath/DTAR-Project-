charge_libraries <- function(){
  packages <- c("ggplot2", "DT", "httr", "dplyr", "rvest", "readxl",
                "googledrive","RCurl","openssl","taskscheduleR","sendmailR",
                "mailR","R.utils","shiny","shinydashboard","tidyr","DTedit")
  if (length(setdiff(packages, rownames(installed.packages()))) > 0) {
    install.packages(setdiff(packages, rownames(installed.packages())))  
  }
  
  library(DTedit)
  library(shinydashboard)
  library(DT)
  library(httr)
  library(dplyr)
  library(rvest)
  library(readxl)
  library(googledrive)
  library(RCurl)
  library(openssl)
  library(taskscheduleR)
  library(sendmailR)
  library(mailR)
  library(R.utils)
  library(tidyr)
}

