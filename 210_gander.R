
# Gander in Rstudio

# In Rstudio,  set up add-in assistant (uses gander & ellmer)
# in Rstudio,  Cntrl-Shift G activates window
# REF:  https://openrouter.ai/kwaipilot/kat-coder-pro:free


pak::pak("simonpcouch/gander")
pak::pak("ellmer")

library("gander")
library("ellmer")



#------------------------  directions per gander::

options(.gander_chat = ellmer::chat_openrouter(model = "gpt-4o-mini",
                         api_key = Sys.getenv("OPENROUTER_API_KEY")))

library(ggplot2)

data("stackoverflow", package = "modeldata")

# To USE:
stackoverflow
# 1. select stackoverflow
# 2. trigger addin gander assistant
# 3. type plot salary vs years coded
# 4. R code should appear !





## This is created by gander:
ggplot(stackoverflow, aes(x = YearsCodedJob, y = Salary)) +
  geom_point() +
  labs(x = "Years Coded Job", y = "Salary") +
  theme_minimal()




#------------------------  WORKS  
chat  <- ellmer::chat_openrouter(model = "kwaipilot/kat-coder-pro:free",
                         api_key = Sys.getenv("OPENROUTER_API_KEY"))

chat$chat("Tell me 1 joke")


gander::gander_peek()

