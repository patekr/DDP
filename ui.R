library(shiny)

shinyUI(fluidPage(
  titlePanel("Predict MPG from Displacement"),
  sidebarLayout(
    sidebarPanel(
       sliderInput("sliderDisp", "What is the displacement of the vehicle?",70, 475, value = 25),
       checkboxInput("showModel", "Show/Hide Model", value = TRUE)
    ),
    mainPanel(
       plotOutput("plot1"),
       h4("Predicted MPG from Displacement:"),
       textOutput("pred")
    )
  )
))
