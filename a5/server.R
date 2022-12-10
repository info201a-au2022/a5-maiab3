library(shiny)

# Reading in + modifying the data set
df <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-codebook.csv")
df <- df[1]
data <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv")
data <- merge(df, data)

# Data wrangling was done in a separate R file (named DataWrangling in repo)
server <- function(input, output) {
  
  output$image <- renderImage({
    list(src = "./www/data1.JPG", height = 400, width = 400)
  }, deleteFile = F)
  
  output$image2 <- renderImage({
    list(src = "./www2/data2.JPG", height = 400, width = 400)
  }, deleteFile = F)
  
  # Page 2
  # Creating two output widgets for the user to choose
  output$select_region <- renderUI ({
    selectInput("Country", "Choose a Country:", choices = unique(data$country))
  })
  
  output$select_reason <- renderUI ({
    selectInput("Reason", "Select C02 Reason", choices = unique(data$column))
  })
  
  # Plotting the chart based on dataframe given
  barPlot <- reactive({
    
    plotting_data <- data %>% 
      filter(country %in% input$Country) 
    
    plotting_reason <- data %>% 
      filter(column %in% input$Column)
  
    ggplot(plotting_data, aes(x = year, y = population)) +
      geom_col(aes(fill = cumulative_luc_co2)) +
      geom_col(data=plotting_reason) +
      scale_y_continuous(labels = scales::comma) +
      labs(x = "Years",
           y = "Population",
           fill = "C02 Emissions 
           from Land Use (mt)",
           title = "Cumulative C02 Emissions (1850 to 2020)")
  })
  
  # Rendering of the plot
  output$co2_plot <- renderPlot ({
    barPlot()
  })
  
  # Rendering text
  output$text <- renderText({
    paste("The purpose of this plot is to show the cumulative production-based
          emissions of carbon dioxide (C02) from land-use change measured in 
          million tonnes. The user has the ability to chose which country they
          would like to focus on as well as what 'reason' (primary energy 
          consumption, annual production-based emissions, etc). Some trends that
          are evident within this graph is that developing countries contribute
          less to C02 Emssions than developed countries; and that these emissions
          only increase as time keeps passing. Other things can be learned based
          on the varibles chosen, but this graph does a great job at showing C02
          emissions on a global scale.")
  })
  

}
