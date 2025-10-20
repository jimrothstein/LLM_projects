# install.packages("remotes")
remotes::install_github("JBGruber/rollama")

library(rollama)

# default, but make explicit
options(rollama_server = "http://localhost:11434")
options(rollama_config = "You make short answers understandable to a 5 year old")
# default is llama3.1 8b
options(rollama_model = "llama3.2:3b-instruct-q4_1")

rollama::ping_ollama()    # YES
#> ▶ Ollama (v0.6.2) is running at <http://localhost:11434>!



# pull default model;   ouch ~ 5 GB  (llama3.1)
rollama::pull_model()
rollama::list_models()   # available locally


# slow, but detailed
chat("Why is sky blue?")

# No, it says it does not.
chat("Do you know the R computer programming language?")
# start new:   new_chat()



# ------------------------ zero-shot
library(tibble)
library(purrr)
q <- tribble(
  ~role,    ~content,
  "system", "You assign texts into categories. Answer with just the correct category.",
  "user",   "text: the pizza tastes too salty\ncategories: positive, neutral, negative"
)
q

query(q)
# ------------------------ 1-shot (1 example)

q <- tribble(
  ~role,    ~content,
  "system", "You assign texts into categories. Answer with just the correct category.",
  "user", "text: the pizza tastes terrible\ncategories: positive, neutral, negative",
  "assistant", "Category: Negative",
  "user", "text: the service is great\ncategories: positive, neutral, negative"
)
query(q)

# repeat, but make it reply in JSON format
q <- tribble(
  ~role,    ~content,
  "system", "You assign texts into categories. Answer with just the correct category.",
  "user", "text: the pizza tastes terrible\ncategories: positive, neutral, negative",
  "assistant", "{'Category': 'Negative'}",
  "user", "text: the service is very slow\ncategories: positive, neutral, negative"
)
query(q)

# NeXT:  Fancier; and use pluck()
