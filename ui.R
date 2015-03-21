library(shiny)
shinyUI(pageWithSidebar(
  headerPanel('Predicting Pedal Width - Iris flowers data set'),
  sidebarPanel(
    p('Select the Sepal Length and Width plus Petal Length to predict the target variable (Petal Width)'),
    sliderInput("Sepal.Length", "Sepal.Length :", min = 4.3, max = 7.9, value = 5, step = 0.1),
    sliderInput("Sepal.Width", "Sepal.Width :", min = 2, max = 4.4, value = 3, step = 0.1),
    sliderInput("Petal.Length", "Petal.Length :", min = 1, max = 6.9, value = 4, step = 0.1),
    br(),
    submitButton("submit")
  ),
  mainPanel(
    verbatimTextOutput("predictors"),
    
    verbatimTextOutput("pw_pred"),
    
    plotOutput('pw_plot')
    
    
    
  )
))