library(shiny)
data(iris)

fit <- lm(Petal.Width ~ Sepal.Length + Sepal.Width + Petal.Length, data=iris)

Petal.Width <- function(Sepal.Length, Sepal.Width, Petal.Length) { 
  fit$coef[1] + 
    fit$coef[2] * Sepal.Length + 
    fit$coef[3] * Sepal.Width + 
    fit$coef[4] * Petal.Length
}

shinyServer(
  function(input, output) {
    
    
    pw_est <- reactive({Petal.Width(as.numeric(input$Sepal.Length), as.numeric(input$Sepal.Width), as.numeric(input$Petal.Length))})
    output$predictors <- renderPrint({paste('  Sepal.Length : ', input$Sepal.Length, "  Sepal.Width : ",input$Sepal.Width, " | Petal.Length : ",input$Petal.Length)
    })
    output$pw_pred <- renderPrint({paste("Petal Width prediction : " , round(pw_est(), 3), "centimeters")})
    output$pw_plot <- renderPlot({
      plot(iris$Petal.Length, iris$Petal.Width, pch=21, bg=c("red","green3","blue")[unclass(iris$Species)], main="Iris Flower Data Set", 
           xlab="Iris Petal Length",ylab="Iris Petal Width"
      )
      points(input$Petal.Length, pw_est(), cex = 3, col = "brown") 
      legend("bottomright", title="species" , c("setosa","versicolor", "virginica"), lty=c(1,1), lwd=c(2.5,2.5),col=c("red","green","blue")) 
      
    })
  }
)