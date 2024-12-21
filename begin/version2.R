
## Explaination here:
## https://pharmaverse.github.io/blog/posts/2024-07-22_teal_app_development_pharmaverseadam/teal-app-development.html

# After run,   run data<CR>,  data@datanames<CR>, 

# Step 1: import packages
library(teal)
library(pharmaverseadam)

# Step 2: create a teal data object (S4)

# INSTEAD OF

# data <- cdisc_data(
#   ADAE = pharmaverseadam::adae,
#   ADSL = pharmaverseadam::adsl
# )

# USE: -- we specify keys
data <- within(teal_data(), {
  ADAE <- pharmaverseadam::adae
  ADSL <- pharmaverseadam::adsl
})

datanames(data) <- c("ADAE", "ADSL")
join_keys(data) <- default_cdisc_join_keys[datanames(data)]


# Step 3: initialize teal app
app <- init(
  data = data,
  modules = example_module()
)

# Step 4: run shiny app
shinyApp(app$ui, app$server)
