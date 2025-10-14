# install.packages("remotes")
remotes::install_github("JBGruber/rollama")


# at CLI:    ollama start <CR>

rollama::ping_ollama()    # YES
#> ▶ Ollama (v0.6.2) is running at <http://localhost:11434>!



# pull default model;   ouch ~ 5 GB
rollama::pull_model()
