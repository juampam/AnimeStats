# More on https://github.com/juampam/AnimeStats.git
# you can found the Data in: https://www.kaggle.com/CooperUnion/anime-recommendations-database 
install.packages("magrittr") 
install.packages("dplyr")  
install.packages("modeest")

library(magrittr) 
library(dplyr)    
library(ggplot2)
library(tidyverse)
library(modeest)

delete.na <- function(df, n=0) {
  df[rowSums(is.na(df)) <= n,]
}
animecl <- delete.na(anime)
# TOP 10 BEST ANIMES

animelist <-read.csv("anime.csv")
datos <- arrange(anime,-members)
datos

# TOP 10 WORST ANIMES
animelist <-read.csv("anime.csv")
datos <- arrange(anime,-members)
datos

# MOST FAMOUS GENRES
mlv(anime$genre, method = "mfv")
genres <-table (anime$genre)
length(anime$genre[anime$genre == "hentai"])
length(anime$genre[anime$genre == "Shounen"])
length(anime$genre[anime$genre == "Comedy"])
length(anime$genre[anime$genre == "Action"])
length(anime$genre[anime$genre == "Seinen"])
length(anime$genre[anime$genre == "Mystery"])
length(anime$genre[anime$genre == "Supernatural"])

# MOST FAMOUS GENRES "GRAPHICS"

# R barplot Graph
table(anime$genre)
barplot(table(anime$genre))

# GGplot2 bar
ggplot(data = anime, mapping = aes(x = factor(genre))) + 
  geom_bar() +
  coord_flip()

#============================================================
# MOVIES
df <- list(anime)
df<-df%>%filter(!str_detect( type, "Movie"))
