library(shiny)

source("module_tab1.R")
source("module_tab2.R")

ui <- tagList(
  shiny::navbarPage(
    id = "navbar",
    title = "Minimal Example",
    shiny::tabPanel(
      title = "tab1",
      tab1UI("tab1")
    ),
    shiny::tabPanel(
      title = "tab2",
      tab2UI("tab2")
    )
  )
)

server <- function(input, output, session) {
  tab1Output <- shiny::callModule(tab1, "tab1")
  tab2Output <- shiny::callModule(tab2, "tab2", tab1Output)
}

shinyApp(ui = ui, server = server)
