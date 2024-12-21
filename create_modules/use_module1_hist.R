# PURPOSE:  This teal app, uses the module created in create_module.R


app <- init(
  data = teal_data(IRIS = iris, NPK = npk),
  modules = tm_histogram_example(label = "Histogram Module"),
  header = "Simple app with custom histogram module"
)

if (interactive()) {
  shinyApp(app$ui, app$server)
}
