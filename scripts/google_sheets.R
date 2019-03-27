library(tidyverse)
## Not run: 
## load/refresh existing credentials, if available
## otherwise, go to browser for authentication and authorization
drive_auth()

## see user associated with current token
drive_user()

## force use of a token associated with a specific email
drive_auth(email = "jenny@example.com")
drive_user()

## use a 'read only' scope, so it's impossible to edit or delete files
drive_auth(
  scopes = "https://www.googleapis.com/auth/drive.readonly"
)

## use a service account token
drive_auth(path = "foofy-83ee9e7c9c48.json")

## End(Not run)


gmail <- 'datatyding@gmail.com'
password <- 'D4t4tyd1ng'
drive_auth(email = gmail, path = NULL,
           scopes = "https://www.googleapis.com/auth/drive",
           cache = getOption("gargle.oauth_cache"),
           use_oob = getOption("gargle.oob_default"))




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

drive_find(patter = "data", type = "csv")
