library(shiny)
library(bslib)

# Define UI for app that draws a histogram ----
ui <- page_sidebar(
  # App title ----
  title = "Pinguins",
  # Sidebar panel for inputs ----
  sidebar = sidebar(
    # Input: Slider for the number of bins ----
    
    checkboxGroupInput(inputId = "species",
                   label = "Espèces sélectionnées:",
                   choices = c("Adelie" = "Adelie",
                               "Chinstrap" = "Chinstrap",
                               "Gentoo" = "Gentoo")),
    radioButtons(inputId = "density",
                 label = "Densité:",
                  choices = c("count" = "count",
                              "density" = "density")),
    sliderInput("xlim",
            "Longueurs d'ailes considérées (mm)K:",
            min = 170, max = 240,
            value = c(170, 240))
  ),
  # Output: Histogram ----
  tabsetPanel(
    tabPanel("Histogramme ailes", plotOutput(outputId = "distPlot")),
    tabPanel("Histogramme bec", plotOutput(outputId = "becPlot"))
  )
)