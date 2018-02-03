library(dplyr)
library(tidytext)
library(janeaustenr)

biga<-austen_books() %>% unnest_tokens(bigram, text, token="ngrams",n=2)

biga %>% count(bigram, sort=T)

library(tidyr)
#separate - split colum on multy

biga_s<- biga %>% separate(bigram, c("word1","word2"), sep=" ")

biga_f <- biga_s %>% filter(!word1 %in% stop_words$word) %>%
  filter(!word2 %in% stop_words$word)

biga_count<- biga_f %>%  count(word1, word2, sort=T)

#unite inverse separate to count ngrams (bigrames) in text

biga_u <-biga_f %>% unite(bigram, word1, word2, sep=" ")
biga_u

# 3-grams

austen_books() %>% unnest_tokens(trigram, text, token="ngrams",n=3) %>% 
  separate(trigram, c("w1","w2","w3"), sep="") %>%
  filter (!w1 %in% stop_words$word) %>%
  filter (!w2 %in% stop_words$word) %>% filter(!w3 %in% stop_words$word) %>% 
  count(w1,w2,w3, sort=T)
  
# make tf-idf
biga_tf <-biga_u %>% count (book,bigram) %>% bind_tf_idf(bigram, book, n) %>%
  arrange(desc(tf_idf))

#find streets
biga_f %>% filter(word2=="street") %>%
  count(book,word1,sort=T)

#tibble - no row names and stringsAsfactors=F

#library(tidytext)
austen_books() %>% unnest_tokens(word, text)

library(stringr)
boo<-austen_books() %>% 
  group_by(book) %>% 
  mutate(
    linenumber=row_number(),
    chapter=cumsum(str_detect(
      text,regex("^chapter [\\divxlc]", ignore_case=T)))) %>%
  ungroup()

boo

#stop_words
data(stop_words)

boo %>% filter(!text %in% stop_words$word)

library(gutenbergr)
bro<- gutenberg_download(c(1260,768,969))
br<-bro %>% unnest_tokens(word, text) %>% anti_join(stop_words)

br%>% count(word, sort=T)

