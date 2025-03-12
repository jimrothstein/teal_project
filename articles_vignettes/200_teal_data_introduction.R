# teal.data package
# https://insightsengineering.github.io/teal.data/latest-tag/articles/teal-data.html

# inherits from qenv
# create teal_data object

library(teal.data)

# create teal_data object
	my_data <- teal_data()
	
# run code within teal_data to create data objects
my_data <- within(
  my_data,
  {
    data1 <- data.frame(id = 1:10, x = 11:20)
    data2 <- data.frame(id = 1:10, x = 21:30)
    data3 <- data.frame(id = 1:10, x = 31:40)
  }
)
my_data

# get objects stored in teal_data
my_data[["data1"]]
my_data[["data2"]]

# limit objects stored in teal_data
my_data[c("data1", "data3")]

# get reproducible code (stored in qenv, expression
get_code(my_data)

# get code just for specific object
get_code(my_data, names = "data2")

# get datanames
names(my_data)

# print
print(my_data)
