library(shiny)
library(shiny.quetzio)
library(shinyWidgets)
library(waiter)
library(shinyjs)
library(metathis)
library(googledrive)

source("tabs.R")

discoRd_survey_ss <- "19JsV3XABSn4DNFLYMfzmWSrQ6zTPp4X1xIy2Ex4QzZ0"
discoRd_output_ss <- "1zw9t4zz6fYXXTf-aSIZflE6D-_PwUzX1PLud4SEU1Sg"

# custom text to show on the previous pages of survey
custom_txt_discoRd <- list(
  submit_enabled = "Next page",
  submit_disabled = "Cannot proceed yet"
)

## If the App won't load because of too many redings in deauthorized form
# you can contact me to get the secrets.

googlesheets4::gs4_death()

#googlesheets4::gs4_auth(
#  email = Sys.getenv("G_SERVICE_MAIL"),
#  path = Sys.getenv("G_SERVICE_ACCOUNT")
#)
