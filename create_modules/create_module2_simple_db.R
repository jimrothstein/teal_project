# Purpose:   Create a Teal Module + REPORTER
# https://insightsengineering.github.io/teal/latest-tag/articles/adding-support-for-reporting.html
# REF: https://insightsengineering.github.io/teal/latest-tag/articles/creating-custom-modules.html 

# start with simple, basic module, self-contained (NOTE: module() )

library(teal)
example_module <- function(label = "example teal module") {
  module(
    label = label,
    server = function(id, data) {
      checkmate::assert_class(data, "reactive")
      checkmate::assert_class(isolate(data()), "teal_data")
      
      moduleServer(id, function(input, output, session) {
        updateSelectInput(session, "dataname", choices = isolate(datanames(data())))
        output$dataset <- renderPrint({
          req(input$dataname)
          data()[[input$dataname]]
        })
      })
    },
    ui = function(id) {
      ns <- NS(id)
      sidebarLayout(
        sidebarPanel(selectInput(ns("dataname"), "Choose a dataset", choices = NULL)),
        mainPanel(verbatimTextOutput(ns("dataset")))
      )
    }
  )
}

# use module above
app <- init(
  data = teal_data(IRIS = iris, MTCARS = mtcars),
  modules = example_module()
)

if (interactive()) shinyApp(app$ui, app$server)
