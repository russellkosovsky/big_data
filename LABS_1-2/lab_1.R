## lab 1: 9/1/23
install.packages("nycflights13")
library(tidyverse)
library(nycflights13)

integers <- c(1,2,3,4,5)
integers * 2
integers - 1
long_variable_name <- 3 * 5
x <- "Hello World!"

## ways to view/display data
View(flights)
glimpse(flights)
print(flights, width = Inf)
flights

flights |>
  filter(dest == "IAH") |>
  group_by(year,month,day) |>
  summarize(
    arr_delay = mean(arr_delay, na.rm = TRUE)
  )

flights |>
  group_by(month) |>
  summarize(delay = mean(dep_delay, na.rm = TRUE), n = n())

# AVERAGE LEVEL OF DELAY IN ARRIVAL TIME AND HOW MANY FLIGHTS
avrg_delay <- flights |>
  group_by(dest) |>
  summarize(delay = mean(arr_delay, na.rm = TRUE), n = n())


# filter() function allows to only keep the rows u want
flights |>
  # keep rows (flights) that departed more than 120 min late
  filter(dep_delay > 120)

flights|>
  filter(dep_delay != 60)

## flights that left on january 1st
flights|>
  filter(month == 1 & day == 1)

## flights that left in january or march
flights|>
  filter(month == 1 | month == 3)

## to save... assign to a variable
janmarch <- flights |>
  filter(month == 1 | month == 3)

## arrange() function.... by ascending order by default
flights |>
  arrange(year, month, day, dep_time)

## distinct() function gets rid of duplicates
flights |>
  distinct()

flights |>
  distinct(origin, dest)

## keep_all = TRUE will keep all other rows for the distinct ones
flights |>
  distinct(origin, dest, .keep_all = TRUE)


################################################################################
## Q.1: was there a flight on everyday of 2013?
flights |>
  distinct(month, day, .keep_all = TRUE)
  
## Q.2: in a single pipeline for each condition, find all flights that meet the condition
## departed in summer(july,august,and september) (variable = month)
## and
## were operated by United or American (variable: carrier UA and AA are airline codes)
flights |>
  filter(month == 7 | month == 8 | month == 9) |>
  filter(carrier == "UA" | carrier == "AA")

## Q.3: Which flights traveled the farthest distance? which traveled the least distance?
by_asc_distance <- flights |>
  arrange(distance)
by_desc_distance <- flights |>
  arrange(desc(distance))


### COLUMNS
## mutate() function allows us to create new columns

flights |>
  mutate(gain = dep_delay - arr_delay, speed = distance / air_time * 60, .before = 1)

flights |>
  rename(tail_num = tailnum)


### Q.1.2
flights |>
  rename(air_time_min = air_time) |>
  relocate(air_time_min, .before = 1)

### Q.2.2
delay <- flights |>
  mutate(delay = dep_time - sched_dep_time)

### SEPTEMBER 5th lecture

billboard |>
  pivot_longer(
    cols = -c("artist", "track", "date.entered"),
    names_to = "week",
    values_to = "rank")

cms_patient_experience |>
  pivot_wider(
    names_from = measure_cd,
    values_from = prf_rate)

df <- tribble(
  ~id, ~bp1, ~bp2,
  "A", 100, 120,
  "B", 140, 115,
  "C", 120, 125 )

df |>
  pivot_longer(
    cols = -c("id"),
    names_to = "bp1",
    values_to = "bp2")


df <- tribble(
  ~id, ~measurement, ~value,
  "A", "bp1", 100,
  "B", "bp1", 140,
  "B", "bp2", 115,
  "A", "bp2", 120,
  "A", "bp3", 105 )

df |>
  pivot_wider(
    names_from = measurement,
    values_from = value)





