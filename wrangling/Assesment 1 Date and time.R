# Assessment Part 1: Dates, Times, and Text Mining

library(dslabs)
library(lubridate)
options(digits = 3)    # 3 significant digits

# Which of the following is the standard ISO 8601 format for dates?

#YYYY-MM-DD

# Which of the following commands could convert this string into the correct date format?

dates <- c("09-01-02", "01-12-07", "02-03-04")
#It is impossible to know which format is correct without additional information.

# How many polls had a start date (startdate) in April (month number 4)?

data(brexit_polls)
head(brexit_polls)
brexit_polls %>% filter(month(brexit_polls$startdate) == 4) %>% nrow()

# se the round_date() function on the enddate column with the argument unit="week". How many polls ended the week of 2016-06-12?

brexit_polls %>% filter(round_date(brexit_polls$enddate,unit = "week") == "2016-06-12") %>% nrow()

# On which weekday did the greatest number of polls end?

weekdays(brexit_polls$enddate) %>% table()

# Load movielens

data(movielens)

head(movielens)

movielens$timestamp <- as_datetime(movielens$timestamp)

review_by_year <- table(year(movielens$timestamp))
which.max(review_by_year)

review_by_hour <- table(hour(movielens$timestamp))
which.max(review_by_hour)
