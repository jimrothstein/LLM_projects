options(.gander_chat = 
#          ellmer::chat_anthropic())
           ellmer::chat_google_gemini(
              model = "gemini-2.5-flash-lite"
))

gander::gander_peek()
library(ggplot2)

data("stackoverflow", package = "modeldata")


# HIGHTLIGHT,   Choose gander from Addins.   Returns R code.
stackoverflow

# Describe the stackoverflow table.
# Number of rows and number of columns


# plots
# unique entries in column 1
