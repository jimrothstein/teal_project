#qenv
library(teal.code)
qq <- qenv()
qq <- within(qq, i <- subset(iris, Species == "setosa"))
qq <- within(qq, ii <- subset(iris, Species == species), species = "versicolor")
input_value <- "virginica"
qq <- within(qq, iii <- subset(iris, Species == species), species = input_value)

summary(qq[["i"]]$Species)



get_code(qq)
eval_code(qq)


teal.code::eval_code(qenv(), quote(a <- 1))

library(teal.code)
library(magrittr)

# create a new qenv object
empty_qenv <- qenv()
print(empty_qenv)
get_code(empty_qenv)

# evaluate code in qenv
my_qenv <- eval_code(empty_qenv, "x <- 2")
print(my_qenv)
get_env(my_qenv)
get_code(my_qenv)


q1 <- eval_code(my_qenv, "y <- x * 2") %>% eval_code("z <- y * 2")
print(q1)
q1
get_env(q1)
get_code(q1)


## another way
q2 <- within(my_qenv, y <- x * 2) %>% within(z <- y * 2)
print(q2)
get_code(q2)
get_env(q2)
ls(get_env(q2))


# to see values
print(q2[["y"]])
cat(get_code(q2))
