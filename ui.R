library(shiny)
library(shinythemes)
library(markdown)
library(leaflet)
library(sf)
library(htmltools)
library(readr)
library(tidyverse)
library(geojsonio)
library(htmltools)
library(htmlwidgets)
library(stringi)
library(RColorBrewer)
library(readr)

navbarPage(theme = shinytheme("united"),
           "Causes and Consequences of Poverty",
           tabPanel("Welcome",
                    h1("The Causes and Consequences of Poverty"),
                    sidebarLayout(
                      sidebarPanel(
                        h3("What is Poverty?"),
                        p("Poverty is a state where a person or a community lacks 
                          the resources and basic needs to live a minimally decent life. 
                          It is a pervasive issue with deep social, economic, and health 
                          implications, impacting millions of individuals and families in 
                          the United States. Poverty affects people’s abilities to access 
                          adequate food, shelter, healthcare, and education, creating 
                          barriers that can trap individuals in cycles of deprivation. 
                          In 2023, the United States official poverty rate was 11.1% which 
                          is about 36.8 million people with significant disparities along 
                          racial and geographic lines. One common belief is that poverty is
                          dependent on income, but there are many other factors that can 
                          influence poverty like education, health care, and demographics. 
                          Addressing poverty is crucial to enhance overall societal welfare
                          by reducing healthcare costs, crime, and improving social cohesion.")
                        
                      ),
                      fluidPage(
                        mainPanel(
                        h3("Visualizing Poverty Across the U.S. : Percentage and Families Below the Poverty Line"),
                        leafletOutput("choroplethMap", height = "700px")
                        ),

                      )
                    )),
           tabPanel("Causes",
                    h1("What causes poverty?"),
                    sidebarLayout(
                      sidebarPanel(
                        h3("Many different things!"),
                        p("The root causes of poverty are multifaceted, stemming from economic, 
                        social, health, and environmental factors that create and reinforce cycles 
                        of deprivation."),
                        p("Economic Factors: These include high unemployment rates and the rising 
                        costs of living, which prevent individuals from having economic mobility and 
                        especially affect marginalized communities."),
                        p("Social Factors: Inadequate educational opportunities and systemic discrimination 
                          in housing, employment, and criminal justice often create obstacles for low-income 
                          individuals or families. Low-income groups often lack social networks or support 
                          systems making it even harder to escape the cycle of poverty."),
                        p("Health Factors: Groups in poverty often are more susceptible to health concerns
                          due to lack of access to healthy foods, safe areas to exercise, and healthy environments. 
                          This combined with high healthcare costs make it difficult to survive and limits employment
                          and income opportunities."),
                        p("Environmental Factors: Low-income groups are more susceptible to unsafe housing, 
                        polluted neighborhoods, and vulnerability to climate-related issues. This could cause a lack 
                        of access to clean air, water, and safe living conditions which can further deepen the poverty 
                          cycle.")
                       
                        
                      ),
                      mainPanel(
                        h3("Main Panel"),
                        p("This is where main content like plots or tables will appear")
                      )
                    )),
           tabPanel("OPM vs SPM",
                    h1("Official and Supplemental Poverty Measures"),
                    sidebarLayout(
                      mainPanel( "This section provides insights and comparisons between different measures of poverty: OMP and SPM !"
                      ),
                        fluidPage(
                      column(12,
                             p(""),
                             p("Official Poverty Measure: The OPM does not consider geographic variations or effects of government 
                             assistance programs. Policies based on the OPM could overlook specific needs such as 
                             differing costs of living across regions potentially leading to underfunding or misdirected 
                             resources."),
                             p("Supplemental Poverty Measure: The SPM allows a more comprehensive view by including both cash income and non-cash 
                             benefits as well as necessary expenses such as taxes, medical costs, and work related expenses.
                             Policies based on the SPM have a clearer picture of the real resources available to individuals.")
                             ),
                      
                      column(12,
                             p(""),
                             
                             selectInput("dataset", "Choose a Measurement:",
                                         choices = c("OPM", "SPM")),
                             
                             selectInput("dataset", "Choose a Difference:",
                                         choices = c("Measurement Units", "Poverty Threshold", "Threshold Adjustments",
                                                     "Resource Measure", "Universe", "Time Series")),
                             
                             actionButton("update", "Update View")
                      ),
                      
                      )
                      ),
                      fluidPage(
                        h3("OMP and SPM Rates: A Yearly Comparison"),
                        sidebarPanel(
                          textOutput("hover_info")
                        ),
                        tabsetPanel(
                          tabPanel("SPM Poverty Rate", plotOutput("SPM_graph", hover = hoverOpts("SPM_hover"))),
                          tabPanel("OPM Poverty Rate", plotOutput("OPM_graph", hover = hoverOpts("OPM_hover")))
                        ),
                        basicPage(

                      )
                    )),
           tabPanel("Education",
                    h1("Education"),
                    sidebarLayout(
                      sidebarPanel(
                        p("Education and poverty are closely related as they both influence the other. Education can 
                        help increase employment opportunities as it provides the necessary skills valued in the labor 
                        market. Higher the level of education most times can ensure a stable job with higher earnings, 
                        reducing an individual’s risk of poverty. Education also extends across 
                        generations causing educated parents to more likely support the education of their children. This 
                        is why cycles of poverty are so difficult to break.")
                    ),
                    fluidPage(
                    mainPanel(
                      h3("Educational Attainment and Poverty Statistics in the U.S."),
                      img(src = "edu1.png", style = "width:50%; height:auto;"),
                      leafletOutput("eduMap", height = "600px"),
                    ))
                    
                    )),
           tabPanel("Demographics",
                    h1("Demographics"),
                    sidebarLayout(
                      sidebarPanel(
                        p("Factors including age, race, gender, family structure, and geographic location 
                        have a significant impact on poverty levels and can shape individuals’ economic opportunities, 
                        health, and overall well-being. The effects of demographics can influence the likelihood of one 
                        experiencing poverty as well as the barriers faced when trying to escape it. Children are one of 
                        the most affected groups when it comes to poverty because growing up in poverty can influence 
                        development, nutrition, education, healthy living conditions, and much more. Historical discrimination
                        like redlining, exclusion from labor markets, and education inequalities have left lasting impacts on
                        wealth and income for communities of color.")
                      ),
                      mainPanel(
                        h3("Poverty in the U.S. by Age and Race"),
                        p(""),
                        img(src = "demo1.png", style = "width:50%; height:auto;"),
                        img(src = "demo2.png", style = "width:50%; height:auto; margin-right:10px;"),
                        img(src = "demo3.png", style = "width:50%; height:auto;"),
                        img(src = "demo4.png", style = "width:50%; height:auto;"),
                        img(src = "demo5.png", style = "width:50%; height:auto;"),
                        img(src = "demo6.png", style = "width:50%; height:auto;"),
                        img(src = "demo7.png", style = "width:50%; height:auto;")
                      )
                    )
                    )
           )
