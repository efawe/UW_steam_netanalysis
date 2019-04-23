library(readr)
library(tidyverse)
library(igraph)
tags <- read_csv("steam_tidy_game_tags.csv", col_names = TRUE)
genres <- read_csv("steam_zgamegenres_raw.csv", col_names = TRUE)

bigtable <- table(tags$id, tags$tag)
#head(bigtable)
# write.table(bigtable, "bigtable.csv", sep = ",")

network <- graph_from_incidence_matrix(bigtable)

bipartite.projection(network)

