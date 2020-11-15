# Zurich1953

Repo with the pgn files of the Zurich-1953 Candidates Tournament.

## Input

The input data are in data-input/. Inside, there is a directory for each round: "Ronda01", "Ronda02", etc. ("Ronda" is "Round" in Spanish). In every directory, there are pgn files with the games corresponding to the files. The comments in the files are in Spanish.

## Output

The output is in data-output/. There is a file, ranking.csv, a data frame whose rows are the players of the tournament and the columns the rounds. The entries are the points the players have at that round. The data frame is ordered accordingly to the last round with games.

## Code

There is an R script, main.R, to find data-output/ranking.csv. The script is in the root directory. In functions/ there are functions the script uses.
