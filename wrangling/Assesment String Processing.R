# Assessment Part 2: String Processing Part 3

library(rvest)
library(tidyverse)
library(stringr)
url <- "https://en.wikipedia.org/w/index.php?title=Opinion_polling_for_the_United_Kingdom_European_Union_membership_referendum&oldid=896735054"
tab <- read_html(url) %>% html_nodes("table")
polls <- tab[[6]] %>% html_table(fill = TRUE)

head(polls)

class(polls)

names(polls) <- c("dates", "remain", "leave", "undecided", "lead", "samplesize", "pollster", "poll_type", "notes")
# Question 4
polls <- polls %>% filter(str_detect(polls$remain,"%"))
nrow(polls)

# Question 5

as.numeric(str_replace(polls$remain, "%", ""))/100
parse_number(polls$remain)/100

# Question 6

str_replace(polls$undecided, "N/A", "0")

# Question 7

temp <- str_extract_all(polls$dates, "\\d+\\s[a-zA-Z]{3,5}")
end_date <- sapply(temp, function(x) x[length(x)]) # take last element (handles polls that cross month boundaries)
