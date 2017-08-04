library(shiny)
shinyServer(function(input, output){
  model <- lm(mpg ~ disp, data = mtcars)
  
  modelpred <- reactive({
    dispInput <- input$sliderDisp
    predict(model, newdata = data.frame(disp = dispInput))
  })
  output$plot1 <- renderPlot({
    dispInput <- input$sliderDisp
plot(mtcars$disp, mtcars$mpg, xlab = "Displacement", ylab = "Miles Per Gallon", bty = "n", pch = 16, xlim = c(70, 475), ylim = c(10, 35))
if(input$showModel){
  abline(model, col = "purple", lwd = 2)
}})
output$pred <- renderText({
  modelpred()
})
})
