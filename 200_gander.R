# set up chat, using gander, ellmer and ollama3.2
# works in emacs or rstudio


# in Rstudio,  Cntrl-Shift G activates window


pak::pak("simonpcouch/gander")
pak::pak("ellmer")

library("gander")
library("ellmer")
chat  <- chat_ollama(model = "llama3.2")
chat$chat("Tell me 2 jokes")
chat$chat("What is computer language R?")
chat$chat("yes I do.   Thanks for your answer")
`library(prime)`

then `is_prime(n)`

gander::gander_peek()

