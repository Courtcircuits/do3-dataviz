# Define server logic required to draw a histogram ----
library(palmerpenguins)
library(ggplot2)
library(dplyr)
server <- function(input, output) {

  # Histogram of the Old Faithful Geyser Data ----
  # with requested number of bins
  # This expression that generates a histogram is wrapped in a call
  # to renderPlot to indicate that:
  #
  # 1. It is "reactive" and therefore should be automatically
  #    re-executed when inputs (input$bins) change
  # 2. Its output type is a plot
  output$distPlot <- renderPlot({

  penguins <- na.omit(penguins)
  selected_species <- penguins[penguins$species %in% input$species,]

  filter_penguins <- function() {
    selected_species %>%
      filter(flipper_length_mm >= input$xlim[1],
             flipper_length_mm <= input$xlim[2])
  }

  density_penguins <- input$density

  if (density_penguins == "count") {
 ggplot(filter_penguins(), aes(x = flipper_length_mm, y=after_stat(count)
  , fill=species)) +
    geom_histogram(bins = 30, position = "dodge") +
    labs(title = "Histogramme de la longueur des nageoires",
         x = "Longueur des nageoires (mm)",
         y = "Nombre d'individus")
  } else {
 ggplot(filter_penguins(), aes(x = flipper_length_mm, y=after_stat(density)
  , fill=species)) +
    geom_histogram(bins = 30, position = "dodge") +
    labs(title = "Histogramme de la longueur des nageoires",
         x = "Longueur des nageoires (mm)",
         y = "Nombre d'individus")
  }

 
  }) 

  #######
  # BEC #
  #######


  output$becPlot <- renderPlot({

  penguins <- na.omit(penguins)
  selected_species <- penguins[penguins$species %in% input$species,]

  filter_penguins <- function() {
    selected_species %>%
      filter(flipper_length_mm >= input$xlim[1],
             flipper_length_mm <= input$xlim[2])
  }

  density_penguins <- input$density

  if (density_penguins == "count") {
 ggplot(filter_penguins(), aes(x = bill_length_mm, y=after_stat(count)
  , fill=species)) +
    geom_histogram(bins = 30, position = "dodge") +
    labs(title = "Histogramme de la longueur des becs",
         x = "Longueur des becs (mm)",
         y = "Nombre d'individus")
  } else {
 ggplot(filter_penguins(), aes(x = bill_length_mm, y=after_stat(density)
  , fill=species)) +
    geom_histogram(bins = 30, position = "dodge") +
    labs(title = "Histogramme de la longueur des becs",
         x = "Longueur des becs (mm)",
         y = "Nombre d'individus")
  }

 
  }) 

}