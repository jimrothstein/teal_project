## REF:
## https://pharmaverse.github.io/blog/posts/2024-07-22_teal_app_development_pharmaverseadam/teal-app-development.html

## PURPOSE:   construct simple TEAL app using ADaM data
## WORKS

pak::pak(c("teal", "pharmaverseadam"))

# Throws ERROR, but not in reprex!
# Step 1: import packages
  
library(teal)
library(pharmaverseadam)

data = teal.data::teal_data(
  ADAE = pharmaverseadam::adae,
  ADSL = pharmaverseadam::adsl 
)

# use iris data instead
data = teal.data::teal_data(
  IRIS = iris
)



# Step 2: create a teal data object
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
