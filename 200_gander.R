# set up chat, using gander, ellmer and ollama3.2
# works in emacs or rstudio


# in Rstudio,  Cntrl-Shift G activates window


pak::pak("simonpcouch/gander")
pak::pak("ellmer")

library("gander")
library("ellmer")


## (WORKS - very slow) very slow with local  deepseek-r1
chat  <- chat_ollama(model = "deepseek-r1")

# (WORKS) openrouter, free tier
chat  <- chat_openrouter(model = "gpt-4o-mini",
                         api_key = Sys.getenv("OPENROUTER_API_KEY"))


chat$chat("Tell me 2 jokes")
chat$chat("What is computer language R?")
chat$chat("yes I do.   Thanks for your answer")
chat$chat("In linear algebra, what is a principal component?")


`library(prime)`

then `is_prime(n)`

gander::gander_peek()

