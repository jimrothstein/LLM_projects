library(shiny)
library(bslib)
library(querychat)
library(DT)
library(palmerpenguins)

# Step 1: Initialize QueryChat

chat <- ellmer::chat_google_gemini(
  model = "gemini-2.5-flash-lite"
)
qc <- QueryChat$new(penguins, client = chat, greeting = "SQLs from English")

# Step 2: Add UI component
ui <- page_sidebar(
    sidebar = qc$sidebar(),
    card(
        card_header("Data Table"),
        dataTableOutput("table")
    ),
    card(
        fill = FALSE,
        card_header("SQL Query"),
        verbatimTextOutput("sql")
    )
)

# Step 3: Use reactive values in server
server <- function(input, output, session) {
    qc_vals <- qc$server()
    
    output$table <- renderDataTable({
        datatable(qc_vals$df(), fillContainer = TRUE)
    })
    
    output$sql <- renderText({
        qc_vals$sql() %||% "SELECT * FROM penguins"
    })
}

shinyApp(ui, server)
