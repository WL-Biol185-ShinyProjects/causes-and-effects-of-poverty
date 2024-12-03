library(shiny)
library(ggplot2)
library(leaflet)
library(tidyverse)
library(htmltools)
library(htmlwidgets)
library(stringi)
library(DT)
library(shinyWidgets)
library(RColorBrewer)
library(lubridate)
library(readxl)
library(shinythemes)
library(markdown)
library(sf)
library(readr)
library(geojsonio)

function(input, output, session) {

#WELCOME TAB
#Loading Data for Choropleth and defining pop up labels
  states <- read_sf('cb_2019_us_state_5m.shp')
  CB_pov_overview <- read.csv("CB_pov_overview.csv", sep = ",")
  
  colnames(CB_pov_overview) <- c("NAME", "FIPS", "Percentage", "Families Below Poverty", "Rank within US")
  
  states_geo <- merge(states, CB_pov_overview, by = 'NAME', all.x = FALSE)
  
#Making Color Palette
  paletteNum <- colorNumeric("Reds", domain = c(0, 20))

  mytext <- paste(
    "State: ", states_geo$NAME, "<br/>",
    "Population in Poverty (%): ", round(states_geo[["Percentage"]], 2), "<br/>",
    "Families Below Poverty: ", round(states_geo$`Families Below Poverty`, 2),
    sep = ""
  ) %>% lapply(htmltools::HTML)
  
#Code for Choropleth Map
  output$choroplethMap <- renderLeaflet({
    leaflet(states) %>%
      addProviderTiles(providers$CartoDB.PositronNoLabels) %>%
      setView(lng = -96.25, lat = 39.50, zoom = 4) %>%
      addPolygons(
        data = states_geo,
        color = 'black',
        weight = 1,
        smoothFactor = 0.3,
        fillOpacity = 0.75,
        fillColor = ~paletteNum(states_geo[["Percentage"]]),
        label = mytext,
        labelOptions = labelOptions(
          style = list("font-weight" = "normal", padding = "3px 8px"),
          textsize = "13px",
          direction = "auto"
        )
      ) %>%
      addLegend(
        pal = paletteNum,
        values = ~pmin(pmax(states_geo[["Percentage"]], 0), 20),
        opacity = 0.9,
        title = "Population in Poverty (%)",
        position = "bottomleft"
      )
  })
  
#OPM/SPM TAB
#Loading Data for OPM/SPM graphs
OPM_SPM_table <- read_excel("OPM_SPM.xlsx", range = "A2:F62")
colnames(OPM_SPM_table) <- c("year", "Anchored SPM Rate without Taxes/Transfers", "Anchored SPM", "Historical SPM without Taxes/Transfers", "SPM_Poverty_Rate", "OPM_Poverty_Rate")
OPM_SPM_table$year <- as.numeric(substring(OPM_SPM_table$year, 1, 4))
OPM_SPM_table <- OPM_SPM_table[-c(2, 4, 7, 48, 52, 55, 56), ]

#SPM graph rendering
output$SPM_graph <- renderPlot({
  ggplot(data = OPM_SPM_table, aes(x = year, y = SPM_Poverty_Rate)) +
    geom_point(color = 4) +
    geom_line(color = 4) +
    theme_classic() +
    labs(title = "SPM Poverty Rate vs. Year", x = "Year", y = "SPM Poverty Rate")
})

#OPM graph rendering
output$OPM_graph <- renderPlot({
  ggplot(data = OPM_SPM_table, aes(x = year, y = OPM_Poverty_Rate)) +
    geom_point(color = 4) +
    geom_line(color = 4) +
    theme_classic() +
    labs(title = "OPM Poverty Rate vs. Year", x = "Year", y = "OPM Poverty Rate")
})

#Hover for SPM graph
observeEvent(input$SPM_hover, {
  hover <- input$SPM_hover
  if (!is.null(hover)) {
    hover_year <- round(hover$x, 0)
    hover_rate <- OPM_SPM_table$SPM_Poverty_Rate[OPM_SPM_table$year == hover_year]
    output$hover_info <- renderText({
      if (length(hover_rate) > 0) {
        paste("Year:", hover_year, "\nSPM Poverty Rate:", round(hover_rate, 2))
      } else {
        "Hover over a valid point."
      }
    })
  }
})

#Hover for OPM graph
observeEvent(input$OPM_hover, {
  hover <- input$OPM_hover
  if (!is.null(hover)) {
    hover_year <- round(hover$x, 0)
    hover_rate <- OPM_SPM_table$OPM_Poverty_Rate[OPM_SPM_table$year == hover_year]
    output$hover_info <- renderText({
      if (length(hover_rate) > 0) {
        paste("Year:", hover_year, "\nOPM Poverty Rate:", round(hover_rate, 2))
      } else {
        "Hover over a valid point."
      }
    })
  }
})

#EDUCATION TAB
#Loading Education Data and Cleaning
CB_edu_attain <- read_csv("CB_edu_attain.csv")
CB_edu_attain <- CB_edu_attain[ -c(1:6,8:10)]
CB_edu_attain <- CB_edu_attain[-c(52:56), ]
colnames(CB_edu_attain) <- c("NAME", "Pop_Density", "Pop_Over_25")
colnames(CB_edu_attain)[27] <- "Percentage_Bachelor"

#Merging Data
states_geo_edu <- merge(states, CB_edu_attain, by = 'NAME', all.x = FALSE)

#Palette and Text Definition
paletteNum2 <- colorNumeric("Blues", domain = states_geo_edu[["Percentage_Bachelor"]])
mytext2 <- paste(
  "State: ", states_geo_edu$NAME, "<br/>",
  "Population Aged 25 and Over: ", states_geo_edu$Pop_Over_25, "<br/>",
  "Population in Poverty (%): ", CB_pov_overview$Percentage, "<br/>",
  "Population Over 25 with a Bachelor's Degree (%): ", round(states_geo_edu[["Percentage_Bachelor"]], 2), 
  sep = ""
) %>% lapply(htmltools::HTML)

#Code for Map
output$eduMap <- renderLeaflet({
  leaflet(states) %>%
    addProviderTiles(providers$CartoDB.PositronNoLabels) %>%
    setView(lng = -96.25, lat = 39.50, zoom = 4) %>%
    addPolygons(
      data = states_geo_edu,
      color = 'black',
      weight = 1,
      smoothFactor = 0.3,
      fillOpacity = 0.75,
      fillColor = ~paletteNum2(states_geo_edu[["Percentage_Bachelor"]]),
      label = mytext2,
      labelOptions = labelOptions(
        style = list("font-weight" = "normal", padding = "3px 8px"),
        textsize = "13px",
        direction = "auto"
      )
    ) %>%
    addLegend(
      pal = paletteNum2,
      values = states_geo_edu[["Percentage_Bachelor"]],
      opacity = 0.9,
      title = "Bachelor's Degree Attainment (%)",
      position = "bottomleft"
    )
})
}



      
     
