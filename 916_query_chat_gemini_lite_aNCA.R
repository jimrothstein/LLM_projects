# 916_query_chat_gemini_lite_aNCA.R
# Shiny App, uses querychat + csv data from aNCA
# Allows natural lang questions of dataset (convers to SQL and runs)


library(shiny)
library(bslib)
library(querychat)

# load aNCA daa
x <- read.csv("example-ADNCA.csv")

chat <- ellmer::chat_google_gemini(
  model = "gemini-2.5-flash-lite"
)

querychat_app(x,
              greeting = "Translate English to SQL",
              client = chat)
