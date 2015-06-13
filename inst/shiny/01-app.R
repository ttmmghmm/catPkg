# https://www.youtube.com/watch?v=Ido56dwDTg8

library(shiny)

ui <- fluidPage(
  h1("hello World!"),
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId = "dataset", label = "Choose ...", choices = tail(letters))),
    mainPanel())
) 

server <- function(input, output, session) {}

shinyApp(ui, server)
