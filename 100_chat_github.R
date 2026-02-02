
# simple chat


library(ellmer)
# ------------------------ WORKS

# 2/26 WORKS!
chat  <-   ellmer::chat_openrouter(model = "deepseek/deepseek-r1-0528:free")
chat$chat("Tell me a joke about statisticians")


# DOES NOT WORK   (ellmer error?)
chat <- ellmer::chat_github()

# also no good 
chat <- ellmer::chat_github(model = "gpt-4.1")
chat$chat("What is R?")

#chat  <-   ellmer::chat_github(model = "gpt-4o")
# chat  <-   ellmer::chat_openrouter(model = "gpt-4o")


