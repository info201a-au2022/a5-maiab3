library("tidyverse")
library("ggplot2")
library("dplyr")
library("shiny")

source("../ui.R")
source("../server.R")

shinyApp(ui = ui, server = server)
