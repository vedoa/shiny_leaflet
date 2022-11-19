# dependencies
library(shiny) 
library(shinydashboard)
library(leaflet) 
library(markdown)
library(DT)

dashboardPage(

  dashboardHeader(title = "Example"),

  dashboardSidebar(
    
    source("./ui/sidebar.R", local = TRUE)$value
    
  ),

  dashboardBody(
    
    source("./ui/body.R", local = TRUE)$value
    
  )
  
)
