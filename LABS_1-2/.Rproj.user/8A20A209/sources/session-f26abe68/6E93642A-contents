## lab 2: 9/8/23

library(tidyverse)
library(nycflights13)

students <- read_csv("students.csv")
write_csv(students, "students2.csv")

data1 <- tibble(
  x = c(1,2,5),
  y = c("h", "m", "g"),
  z = c(0.08, 0.83, 0.60)
)

write_csv(data1, "data1.csv")
data1.1 <- read_csv("data1.csv")


flights |> 
  filter(dep_time > 600 & dep_time < 2000 & abs(arr_delay) < 20)

flights |> 
  mutate(daytime = dep_time > 600 & dep_time < 2000,
         approx_ontime = abs(arr_delay) < 20,
         .keep = "used")


NA > 5

10 == NA 

NA == NA 

is.na(c(TRUE, NA, FALSE))

is.na(c(1, NA, 3))

is.na(c("a", NA, "b"))

flights |> 
  filter(is.na(dep_time))


1:12 %in% c(1, 5, 11)

letters[1:10] %in% c("a", "e", "i", "o", "u")

c(1, 2, NA) %in% NA

flights |> filter(dep_time %in% c(NA, 0800))

flights |> 
  group_by(year, month, day) |> 
  summarize(
    all_delayed = all(dep_delay <= 60, na.rm = TRUE))

flights |>   group_by(year, month, day) |>   	summarize(
  all_delayed = all(dep_delay <= 60, na.rm = 	TRUE),
  any_long_delay = any(arr_delay >= 300,	na.rm = TRUE))

data <- flights |>   mutate(late = 	if_else(dep_delay >0 , "late", "on-time"))

x <- c(-3, -2, -1, 0, 1, 2, 3, NA)
if_else(x > 0, "+ve", "-ve")


case_when(  
  x == 0 ~ "0",
  x < 0 ~ "-ve",
  x > 0 ~ "+ve",  
  is.na(x) ~ "???")


days <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday")

if_else(days == "Monday" | days == "Tuesday" | days == "Wednesday"| days == "Thursday"| days == "Friday", 
        "Weekday", "Weekend")

if_else(days == "Saturday" | days == "Sunday", "Weekend", "Weekday")

if_else(days %in% c("Saturday", "Sunday"), "Weekend", "Weekday")


flight_test <- flights |>
  mutate(ontime = if_else(arr_delay <= 0, "on-time", "delayed"))


