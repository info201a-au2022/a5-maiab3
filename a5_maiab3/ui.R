page_one <- tabPanel(
  "Introduction",
  
  sidebarLayout(
    sidebarPanel(
      
      
    ),
      
      ui <- fluidPage(
        theme = shinytheme("cerulean"),

      )
    
  )
)

page_two <- tabPanel(
  "Interactive Graph",
  
  sidebarLayout(
    sidebarPanel(
      uiOutput("select_country")
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


ui <- navbarPage(
  "new title",
  page_one,
  page_two
)
