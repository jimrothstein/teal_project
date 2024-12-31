# Simple Teal App, using pharmaverse data, simple example module - but not verified
# Blog Post
# https://pharmaverse.github.io/blog/posts/2024-07-22_teal_app_development_pharmaverseadam/teal-app-development.html



# Step 1: import packages
library(teal)
library(pharmaverseadam)

# Step 2: create a teal data object (use wrapper cdisc_data, not teal_data)
data <- cdisc_data(
  ADAE = pharmaverseadam::adae,
  ADSL = pharmaverseadam::adsl
)

# Step 3: initialize teal app
app <- init(
  data = data,
  modules = example_module()
)

# Step 4: run shiny app
shinyApp(app$ui, app$server)

