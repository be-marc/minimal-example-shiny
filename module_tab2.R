tab2UI <- function(id) {
  ns <- shiny::NS(id)

  shiny::fluidRow(
    shiny::column(4, sliderInput(ns("bins"),
      "Number of bins:",
      min = 1,
      max = 50,
      value = 50
    )),
    shiny::column(
      8,
      shiny::plotOutput(ns("histogram"))
    )
  )
}

tab2 <- function(input, output, session, tab1Input) {
  slider_value <- reactiveVal(30)

  # Update slider value from tab1
  observeEvent(input$bins, {
    slider_value(input$bins)
  })

  # Update slider value from tab2
  observeEvent(tab1Input()$bins, {
    slider_value(tab1Input()$bins)
  })

  # Render histogram
  output$histogram <- renderPlot({
    print(slider_value())
    
    # Add sleep to simulate long calculation
    Sys.sleep(4)
    x <- faithful[, 2]
    bins <- seq(min(x), max(x), length.out = slider_value() + 1)
    hist(x, breaks = bins, col = "darkgray", border = "white")
  })
}
