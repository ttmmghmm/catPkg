# https://www.youtube.com/watch?v=Ido56dwDTg8

library(shiny)

ui <- fluidPage(
  h1("hello World!"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "dataset", 
        label = "Choose ...", 
        choices = sort(sample(ls("package:datasets")  , size = 50)),
        selected = sample(ls("package:datasets"), size = 1) )), # tail(letters))),
    mainPanel(
      tabsetPanel(
        tabPanel(
           "Str", 
           verbatimTextOutput("dump")
        ),
        tabPanel(
          title = "Plot",
          plotOutput("plot")
        ),
        tabPanel(
          title = "Table",
          tableOutput("table")
        )
#       verbatimTextOutput("dump"),
#        plotOutput("plot"),
#        tableOutput("table")
    )
    )
))

server <- function(input, output, session) {
  output$dump = renderPrint({
    dataset <- get(input$dataset, "package:datasets", inherits = FALSE)
    str(dataset)
  })
  output$plot = renderPlot({
    dataset <- get(input$dataset, "package:datasets", inherits = FALSE)
    plot(dataset)
  })
  output$table = renderTable({
   dataset <- get(input$dataset, "package:datasets", inherits = FALSE)
   table(dataset)
 }) 
}

shinyApp(ui, server)
