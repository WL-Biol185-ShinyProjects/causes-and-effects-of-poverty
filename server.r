library(shiny)

# where the data is manipulated and visualizations are prepared
function(input, output, session) {
  
  output$plot <- renderPlot({
    plot(Graph_All)  
  })
}
