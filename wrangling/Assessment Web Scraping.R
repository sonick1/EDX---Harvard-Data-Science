# Assessment: Web Scraping
library(tidyverse)
library(rvest)
url <- "https://web.archive.org/web/20181024132313/http://www.stevetheump.com/Payrolls.htm"
h <- read_html(url)

nodes <- html_nodes(h, "table")

html_text(nodes[[8]])

tab <- html_table(nodes[[8]])

# Question 1

tab_1 <- html_table(nodes[[1]])
head(tab_1)

tab_2 <- html_table(nodes[[2]])
head(tab_2)

tab_3 <- html_table(nodes[[3]])
head(tab_3)

tab_4 <- html_table(nodes[[4]])
head(tab_4)

# Alternate and easy method
sapply(nodes[1:4], html_table)    # 2, 3, 4 give tables with payroll info

# Question 2

length(nodes)

sapply(nodes[19:21], html_table)    # 2, 3, 4 give tables with payroll info

# Question 3

tab1 <- as.data.frame(html_table(nodes[[10]]))
tab2 <- as.data.frame(html_table(nodes[[19]]))

names(tab1) <- tab1[1,]
tab1 <- tab1[-1,c("Team","Payroll","Average")]

names(tab2) <- tab2[1,]
tab2 <- tab2[-1,]

fin_t <- full_join(tab1,tab2,by = "Team")

nrow(fin_t)

# Question 4 

library(rvest)
library(tidyverse)
url <- "https://en.wikipedia.org/w/index.php?title=Opinion_polling_for_the_United_Kingdom_European_Union_membership_referendum&oldid=896735054"
tab <- read_html(url) %>% html_nodes("table")
length(tab)

html_table(nodes,fill = TRUE)
