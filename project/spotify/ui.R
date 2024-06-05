library(shiny)
library(bslib)
library(httr)
library(jsonlite)

token = POST(
    url ="https://accounts.spotify.com/api/token",
    body = list(
        grant_type = "client_credentials",
        client_id = "",
        client_secret = ""
    ),
    encode = "form"
)


parsed_token = content(token)$access_token


playlists = GET(
    url = "https://api.spotify.com/v1/users/6f3wev5kavipn19ysxrro667u/playlists",
    add_headers(Authorization = paste("Bearer", parsed_token))
)


parsed_playlists = fromJSON(content(playlists, as = "text"))


playlists_names_id = setNames(parsed_playlists$items$id, parsed_playlists$items$name)

print(parsed_playlists$items$name)


# Define UI for app that draws a histogram ----
ui <- page_sidebar(
  # App title ----
  title = "Analyze my Spotify data",
  # Sidebar panel for inputs ----
  sidebar = sidebar(
    # Input: Slider for the number of bins ----
    
    checkboxGroupInput(inputId = "playlists",
                   label = "Playlists sélectionnées:",
                   choices = playlists_names_id
    )
  ),
  # Output: Histogram ----
  tabsetPanel(
    tabPanel("Histogramme playlist", plotOutput(outputId = "distPlot")),
  )
)