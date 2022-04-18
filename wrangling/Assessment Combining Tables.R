# Assessment: Combining Tables

# Question 1

# 5 rows by 3 columns

 # Question 2

#  dat <- semi_join(tab1, tab2, by = “state”) 

# Question 3

# a,b,c 

# Question 4

final <- setdiff(df1, df2)

library(tidyverse)
library(Lahman)
top <- Batting %>% 
  filter(yearID == 2016) %>%
  arrange(desc(HR)) %>%    # arrange by descending HR count
  slice(1:10)    # take entries 1-10
top %>% as_tibble()

Master %>% as_tibble()

# Question 5

top_names <- top %>% left_join(Master) %>% select(playerID, nameFirst, nameLast, HR)


# Question 6

head(Salaries)

top_names <- top %>% right_join(top_names) %>%
  select(playerID, nameFirst, nameLast, HR)

top_salary <- Salaries %>% filter(yearID == 2016) %>%
  right_join(top_names) %>%
  select(nameFirst, nameLast, teamID, HR, salary)


# Question 7

head(AwardsPlayers)

awards_16 <- AwardsPlayers %>% filter(yearID == 2016)

top_16 <- inner_join(top_names,awards_16)

# How many players from the top 10 home run hitters won at least one award in 2016?

length(unique(top_16$playerID))


# How many players won an award in 2016 but were not one of the top 10 home run hitters in 2016?

length(setdiff(unique(awards_16$playerID),unique(top_names$playerID)))

