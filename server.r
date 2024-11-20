library(shiny)
library(ggplot2)
library(leaflet)
library(tidyverse)
library(leaflet)
library(DT)
library(shinyWidgets)
library(RColorBrewer)
library(lubridate)

# where the data is manipulated and visualizations are prepared
function(input, output, session) {


  output$choropleth1 <- renderLeaflet({
   
    choropleth1 <- leaflet(states) %>%
      addProviderTiles(providers$CartoDB.PositronNoLabels)  %>% 
      setView(lng = -96.25, lat = 39.50, zoom = 4) %>% 
      addPolygons(data=states_geo,
                  color = 'white', 
                  weight = 1, 
                  smoothFactor = .3, 
                  fillOpacity = .75,
                  fillColor = ~ paletteNum(Percentage), 
                  label = mytext,
                  labelOptions = labelOptions(
                  style = list("font-weight" = "normal", padding = "3px 8px"),
                   textsize = "13px",
                   direction = "auto")) %>%
      addLegend(pal = paletteNum, values = ~Percentage, opacity = 0.9, title = "Percent Below Poverty (%)", 
                position = "bottomleft")
    choropleth1

  })
}

