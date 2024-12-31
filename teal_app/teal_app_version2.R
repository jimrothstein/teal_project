reprex::reprex({
# more verbose - FAILs


# Step 1: import packages
library(teal)
library(pharmaverseadam)

# Step 2 changed - more verbose

data <- within(teal_data(), {
  ADAE <- pharmaverseadam::adae
  ADSL <- pharmaverseadam::adsl
}
)

datanames(data) <- c("ADAE", "ADSL")
join_keys(data) <- default_cdisc_join_keys[datanames(data)]
})

# Step 3: initialize teal app
app <- init(
  data = data,
  modules = example_module()
)



Step 4: run shiny app
shinyApp(app$ui, app$server)


