# teal.data package
# Including data in teal application
# https://insightsengineering.github.io/teal/release-candidate/articles/including-data-in-teal-applications.html

# inherits from qenv
# create teal_data object

library(teal)

###
###   G O   T O   posit cloud (no errors)
###
# create teal_data (ERRORs)
data <- teal_data(iris = iris, cars = mtcars)

# create teal_data object [Rstudio error ?? ERROR:  obj_size .... bad binding access]
	my_data <- teal_data()
	