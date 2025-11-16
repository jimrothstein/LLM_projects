
# REF: https://drmowinckels.io/blog/2025/ollama/

library(ellmer)
library(gander)
library(chores)
library(ensure)



chores_chat  <-   ellmer::chat_github(model = "gpt-4o")

ensure_fn = "chat_github"
ensure_args = list(model = "gpt-4o")
.gander_chat = ellmer::chat_github(model = "gpt-4o")

.gander_chat


gander_chat("How many natural elements are there?")

ls()

?gander
#----------------------- gemini
Sys.getenv("GEMINI_API_KEY")
ellmer::chat_google_gemini(api_key = Sys.getenv("GEMINI_API_KEY"))
?chat_google_gemini




?.Renviron

Sys.getenv("GOOGLE_API_KEY")
curl "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=GEMINI_API_KEY" \
  -H 'Content-Type: application/json' \
  -X POST \
  -d '{
    "contents": [
      {
        "parts": [
          {
            "text": "Explain how AI works in a few words"
          }
        ]
      }
    ] # end contents
  }'



