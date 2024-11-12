library(shiny)
library(shinythemes)
library(markdown)
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
                      mainPanel(
                        h3("Main Panel"),
                        p("This is where main content like plots or tables will appear")
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
                        of access to clean air, water, and safe living conditions which can further deepen the poverty cycle.")
                        
                      ),
                      mainPanel(
                        h3("Main Panel"),
                        p("This is where main content like plots or tables will appear")
                      )
                    )),
           tabPanel("OPM vs SPM"),
           tabPanel("Education"),
           tabPanel("Demographics")
           )
