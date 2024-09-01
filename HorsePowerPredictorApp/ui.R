library(shiny)
fluidPage(
        titlePanel("Horsepower Predictor based on some car specs."),
        sidebarLayout(
                sidebarPanel(
                        sliderInput("disp", label = "Select displacement value",
                                    min = 0, max = 500, value = 150),
                        sliderInput("wt","Select weight value", min = 0, max = 10, 5),
                        numericInput("carb", "Select number of carburetors", value = 3, 
                                     min = 1, max = 6, step = 1),
                ),
                mainPanel(
                        tabsetPanel(type = "tabs",
                                    tabPanel("Prediction value",
                                             br(), 
                                             h4("The predicted Horsepower value."),
                                             textOutput("tab1"),
                                             h4("The following plots show the where the predicted value would be on the scatter plot between 'HorsePower', and each of the three predictor variables."),
                                             plotOutput("plot1"),
                                             plotOutput("plot2"),
                                             plotOutput("plot3")),

                                    tabPanel("Model information", 
                                             br(),                                     
                                             h4("Here is the summary of the model's characteristics."),
                                             h6(HTML("Call: lm(formula = hp ~ disp + wt + carb, data = mtcars)<br>
<br>
Residuals:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Min&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1Q&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Median&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3Q&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Max <br>
-45.225&nbsp;-14.235&nbsp;&nbsp;&nbsp;3.879&nbsp;&nbsp;20.621&nbsp;&nbsp;39.785 <br>
<br>
Coefficients:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Estimate Std. Error t value Pr(>|t|)    <br>
(Intercept)&nbsp;&nbsp;53.16715&nbsp;&nbsp;&nbsp;18.16036&nbsp;&nbsp;&nbsp;2.928&nbsp;&nbsp;0.00671&nbsp;** <br>
disp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0.51663&nbsp;&nbsp;&nbsp;&nbsp;0.07669&nbsp;&nbsp;&nbsp;&nbsp;6.736&nbsp;&nbsp;2.59e-07&nbsp;***<br>
wt&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-28.59214&nbsp;&nbsp;&nbsp;&nbsp;9.87292&nbsp;&nbsp;&nbsp;&nbsp;-2.896&nbsp;&nbsp;0.00725&nbsp;** <br>
carb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;23.57691&nbsp;&nbsp;&nbsp;&nbsp;2.99391&nbsp;&nbsp;&nbsp;&nbsp;7.875&nbsp;&nbsp;1.41e-08&nbsp;***<br>
---<br>
Signif.&nbsp;codes:&nbsp;&nbsp;0&nbsp;‘***’&nbsp;0.001&nbsp;‘**’&nbsp;0.01&nbsp;‘*’&nbsp;0.05&nbsp;‘.’&nbsp;0.1&nbsp;‘&nbsp;’&nbsp;1<br>
<br>
Residual standard error: 24.32 on 28 degrees of freedom<br>
Multiple R-squared:  0.8863,	Adjusted R-squared:  0.8742 <br>
F-statistic: 72.78 on 3 and 28 DF,  p-value: 2.462e-13")),
                                             h4("And a diagnostic plot of the model"),
                                             plotOutput("tab2")),
                                    
                        ),
                        
                        
                )
        )
)
