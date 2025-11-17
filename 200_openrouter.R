# set up chat, using gander, ellmer and ollama3.2
# works in emacs or rstudio


# in Rstudio,  Cntrl-Shift G activates window


pak::pak("simonpcouch/gander")
pak::pak("ellmer")

library("gander")
library("ellmer")

#------------------------  WORKS, but very slow

## (WORKS - very slow) very slow with local  deepseek-r1
chat  <- chat_ollama(model = "deepseek-r1")

# ------------------------  separate

# Connecting to a gpt model, via openrouter
# (WORKS) openrouter, free tier
chat  <- ellmer::chat_openrouter(model = "gpt-4o-mini",
                         api_key = Sys.getenv("OPENROUTER_API_KEY"))
chat$chat("Tell me a 1 joke")

chat$chat("Tell me 2 jokes")
chat$chat("What is computer language R?")
chat$chat("yes I do.   Thanks for your answer")
chat$chat("In linear algebra, what is a principal component?")


#------------------------  WORKS  -- free model found on openrouter (11/25)
chat  <- ellmer::chat_openrouter(model = "kwaipilot/kat-coder-pro:free",
                         api_key = Sys.getenv("OPENROUTER_API_KEY"))

chat$chat("Tell me 1 joke")


gander::gander_peek()
