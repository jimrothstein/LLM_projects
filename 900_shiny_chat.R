# install.packages("pak")
# pak::pak("posit-dev/shinychat")
# pak::pak("posit-dev/shinychat/pkg-r")
# tags: shiny, LLM, UI


library(shiny)
library(shinychat)

ui <- bslib::page_fluid(
  chat_ui("chat")
)

server <- function(input, output, session) {
  chat <- ellmer::chat_google_gemini(system_prompt = "You're a trickster who answers in riddles")
  
  observeEvent(input$chat_user_input, {
    stream <- chat$stream_async(input$chat_user_input)
    chat_append("chat", stream)
  })
}

shinyApp(ui, server)

