# Exercise 6: DPLYR join introduction

# Install the nycflights13 package and read it in. Require the dplyr package.
# install.packages("nycflights13")
library(nycflights13)
library(dplyr)
require(dplyr)

# Create a dataframe of the average arrival delay for each destination, then use left_join
# to join on the "airports" dataframe, which has the airport info
avg.arr.delay <- flights %>% group_by(dest) %>% summarize(avg.arrdelay = mean(arr_delay, na.rm = TRUE))
avg.arr.delay <- left_join(avg.arr.delay, airports, by = c('dest' = 'faa'))
# Create a dataframe of the average arrival delay for each airline, then use left_join
# to join on the "airlines" dataframe, which has the airline info

avg.carrier.arr.delay <- flights %>% group_by(carrier) %>% summarize(avg.arrdelay = mean(arr_delay, na.rm= TRUE))
avg.carrier.arr.delay <- left_join(avg.carrier.arr.delay, airlines, by = 'carrier')

### Bonus ###
# Calculate the average delay by city AND airline, then merge on the city and airline information
delay <- flights %>% group_by(dest, carrier) %>% summarize(avg.delay = mean(arr_delay, na.rm = TRUE))
delay <- left_join(delay, )
# If you're running into sorting issues:
# http://stackoverflow.com/questions/26555297/dplyr-arrange-a-grouped-df-by-group-variable-not-working