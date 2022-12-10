library(shiny)
library(ggplot2)
library(dplyr)
library(leaflet)
library(tidyverse)
library(shinythemes)


page_one <- tabPanel(
  "Introduction",
  
  sidebarLayout(
    sidebarPanel(
      h5("By: Maia Bonifield"),
      h5("maiab3@uw.edu"),
      h5("Info 201 - Autumn 2022")
    ),
    
    mainPanel(
      ui <- fluidPage(
        theme = shinytheme("cerulean"),
        h3("Part 1: Relevant Values of Interest"),
        h5("Which year had the highest GDP?"),
        h5("The year that had the highest GDP was was 2018. This indicates that 
           there was an exponential growth within the economy, and that resources
           are available to people in the country, and that various sectors (such
           as goods/services, wages/profits) are increasing."),
        h5("What was the average c02 emissions rate in 2018 per country?"),
        imageOutput("image"),
        p("**Data frame of the averages of the first 10 countries"),
        h5("These averages are indicative of several things: How large the country
           may be, what economic state they may be, among other things. It is
           interesting to note that the more developed countries have higher 
           emissions, this is because developed countries consume more global energy
           as they are more industrialized and utilize things such as fossil fuels
           in order to sustain their country."),
        h5("How have C02 averages changed over the last 30 years (since 1990)?"),
        imageOutput("image2"),
        p("**Data frame that includes how C02 averages have changed from 1990 to 2020"),
        h5("There is a huge jump between the years, as seen within the data frame. 
           Although this is just the tip of the iceberg, even referencing just 
           general knowledge would allow the audience to know that modernization has 
           become a cause of this. Just a few examples include: Mass production of 
           phones (each has a lithium battery which takes massive amounts of fossil
           fuels to produce), car emissions, and so much more.")
      )
    )   
  )    
)


page_two <- tabPanel(
  "Cumulative C02 Emissions",
  
  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      uiOutput("select_region"),
      uiOutput("select_reason")
      
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      ui <- fluidPage(
        plotOutput("co2_plot"),
        textOutput("text")
      )
      
    )
  )
)

# Navigating the pages
ui <- navbarPage(
  "Navigating C02 Emissions",
  page_one,
  page_two
)