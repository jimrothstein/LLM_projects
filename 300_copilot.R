#  in Rstudio only,   use copilot, just write comments ... it does the rest !

# USAGE:   write prompt as comment, move cursor down line, wait
# Wow ... copilot is aggressive and wants to  write all the code, a line at a time!

# write function to add two integers

f <- function(a, b) {
  return(a + b)
}


# write function to divide two numbers
g <- function(x, y) {
  return(x / y)
}


# lint this file
# install necessary packages
if (!requireNamespace("lintr", quietly = TRUE)) {
  install.packages("lintr")
}
library(lintr)
lintr::lint("300_copilot.R")
# format this file
if (!requireNamespace("styler", quietly = TRUE)) {
  install.packages("styler")
}
library(styler)
styler::style_file("300_copilot.R")

# summarize this file   -- too many issues installing this:
# if (!requireNamespace("summarytools", quietly = TRUE)) {
# install.packages("summarytools")
#}
# end of file
