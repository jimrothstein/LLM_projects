library(shiny)
library(bslib)
library(querychat)

# self-contained;   run this code and shiny will appear ! 
# WORKS
library(querychat)
library(palmerpenguins)

chat <- ellmer::chat_google_gemini(
  model = "gemini-2.5-flash-lite"
)

querychat_app(penguins,
              client = chat)


