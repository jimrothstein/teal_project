# Purpose:   Create a Teal Module
# REF: https://insightsengineering.github.io/teal/latest-tag/articles/creating-custom-modules.html 


# This module creates these functions (To Run:  RUN version5_use_module.R)
# need ui, server   and way to create instance of module

library(teal)

# ui function for the module
# allows for selecting dataset and one of its numeric variables
ui_histogram_example <- function(id) {
  ns <- NS(id)
  sidebarLayout(
    sidebarPanel(
      selectInput(ns("datasets"), "select dataset", choices = NULL),
      selectInput(ns("numerics"), "select numeric variable", choices = NULL)
    ),
    mainPanel(
      plotOutput(ns("plot")),
      verbatimTextOutput(ns("code"))
    ),
  )
}

# server function for the module (and contains moduleServer() call)
# presents datasets and numeric variables for selection
# displays a histogram of the selected variable
# displays code to reproduce the histogram
srv_histogram_example <- function(id, data) {
  checkmate::assert_class(data, "reactive")
  checkmate::assert_class(isolate(data()), "teal_data")
  
  moduleServer(id, function(input, output, session) {
    # update dataset and variable choices
    # each selection stored in separate reactive expression
    updateSelectInput(inputId = "datasets", choices = isolate(datanames(data())))
    observe({
      req(dataset())
      nums <- vapply(data()[[dataset()]], is.numeric, logical(1L))
      updateSelectInput(inputId = "numerics", choices = names(nums[nums]))
    })
    dataset <- reactive(input$datasets)
    selected <- reactive(input$numerics)
    
    # add plot code
    plot_code_q <- reactive({
      validate(need(length(dataset()) == 1L, "Please select a dataset"))
      validate(need(length(selected()) == 1L, "Please select a variable"))
      req(selected() %in% names(data()[[dataset()]]))
      
      # evaluate plotting expression within data
      # inject input values into plotting expression
      within(
        data(),
        p <- hist(dataset[, selected], las = 1),
        dataset = as.name(dataset()), selected = selected()
      )
    })
    
    # view plot
    output$plot <- renderPlot({
      plot_code_q()[["p"]]
    })
    
    # view code
    output$code <- renderPrint({
      plot_code_q() %>%
        get_code() %>%
        cat()
    })
  })
}

# function that creates module instance to use in `teal` app
tm_histogram_example <- function(label) {
  module(
    label = label,
    server = srv_histogram_example,
    ui = ui_histogram_example,
    datanames = "all"
  )
}

