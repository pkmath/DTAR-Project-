library(httr)
options(httr_oob_default=TRUE) 
gs_auth(new_user = TRUE) 
4/EAGl0tvoozZCf7J1dUsMCBM-iBRYC0AjCoNkOkehLL5BKyJq_e2k3AY

gs_ls()

library(googlesheets)

table <- "responses"           # Name of the Google sheet file

saveData <- function(data) {  
  # Grab the Google Sheet
  sheet <- gs_title(table)
  # Add the data as a new row
  gs_add_row(sheet, input = data)
}

loadData <- function() {
  # Grab the Google Sheet
  sheet <- gs_title(table)
  # Read the data
  gs_read_csv(sheet)
}
