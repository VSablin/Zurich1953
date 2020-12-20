# Zurich1953

Repo with the pgn files of the Zurich-1953 Candidates Tournament with the comments of "Zurich International Chess Tournament 1953".

## Input

The input data are in data-input/. Inside, there is a directory for each round: "Ronda01", "Ronda02", etc. ("Ronda" is "Round" in Spanish). In every directory, there are pgn files with the games corresponding to the files. The comments in the files are in Spanish.

## Output

The output is in data-output/. There is a file, ranking.csv, a data frame whose rows are the players of the tournament and the columns the rounds. The entries are the points the players have at that round. The data frame is ordered accordingly to the last round with games.

## Code

There is an R script, main.R, to find data-output/ranking.csv. The script is in the root directory. In functions/ there are functions the script uses.

## Best games

The best games are, in my opinion:

* Round 02:
	* Geller-Euwe.
	* Reshevsky-Petrosian.
* Round 04:
	* Smyslov-Stahlberg.
	* Taimanov-Najdorf.
* Round 05:
	* Petrosian-Taimanov.
	* Szabo-Bronstein.
* Round 06:
	* Bronstein-Euwe.
* Round 08:
	* Reshevsky-Kotov.
* Round 09:
	* Euwe-Najdorf.
	* Kotov-Bronstein.
	* Smyslov-Keres.
* Round 10:
	* Averbaj-Szabo.
	* Gligoric-Kotov.
* Round 11:
	* Euwe-Averbaj.
	* Geller-Gligoric.
	* Keres-Reshevsky.
	* Smyslov-Bronstein.
* Round 12:
	* Bronstein-Keres.
	* Taimanov-Geller.
* Round 14:
	* Averbaj-Kotov.
* Round 15:
	* Kotov-Boleslavsky.
* Round 17:
	* Stahlberg-Kotov.
* Round 18:
	* Smyslov-Euwe.
* Round 19:
	* Boleslavsky-Geller.
	* Petrosian-Gligoric.
* Round 20:
	* Taimanov-Petrosian.
	* Geller-Kotov.

## WARNING!

The comments in the pgn files are in Spanish, but the notation is in English. That is, "Queen moves to e2" is "Qe2" instead of "De2". We took this approach because we generated the pgn files with www.chess.com and this platform uses the English notation.