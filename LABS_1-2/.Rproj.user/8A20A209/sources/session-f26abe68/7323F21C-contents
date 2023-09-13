
library(tidyverse)
library(nycflights13)

#Q.1
days <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday")

if_else(days == "Monday" | days == "Tuesday" | days == "Wednesday"| days == "Thursday"| days == "Friday", 
        "Weekday", "Weekend")

if_else(days == "Saturday" | days == "Sunday", "Weekend", "Weekday")

if_else(days %in% c("Saturday", "Sunday"), "Weekend", "Weekday")

#Q.2
flight_test <- flights |>
  mutate(ontime = if_else(arr_delay <= 0, "on-time", "delayed"))

# --------------------------------------------------------------------------- #

### NUMBERS ###

x <- c("1.2", "5.6", "1e3")
parse_double(x)

x <- c("$1,234", "USD 3,513", "59%")
parse_number(x)

# count() func
flights |> count(dest, sort = TRUE)

flights |>
  group_by(dest) |>
  summarize(carriers = n_distinct(carrier)) |>
  arrange(desc(carriers))

# min and max function!
x <- c(2, 5, 11, 11, 19, 35)
max(x)
min(x)

# calc Z score for each number in x
z_score <- (x - mean(x)) / sd(x)
z_score

# --------------------------------------------------------------------------- #

### STRINGS ###

install.packages("babynames")
library(tidyverse)
library(babynames)

string1 <- "this is string"
string2 <- 'this is also string'

single_quote <- " \' "
double_quote <- " \" "
backslash <- " \\ "

x <- c(single_quote, double_quote, backslash)
str_view(x)

db <- "double_quote <- \"\\\"\""
str_view(db)

db2 <- r"(double_quote <- "\"")"
str_view(db2)

strng <- "He said \"That\'s amazing!\""
str_view(strng)

strng2 <- r"(He said "That's amazing!")"
str_view(strng2)

space <- "one\ntwo"
str_view(space)
tab <- "one\ttwo"
str_view(tab)
mu <- "\u00b5"
str_view(mu)
emoji <- "\U0001f604"
str_view(emoji)
