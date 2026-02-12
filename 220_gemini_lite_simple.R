
# simple chat


library(ellmer)
# ------------------------ WORKS

# 2/26 WORKS!
chat  <-   ellmer::chat_openrouter(model = "deepseek/deepseek-r1-0528:free")
chat$chat("Tell me a joke about statisticians")





# 2/26
# Works!
chat <- ellmer::chat_google_gemini(
  model = "gemini-2.5-flash-lite"
)

chat$chat("Be terse.  What is the package dplyr in R?")
chat$chat("What  is a tibble?")

