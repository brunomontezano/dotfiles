# The .First function is called after everything else in .Rprofile is executed

.First <- function() {
    message("Welcome back ", Sys.getenv("USER"), "!\n", "working directory is: ", getwd())
}

options(digits = 12)                            # Number of digits to print. Default is 7, max is 15
options(stringsAsFactors = FALSE)               # Disable default conversion of character strings to factors
options(editor="nvim")                          # Set NeoVim as my editor
options(scipen=10)                              # Forces R to never use scientific notation

if(Sys.getenv("TERM") == "st-256color")
    library("colorout")

.Last <- function() {
    if (interactive()) {
        hist_file <- Sys.getenv("R_HISTFILE")
        if (hist_file == "") hist_file <- "~/.RHistory"
        savehistory(hist_file)
    }
}
