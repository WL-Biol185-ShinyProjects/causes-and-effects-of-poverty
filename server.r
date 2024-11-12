library(shiny)

# where the data is manipulated and visualizations are prepared
server <- function(input, output, session) {
  output$examplePlot <- renderPlot({
    
  })
}

# where data is shown and visualizations are served
ui = fluidPage("The Causes and Consequences of Poverty")

#Launch the codes
shinyApp(ui = ui, server = server)