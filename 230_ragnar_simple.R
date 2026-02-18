library(ragnar)
library(envvar)
url = "https://csgillespie.github.io/efficientR/"  
md = read_as_markdown(url)

str(md)
md |> typeof()
md |> class()    # S7

# vectorize, 2 x 4, start, end, context, text
chunks = markdown_chunk(md)
chunks

?ragnar_store_create
?embed_google_gemini

# get API key  (from .Renviron);  needs special key (says expired, not so)
api_key = envvar::envvar_get("GEMINI_API_KEY_ragnar")
api_key

# Initialise a knowledge store with the Google Gemini embedding

store = ragnar_store_create(
  embed = embed_google_gemini()
)

# Insert the Markdown chunks
ragnar_store_insert(store, chunks)
