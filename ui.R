library(shiny)
library(shinythemes)
navbarPage(theme = shinytheme("united"),
           "Causes and Consequences of Poverty",
           h1("The Causes and Consequences of Poverty"),
           tabPanel("Welcome"),
           tabPanel("Causes"),
           tabPanel("OPM vs SPM"),
           tabPanel("Education"),
           tabPanel("Demographics")
           )
