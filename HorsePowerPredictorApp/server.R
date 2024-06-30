library(shiny)
shinyServer(function(input, output) {
              model = step(lm(hp~.,mtcars))
              
              modelPred = reactive({
                      carSpecs = data.frame(disp = input$disp, wt = input$wt,
                                           carb = input$carb)
                      predict(model, newdata = carSpecs)
              })

              output$tab1 = renderText({modelPred()})
              output$plot1 = renderPlot({
                      plot(mtcars$disp, mtcars$hp, ylab = "Horsepower", 
                           xlab = "displacement", pch = 16, 
                           xlim = c(0, 550), ylim = c(-210, 500))
                      points(input$disp ,modelPred() , col = "red", pch = 16, cex = 2)
              })
              output$plot2 = renderPlot({
                      plot(mtcars$wt, mtcars$hp, ylab = "Horsepower", 
                           xlab = "weight", pch = 16, 
                           xlim = c(0, 11), ylim = c(-210, 500))
                      points(input$wt ,modelPred() , col = "red", pch = 16, cex = 2)
              })
              output$plot3 = renderPlot({
                      plot(mtcars$carb, mtcars$hp, ylab = "Horsepower", 
                           , xlab = "carburetor", pch = 16, 
                           xlim = c(0, 10), ylim = c(-210, 500))
                      points(input$carb ,modelPred() , col = "red", pch = 16, cex = 2)
              })
              output$tab2 = renderPlot({plot(model)})
              
})