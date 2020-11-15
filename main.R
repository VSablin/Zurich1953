# %% ---------------------------------------------------------------
# This script computes the ranking corresponding to each round

# %% ---------------------------------------------------------------
# Global variables
DIR_IN <- "data-input/"

# %% ---------------------------------------------------------------
# Load packages
library(dplyr)

# %% ---------------------------------------------------------------
# Source functions
str_functions <- list.files("functions")
for (string in str_functions) {
    source(paste0("functions/",
                  string))
}

# %% ---------------------------------------------------------------
# Init data frame

str_players <- get_players()
int_rows <- length(str_players)
int_columns <- 30
df_results <- as.data.frame(matrix(rep(0,
                                       int_columns*int_rows),
                                   int_rows,
                                   int_columns))

row.names(df_results) <- str_players
str_columns <- gsub(pattern = "^V",
                    replacement = "Ronda",
                    x = names(df_results))
for (index in 1:length(str_columns)) {
    if (nchar(str_columns[index]) == 6) {
        str_columns[index] <- paste0(substr(x = str_columns[index],
                                            start = 1,
                                            stop = 5),
                                     "0",
                                     substr(x = str_columns[index],
                                            start = 6,
                                            stop = 6))
    }
}
names(df_results) <- str_columns

# %% ---------------------------------------------------------------
# Getting files with "Ronda[0-9]"

str_dirs <- list.files(DIR_IN)
str_dirs <- grep(pattern = "Ronda[0-9]",
                 x = str_dirs,
                 value = TRUE)

# ordering (just in case)
str_dirs <- sort(str_dirs)

# full path
str_dirs <- paste0(DIR_IN,
                   str_dirs,
                   "/")

# %% ---------------------------------------------------------------
# feeding df_results

# Loop over directories
# debugging
string <- str_dirs[3]
for (string in str_dirs) {
    str_round <- strsplit(x = string, split = "/")[[1]][2]
    # Loop over files
    str_files <- list.files(string)
    # debugging
    string_file <- str_files[1]
    for (string_file in str_files) {
        str_players_game <- string_file %>%
            strsplit(split = "_vs_") %>%
            unlist()
        str_players_game <- gsub(pattern = ".pgn",
                                 replacement = "",
                                 x = str_players_game)
        str_player_1 <- str_players_game[1]
        str_player_2 <- str_players_game[2]
        string_pgn <- readLines(paste0(string,
                                       string_file))
        # Sanity check: white
        int_white <- grep(paste0("\\[White \"", str_player_1, "\"\\]"),
                          string_pgn)
        if (length(int_white) != 1) {
            stop("We canot find ", str_player_1, " as white player in ", paste0(string,
                                                                                string_file))
        }
        # Sanity check: black
        int_black <- grep(paste0("\\[Black \"", str_player_2, "\"\\]"),
                          string_pgn)
        if (length(int_black) != 1) {
            stop("We canot find ", str_player_2, " as black player in ", paste0(string,
                                                                                string_file))
        }
        # Finding result
        int_result <- grep(pattern = "^\\[Result \"", x = string_pgn)
        if (length(int_result) != 1) {
            stop("More than one line with result pattern in", paste0(string,
                                                                     string_file))
        }
        string_result <- gsub(pattern = "^\\[Result \"",
                              replacement = "",
                              x = string_pgn[int_result])
        string_result <- gsub(pattern = "\"\\]$",
                              replacement = "",
                              x = string_result)
        if (string_result == "1/2-1/2") {
            float_res_1 <- 0.5
            float_res_2 <- 0.5
        } else if (string_result == "1-0") {
            float_res_1 <- 1
            float_res_2 <- 0
        } else if(string_result == "0-1") {
            float_res_1 <- 0
            float_res_2 <- 1
        } else {
            stop("The result in ", paste0(string ,"/", string_file), " is not 1/2-1/2, 1-0, or 0-1. Stop.")
        }
        
        df_results[row.names(df_results) == str_player_1,
                   str_round] <- float_res_1
        df_results[row.names(df_results) == str_player_2,
                   str_round] <- float_res_2
    }
}

# %% ---------------------------------------------------------------
# create and feed df_ranking

df_ranking <- df_results

int_max_round <- str_dirs %>%
    max() %>%
    strsplit(split = "/") %>%
    lapply(FUN = function(x) {x[[2]]}) %>%
    unlist() %>%
    substring(first = 6,
              last = 7) %>%
    as.integer()

# debugging
str_player <- str_players[1]
for (str_player in str_players) {
    for (int_col in 1:int_max_round) {
        df_ranking[str_player,int_col] <- sum(df_results[str_player,1:int_col])
    }
}

int_order <- order(df_ranking[,names(df_ranking)[int_max_round]],
                   decreasing = TRUE)
df_ranking <- df_ranking[int_order,]

# %% ---------------------------------------------------------------
# save output

write.csv(x = df_ranking,
          file = paste0("data-output/ranking.csv"))