init_empty_df <- function(int_rows, int_columns, str_players) {
    df_out <- as.data.frame(matrix(rep(0,
                                       int_columns*int_rows),
                                       int_rows,
                                       int_columns))
    
    row.names(df_out) <- str_players
    str_columns <- gsub(pattern = "^V",
                        replacement = "Ronda",
                        x = names(df_out))
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
    names(df_out) <- str_columns

    return(df_out)
}