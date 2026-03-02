# STATUS
#  errors when try to create Store;  wants to see function

library(ragnar)
library(envvar)
url = "https://csgillespie.github.io/efficientR/"  
md = ragnar::read_as_markdown(url)

str(md)
md |> typeof()
md |> class()    # S7

# vectorize, 2 x 4, start, end, context, text
chunks = markdown_chunk(md)

# Initialise a knowledge store with the Google Gemini embedding

store = ragnar_store_create(
  embed = \(x) ragnar::embed_google_gemini(
   x = chunks,
   model = "gemini-embedding-001",
   base_url = "https://generativelanguage.googleapis.com/v1beta",
   api_key = api_key,
   dims = NULL,
   task_type = "RETRIEVAL_QUERY",
   batch_size = 20L
 )
)
# errros:   says object 'chunks' not found
# Insert the Markdown chunks
ragnar_store_insert(store, chunks)
