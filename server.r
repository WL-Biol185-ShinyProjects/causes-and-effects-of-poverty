library(shiny)

# where the data is manipulated and visualizations are prepared
function(input, output, session) {
  
  fluidPage(
    leafletOutput(
      
      
      
      
    )
  )
  
  
  states <- read_sf('cb_2019_us_state_5m.shp')
  
  CB_pov_overview <- read.csv("CB_pov_overview.csv", sep = ",")
  
  colnames(CB_pov_overview) <- c("NAME", "FIPS", "Percentage", "Families Below Poverty", "Rank within US" )
  
  CB_pov_overview$NAME -> NAME
  states_geo <- merge(states, CB_pov_overview, by='NAME', all.x = F)
  
  CB_pov_overview$Percentage -> Percentage
  CB_pov_overview$`Families Below Poverty` -> Fam_below_pov
  paletteNum <- colorNumeric("Reds", domain = states_geo$Percentage)
  mytext <- paste(
    "State: ", states_geo$NAME, "<br/>",
    "Population in Poverty (%): ", states_geo$Percentage, "<br/>",
    "Families Below Poverty: ", round(states_geo$`Families Below Poverty`, 2),
    sep = ""
  ) %>%
    lapply(htmltools::HTML)
  
  choropleth1 <- leaflet(states) %>%
    addProviderTiles(providers$CartoDB.PositronNoLabels)  %>% 
    setView(lng = -96.25, lat = 39.50, zoom = 4) %>% addPolygons(data=states_geo, color = 'white', weight = 1, smoothFactor = .3, fillOpacity = .75,fillColor = ~ paletteNum(Percentage), label = mytext,
                                                                 labelOptions = labelOptions(
                                                                   style = list("font-weight" = "normal", padding = "3px 8px"),
                                                                   textsize = "13px",
                                                                   direction = "auto"
                                                                 )
    ) %>%
    addLegend(
      pal = paletteNum, values = ~Percentage, opacity = 0.9,
      title = "Percent Below Poverty (%)", position = "bottomleft"
    )
  
  choropleth1
}

