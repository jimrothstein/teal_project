
## Explaination here:
## https://pharmaverse.github.io/blog/posts/2024-07-22_teal_app_development_pharmaverseadam/teal-app-development.html

# After run,   run data<CR>,  data@datanames<CR>, 

# Step 1: import packages
library(teal)
library(pharmaverseadam)

# Step 2: create a teal data object (S4)
data <- teal.data::cdisc_data(
  ADAE = pharmaverseadam::adae,
  ADSL = pharmaverseadam::adsl
)

## study results
data
data@join_keys

# Step 3: initialize teal app
app <- init(
  data = data,
  modules = example_module()
)

# Step 4: run shiny app
shinyApp(app$ui, app$server)
