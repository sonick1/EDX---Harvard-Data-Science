# Assessment Part 2: Reshaping Data

library(tidyverse)
library(dslabs)

View(co2)

# Question 10

co2_wide <- data.frame(matrix(co2, ncol = 12, byrow = TRUE)) %>% 
  setNames(1:12) %>%
  mutate(year = as.character(1959:1997))

co2_tidy <- gather(co2_wide,month,co2,-year)

# Question 11

co2_tidy %>% ggplot(aes(as.numeric(month), co2, color = year)) + geom_line()
# CO2 concentrations are highest around May and the yearly average increased from 1959 to 1997.

# Question 12 

library(dslabs)
data(admissions)
dat <- admissions %>% select(-applicants)

dat_tidy <- spread(dat, gender, admitted)

# Question 13

tmp <- gather(admissions, key, value, admitted:applicants)
tmp

tmp2 <- unite(tmp, column_name, c(key, gender))


# Question 14

# Spread