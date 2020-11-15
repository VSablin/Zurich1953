# Zurich1953

Repo with the pgn's of the 1953 Candidates Tournament.

## Directory structure

The input data are in data-input/. Inside, there is a directory for each round: "Ronda01", "Ronda02", etc. ("Ronda" is "Round" in Spanish).
The output is in data-output/.
In functions/ there are functions for the R code in the repo.

## Output

In data-output/, there is ranking.csv, a data frame whose rows are the players of the tournament and the columns the rounds. The entries are the points the players have at that round. The data frame is ordered accordingly to the last round with games.

## Code

There is an R script, main.R, to find data-output/ranking.csv.