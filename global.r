
#------------------------ imports ------------------------
#install.packages("readxl")
#install.packages("ggplot2")
#install.packages("stringr")
#install.packages("shinyjs")
#install.packages("shinyWidgets")
#install.packages("shinydashboard")
#install.packages("dplyr")
#devtools::install_github("hadley/shinySignals")
#install.packages("dplyr")
#install.packages("RMySQL")
#install.packages("plotly")

#install.packages("stringr")
library(RMySQL)
library(plotly)
library(shinyjs)
#library("readxl")
#library("doParallel")
#library("stringr")
#library("shinyjs")
#library("stats")
#library("compiler")
library(shiny)
library(shinyWidgets)
#library(jsonlite)
#library(httr)
#library(devtools)
library(ggplot2)
library(dplyr)
library(shinydashboard)

#--------------- constants -----
COUNTRY_COLUMN = "COUNTRY_COLUMN"
CITY_COLUMN = "CITY_COLUMN"
CONFIRMED_COLUMN = "CONFIRMED_COLUMN"
DEATHS_COLUMN = "DEATHS_COLUMN"
RECOVERED_COLUMN = "RECOVERED_COLUMN"  
OBSERVATION_DATE_COLUMN = "OBSERVATION_DATE_COLUMN"

#----------------------- initializarions -----------------

ROOT = paste(getwd(),"/",sep = "")
dataSetPath = paste(ROOT,"/coronaData.csv",sep = "")
dataSet = read.csv(file = dataSetPath, )
dataSet$X = NULL
names(dataSet) = c(OBSERVATION_DATE_COLUMN, CITY_COLUMN, COUNTRY_COLUMN, CONFIRMED_COLUMN, DEATHS_COLUMN, RECOVERED_COLUMN) 
COUNTRIES = unique(dataSet$COUNTRY)
COUNTRIES = levels(COUNTRIES)
CITIES = unique(dataSet$CITY_COLUMN)
CITIES = levels(CITIES)
OBSERVATION_DATE_LIST = unique(dataSet$OBSERVATION_DATE_COLUMN)
OBSERVATION_DATE_LIST = levels(OBSERVATION_DATE_LIST)
OBSERVATION_DATE_INPUT_OPTIONS= c("ALL",OBSERVATION_DATE_LIST)


importSourceFromRoot <- function(sourceName){
  success = FALSE
  file = paste(getwd(),"/",sourceName,sep = "")
  if(!exists(file, mode="function")) {
    source(file)
    success = TRUE
  }
  return(success)
}


importSource <- function(sourceName){
  success = FALSE
  if(!exists(sourceName, mode="function")) {
    source(sourceName)
    success = TRUE
  }
  return(success)
}
pageComponents = list.files(paste(getwd(),"/pages",sep = ""))
for (pageComponent in pageComponents) {
  pageComponent = paste(getwd(),"/pages/",pageComponent,sep = "")
  importSource(pageComponent)
}


#--------------------------------

modalDicas <- function(texto) {
  blub <- modalDialog(
    title = "Informações",texto,
    footer = modalButton("Fechar")
  )
  return(blub)
}


