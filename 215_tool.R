
# Make AI Agent
# 1. create function
# 2. create tool, using function
# 3. register tool
# 4. chat
# 5. log what happened
# REF: https://www.seascapemodels.org/posts/2025-11-10-make-an-ai-agent-in-r/

read_help_as_text <- function(topic, pkg = NULL) {
    h <- utils::help(topic, package = eval(pkg))  # convert string to symbol?
    if (length(h) == 0) stop("Help topic not found")
    rd <- utils:::.getHelpFile(h)             
    txt <- paste(capture.output(tools::Rd2txt(rd)), collapse = "\n")
    return(txt)
}

# why eval(pkg)
topic = "lm"
pkg = "stats"
utils::help(topic, package = eval(pkg))  # works
utils::help(topic, package = pkg)   # error



help_txt <- read_help_as_text("lm")
help_txt <- read_help_as_text("formula", pkg = "stats")  # stats optional
cat(substr(help_txt, 1, 1500), "\n")


# 2. create tool
read_help_as_text <- ellmer::tool(
  read_help_as_text,
  description = "Returns an R help file as a string",
  topic = ellmer::type_string(
      "R function or topic",
      required = TRUE
    ),
    pkg = type_string(
      "R package to get help file from",
      required = FALSE
    )
)

# 3. use tool
#chat <- chat_anthropic(model = "claude-haiku-4-5")

chat  <- ellmer::chat_openrouter(model = "kwaipilot/kat-coder-pro:free",
                         api_key = Sys.getenv("OPENROUTER_API_KEY"))
chat$register_tool(read_help_as_text)

chat$chat("Quote the definition of residuals from the lm() function, don't provide any other explanation or code")


# log of what happened
chat




