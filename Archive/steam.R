library(igraph)
library(readr)
library(tidyverse)
tags <- read_csv("steam_tidy_game_tags.csv", col_names = TRUE)
genres <- read_csv("steam_zgamegenres_raw.csv", col_names = TRUE)

f <- tags %>%
    group_by(id) %>%
    count() %>%
    group_by(n) %>%
    count()

f <- plyr::rename (f, c("n" = "no_tags", "nn" = "count"))

ggplot(f, mapping = aes(x = no_tags, y = count)) +
    geom_point()

mean(f$no_tags)

bigtable <- table(tags$id, tags$tag)
head(bigtable)
#write.table(bigtable, "bigtable.csv", sep = ",")

bigtable[1:100, 1:100]

tags_igraph = graph_from_incidence_matrix(bigtable)

plot.igraph(tags_igraph)