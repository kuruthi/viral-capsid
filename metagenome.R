library(tidyverse)
library(rvest) ## for possibly scraping the web pages to directly get the json data
library(jsonlite) ## helped me import the json file into a dataframe ## the only one that worked for me

setwd("~/metagenome_project/json_files")
### Importing the pangong tso species nested list as a tibble

pangong_data <- fromJSON(txt = "pangong.json", simplifyDataFrame = TRUE)
colnames(pangong_data) <- c("Id", "Parent","Name","Total_count","Percent","kbp","c")
pangong_tibble <- as_tibble(pangong_data)
pangong_tibble$Parent
View(pangong_tibble)
