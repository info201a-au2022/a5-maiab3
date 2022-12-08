# Reading in libraries
library(shiny)
library(tidyverse)
library(ggplot2)


# Define server logic required to draw plot
shinyServer(function(input, output) {
  
  # Creating an output widget for the user to choose
  output$select_country <- renderUI ({
    selectInput("Country", "Choose a Country:", choices = unique(c02_data$country))
  })
  
  
  # Plotting the chart based on renewable energy share throughout 2 decades
  barPlot <- reactive({
    
    plotting_data <- c02_data %>% 
      filter(country %in% input$Country)
    
    ggplot(plotting_data, aes(x = year, y = population)) +
      geom_col(aes(fill = cumulative_luc_co2)) +
      labs(x = "Years",
           y = "population",
           fill = "c02",
           title = "title") 
  })

  # Rendering of the plot
  output$co2_plot <- renderPlot ({
    barPlot()
  })
  
  # Description of plot
  output$text <- renderText({
    paste("yes.")
  })
  

})