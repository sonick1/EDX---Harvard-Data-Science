# Assessment Part 2: Data Import

library(tidyverse)

url <- "https://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer-wisconsin/wdbc.data"

dat <- read.csv(url,header = FALSE)

# How many rows are in the dataset ?

nrow(dat)

ncol(dat)

View(dat)
