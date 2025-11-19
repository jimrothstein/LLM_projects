# set up chat, gander, ellmer and ollama3.2
# tags: openrouter, system_prompt, free tier
# works in emacs or rstudio


# in Rstudio,  Cntrl-Shift G activates window


pak::pak("simonpcouch/gander")
pak::pak("ellmer")

library("gander")
library("ellmer")

#------------------------  1. WORKS, but very slow

## (WORKS - very slow) very slow with local  deepseek-r1
chat  <- chat_ollama(model = "deepseek-r1")

# ------------------------  2. openrouter + model + system prompt 

# Connecting to a gpt model, via openrouter
# (WORKS) openrouter, free tier
chat  <- ellmer::chat_openrouter(model = "gpt-4o-mini",
                                 api_key = Sys.getenv("OPENROUTER_API_KEY"),
system_prompt = "
  You are an expert R programmer who prefers the tidyverse.
  Just give me the code. I don't want any explanation or sample data.
"
)
                                 )
chat$chat("Tell me a 1 joke")

chat$chat("Tell me 2 jokes")
chat$chat("What is computer language R?")
chat$chat("yes I do.   Thanks for your answer")
chat$chat("In linear algebra, what is a principal component?")

chat$chat("For mtcars dataset, please write R code to find principal components")
)
# ------------------------  3. code from LLM

```R
library(tidyverse)
library(broom)

# Standardizing the mtcars dataset without the 'mpg' column
mtcars_scaled <- mtcars %>% 
  select(-mpg) %>% 
  scale()

# Performing PCA
pca_result <- prcomp(mtcars_scaled, center = TRUE, scale. = TRUE)

# Summarizing PCA results
pca_summary <- tidy(pca_result)
pca_summary
```

#------------------------  4. WORKS  -- free model found on openrouter (11/25)
chat  <- ellmer::chat_openrouter(model = "kwaipilot/kat-coder-pro:free",
                         api_key = Sys.getenv("OPENROUTER_API_KEY"))

chat$chat("Tell me 1 joke")

gander::gander_peek()
