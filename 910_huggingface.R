## REF
## https://www.freecodecamp.org/news/how-to-create-a-deepseek-r1-api-in-r-with-plumber/

api_key=Sys.getenv("HUGGING_FACE_TOKEN")
library(httr2)
library(plumber)



#* @post /deepseek_chat
function(prompt) {
  url <- "https://huggingface.co/api/inference-proxy/together/v1/chat/completions"

  # Create a request object
  req <- request(url) |>
    req_auth_bearer_token(api_key) |>
    req_body_json(list(
      model = "deepseek-ai/DeepSeek-R1",
      messages = list(
        list(role = "user", content = prompt)
      ),
      max_tokens = 500,
      stream = FALSE
    ))

  # Perform the request and capture the response
  res <- req_perform(req)

  # Parse the JSON response
  parsed_data <- res |>
    resp_body_json()

  # Extract the content from the response
  content <- parsed_data$choices
  return(content)
}
