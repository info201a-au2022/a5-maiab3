library("tidyverse")
library("ggplot2")
library("dplyr")
library("shiny")

source("../source/ui.R")
source("../source/server.R")

shinyApp(ui = ui, server = server)
