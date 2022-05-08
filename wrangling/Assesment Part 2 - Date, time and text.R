# Assessment Part 2: Dates, Times, and Text Mining

library(tidyverse)
library(gutenbergr)
library(tidytext)
options(digits = 3)

gutenberg_metadata

# How many different ID numbers are returned?

gutenberg_metadata %>% filter(str_detect(gutenberg_metadata$title,"Pride and Prejudice")) 

# What is the correct ID number?

gutenberg_works(title == "Pride and Prejudice")$gutenberg_id


# How many words are present in the book?

word <- gutenberg_download(gutenberg_works(title == "Pride and Prejudice")$gutenberg_id)
book <- gutenberg_download(1342)
identical(book,word)
words <- book %>%
  unnest_tokens(word, text)
nrow(words)

stop_words
# Remove stop words from the words object. Recall that stop words are defined in the stop_words data frame from the tidytext package.
words <- words %>%  filter(!word %in% stop_words$word)
nrow(words)

# After removing stop words, detect and then filter out any token that contains a digit from words.
words <- words %>% filter(!str_detect(word, "\\d+"))
nrow(words)

head(words)

# Analyze the most frequent words in the novel after removing stop words and tokens with digits.

# How many words appear more than 100 times in the book?

words %>% group_by(word) %>% summarize(n = n()) %>% arrange(desc(n)) %>% filter(n > 100) %>% nrow()

words %>% count(word) %>% top_n(1,n) %>% pull(n)


# Define the afinn lexicon:

afinn <- get_sentiments("afinn")

joined <- inner_join(words,afinn,by = "word")
nrow(joined)

# hat proportion of words in afinn_sentiments have a positive value?
joined %>% filter(value > 0) %>% nrow() / nrow(joined)

# How many elements of afinn_sentiments have a value of 4?
joined %>% filter(value ==4) %>% nrow()
