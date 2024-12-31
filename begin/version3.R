
## Explaination here:
## https://pharmaverse.github.io/blog/posts/2024-07-22_teal_app_development_pharmaverseadam/teal-app-development.html

# After run,   run data<CR>,  data@datanames<CR>, 

if (F) { ## do once, add additional teal modules
pak::pkg_install(
  c("sparkline", "teal.modules.general", "teal.modules.clinical")
)
}
# Step 1: import packages
library(teal)
library(teal.modules.general)
library(pharmaverseadam)

# Step 2: create a teal data object (S4)

# INSTEAD OF

# data <- cdisc_data(
#   ADAE = pharmaverseadam::adae,
#   ADSL = pharmaverseadam::adsl
# )

# USE: -- we specify keys
data <- base::within(teal_data(), {
  ADAE <- pharmaverseadam::adae
  ADSL <- pharmaverseadam::adsl
})

datanames(data) <- c("ADAE", "ADSL")
join_keys(data) <- default_cdisc_join_keys[datanames(data)]


# Step 3: initialize teal app (add modules)
app <- init(
data = data,
modules = modules(
  example_module(),
  tm_data_table("Table View"),
  tm_variable_browser("Variables")
)
)

# Step 4: run shiny app
shinyApp(app$ui, app$server)

