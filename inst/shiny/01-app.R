# https://www.youtube.com/watch?v=Ido56dwDTg8

library(shiny)

ui <- fluidPage(h1("hello World!")) 

server <- function(input, output, session) {}

shinyApp(ui, server)
