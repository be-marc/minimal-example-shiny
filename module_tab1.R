tab1UI <- function(id) {
  ns <- shiny::NS(id)

  shiny::fluidRow(
    shiny::column(
      4,
      sliderInput(ns("bins"),
        "Number of bins:",
        min = 1,
        max = 50,
        value = 1
      )
    ),
    shiny::column(8)
  )
}

tab1 <- function(input, output, session) {

  # Reactive list for data transfer from module 1 to module 2
  tab1Output <- shiny::reactive(
    list(
      bins = input$bins
    )
  )

  return(tab1Output)
}