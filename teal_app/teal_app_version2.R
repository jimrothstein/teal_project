# JOIN KEYS
# Step 1: import packages
library(teal)
library(pharmaverseadam)

# Step 2 changed - more verbose


data <- within(teal_data(), {
  ADAE <- pharmaverseadam::adae
  ADSL <- pharmaverseadam::adsl
}
)
names(data)
typeof(data)  # S4
# do not use datanames since teal.data 0.7.0
#datanames(data) <- c("ADAE", "ADSL")

#join_keys(data) <- default_cdisc_join_keys[datanames(data)]


# join_keys() returns object `join_keys` from the teal_data object
teal.data::join_keys(data) <- default_cdisc_join_keys[names(data)]

# Step 3: initialize teal app
app <- init(
  data = data,
  modules = example_module()
)



#Step 4: run shiny app
shinyApp(app$ui, app$server)


