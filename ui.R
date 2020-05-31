#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Interactive Sine"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("freq",
                        "Frequency:",
                        min = 1,
                        max = 11,
                        value = 3),
        actionButton("pdf", "User Manual", onclick = "window.open('InteractiveSine.pdf')")  
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotlyOutput("sinePlot")
        )
    )
))
