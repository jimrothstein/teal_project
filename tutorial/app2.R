# app2.R
# https://insightsengineering.github.io/teal.data/latest-tag/

library(teal)
library(teal.data)

# TWO ways to pre-pr0cess dataset (if know or not the KEys)
# quick start for clinical trial data
my_data <- cdisc_data(
  ADSL = example_cdisc_data("ADSL"),
  ADTTE = example_cdisc_data("ADTTE"),
  code = quote({
    ADSL <- example_cdisc_data("ADSL")
    ADTTE <- example_cdisc_data("ADTTE")
  })
)
my_data
# or 

my_data2 <- within(teal_data(), {
  ADSL <- example_cdisc_data("ADSL")
  ADTTE <- example_cdisc_data("ADTTE")
})
datanames <- c("ADSL", "ADTTE")
datanames(my_data2) <- datanames
join_keys(my_data2) <- default_cdisc_join_keys[datanames]

my_data2

identical(my_data, my_data2)  # FALS  E
