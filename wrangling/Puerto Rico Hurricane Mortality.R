library(tidyverse)
library(pdftools)
options(digits = 3)    # report 3 significant digits

fn <- system.file("extdata", "RD-Mortality-Report_2015-18-180531.pdf", package="dslabs")
system("cmd.exe", input = paste("start", fn))

# Question 2
txt <- pdf_text(fn)
class(txt)
length(txt)

# Question 3
x <- str_split(txt[9],"\n")
x

class(x)
length(x)

# Question 4
s <- x[[1]]
s

class(s)
nrow(s)

# Question 5

s <- str_trim(s)
s[1]

# Question 6
s

header_index <- str_which(s,"2015")
header_index[1]

# Question 7

header <- s[header_index[1]]
tmp <- str_split(s[header_index], "\\s+", simplify = TRUE)
month <- tmp[1]
header <- tmp[-1]
month
header
header[3]
class(tmp)

# Question 8

tail_index <- str_which(s,"Total")
tail_index

# Question 9  
n <- str_count(s,'\\d+')
sum(n == 1)


# Question 10
out <- c(1:header_index, which(n==1), tail_index:length(s)) 
s <- s[-out]
length(s)

# Question 11

s <- str_remove_all(s, "[^\\d\\s]")
s

# Question 12

s <- str_split_fixed(s, "\\s+", n = 6)[,1:5]
s
k <- as.data.frame(s)
k
mean()


tab <- s %>% 
  as_data_frame() %>% 
  setNames(c("day", header)) %>%
  mutate_all(as.numeric)
tab

mean(tab$`2015`)
mean(tab$"2016")


# Q13
tab <- tab %>% gather(year, deaths, -day) %>%
  mutate(deaths = as.numeric(deaths))
tab

# Q14
tab %>% filter(year < 2018) %>%
  ggplot(aes(x = day, y = deaths, color = year)) +
  geom_line() +
  geom_vline(xintercept=20) + #adding a vertical line
  geom_point()                #adding line markers


# https://github.com/wernerdassuncao/data_wrangling/blob/master/puerto_rico_hurricane_mortality_part1.md?msclkid=f942f7c2cead11eca9b1a8f91d5695b4