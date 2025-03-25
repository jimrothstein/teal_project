# https://insightsengineering.github.io/teal/latest-tag/articles/getting-started-with-teal.html
# TEAL 'Getting Started'



#### app 1 ----
library(teal)

app <- init(
  data = teal_data(IRIS = iris, CARS = mtcars),
  modules = example_module(),
  filter = teal_slices(
    teal_slice(dataname = "IRIS", varname = "Sepal.Length"),
    teal_slice(dataname = "IRIS", varname = "Species", selected = "setosa"),
    teal_slice(dataname = "CARS", varname = "mpg", selected = c(20, Inf)),
    teal_slice(dataname = "CARS", expr = "qsec < 20", title = "1/4 mile under 20 sec", id = "qsec_20")
  )
)

if (interactive()) {
  shinyApp(app$ui, app$server)
}

#### app 2----    EXTEND ,  cleaner than above. ----
library(teal)

app <- init(
  data = teal_data(IRIS = iris, CARS = mtcars),
  modules = modules(
    example_module(label = "all datasets"),
    example_module(label = "IRIS only", datanames = "IRIS"),
    example_module(label = "CARS only", datanames = "CARS"),
    example_module(label = "no filter panel", datanames = NULL)
  )
)
if (interactive()) {
  shinyApp(app$ui, app$server)
}

#### app 3 ----  Global and specific modules (4 modules display) ----
library(teal)

app <- init(
  data = teal_data(mtcars = mtcars),
  modules = modules(
    example_module(label = "module 1"),
    example_module(label = "module 2"),
    example_module(label = "module 3"),
    example_module(label = "module 4")
  ),
  filter = teal_slices(
    # filters created with id
    teal_slice(dataname = "mtcars", varname = "mpg", id = "filter 1"),
    teal_slice(dataname = "mtcars", varname = "cyl", id = "filter 2"),
    teal_slice(dataname = "mtcars", varname = "disp", id = "filter 3"),
    teal_slice(dataname = "mtcars", varname = "hp", id = "filter 4"),
    teal_slice(dataname = "mtcars", varname = "drat", id = "filter 5"),
    teal_slice(dataname = "mtcars", varname = "wt", id = "filter 6"),
    # module-specific filtering enabled
    module_specific = TRUE,
    # filters mapped to modules
    mapping = list(
      "module 1" = c("filter 2", "filter 4"),
      "module 2" = "filter 3",
      "module 3" = "filter 2",
      global_filters = "filter 1"
    )
  )
)

if (interactive()) {
  shinyApp(app$ui, app$server)
}
