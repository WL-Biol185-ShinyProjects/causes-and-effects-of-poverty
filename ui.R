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
                        of access to clean air, water, and safe living conditions which can further deepen the poverty 
                          cycle.")
                        
                      ),
                      mainPanel(
                        h3("Main Panel"),
                        p("This is where main content like plots or tables will appear")
                      )
                    )),
           tabPanel("OPM vs SPM",
                    h1("Official Poverty Measure vs. Supplemental Poverty Measure"),
                    sidebarLayout(
                      sidebarPanel(
                        fluidRow(
                          column(12,
                        selectInput("dataset", "Choose a Measurement:",
                                    choices = c("OPM", "SPM")),
                        
                        selectInput("dataset", "Choose a Difference:",
                                    choices = c("Measurement Units", "Poverty Threshold", "Threshold Adjustments",
                                                "Resource Measure", "Universe", "Time Series")),
                        
                        actionButton("update", "Update View")
                      ),
                      column(12,
                             h4("Results will be here!!!!")
                             ),
                      column(12,
                             p("The OPM does not consider geographic variations or effects of government 
                             assistance programs. Policies based on the OPM could overlook specific needs such as 
                             differing costs of living across regions potentially leading to underfunding or misdirected 
                             resources."),
                             p("The SPM allows a more comprehensive view by including both cash income and non-cash 
                             benefits as well as necessary expenses such as taxes, medical costs, and work related expenses.
                             Policies based on the SPM have a clearer picture of the real resources available to individuals 
                             and can better assess the impact of government programs on poverty rates.")
                             )
                      )
                      ),
                      mainPanel(
                        h3("Main Panel"),
                        p("This is where main content like plots or tables will appear")
                      )
                    )),
           tabPanel("Education",
                    h1("Education"),
                    sidebarLayout(
                      sidebarPanel(
                        p("Education and poverty are closely related as they both influence the other. Education can 
                        help increase employment opportunities as it provides the necessary skills valued in the labor 
                        market. Higher the level of education most times can ensure a stable job with higher earnings, 
                        reducing an individual’s risk of poverty. As we will discuss more in the health care tab, education
                        level often influences health outcomes as informed individuals are more likely to make informed 
                        decisions and have more access to healthy foods and environments. Education also extends across 
                        generations causing educated parents to more likely support the education of their children. This 
                        is why cycles of poverty are so difficult to break.")
                    ),
                    mainPanel(
                      h3("Main Panel"),
                      p("This is where laetitias amazing graphs will gooooo")
                    )
                    
                    )),
           tabPanel("Demographics",
                    h1("Demographics"),
                    sidebarLayout(
                      sidebarPanel(
                        p("Demographics - factors such as age, race, gender, family structure, and geographic location - 
                        have a significant impact on poverty levels and can shape individuals’ economic opportunities, 
                        health, and overall well-being. The effects of demographics can influence the likelihood of one 
                        experiencing poverty as well as the barriers faced when trying to escape it. Children are one of 
                        the most affected groups when it comes to poverty because growing up in poverty can influence 
                        development, nutrition, education, healthy living conditions, and much more. Historical discrimination
                        like redlining, exclusion from labor markets, and education inequalities have left lasting impacts on
                        wealth and income for communities of color. The wage gap contributes to higher poverty rates among 
                        women, especially single mothers. And finally, geographic location has a large influence on poverty
                        rates due to employment opportunities, healthcare, and education.")
                      ),
                      mainPanel(
                        h3("Main Panel"),
                        p("This is where laetitias amazing graphs will gooooo")
                      )
                    )
                    )
           )
