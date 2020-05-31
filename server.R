#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
 
    output$sinePlot <- renderPlotly({
        x <- seq(0,10, length.out = 1000)
        
        # create data
        aval <- list()
        for(step in 1:11){
            aval[[step]] <-list(visible = FALSE,
                                name = paste0('v = ', step),
                                x=x,
                                y=sin(step*x))
        }
        aval[input$freq][[1]]$visible = TRUE
        
        # create steps and plot all traces
        steps <- list()
        fig <- plot_ly()
        for (i in 1:11) {
            fig <- add_lines(fig,x=aval[i][[1]]$x,  y=aval[i][[1]]$y, visible = aval[i][[1]]$visible, 
                             name = aval[i][[1]]$name, type = 'scatter', mode = 'lines', hoverinfo = 'name', 
                             line=list(color='00CED1'), showlegend = FALSE)
            
            step <- list(args = list('visible', rep(FALSE, length(aval))),
                         method = 'restyle')
            step$args[[2]][i] = TRUE  
            steps[[i]] = step 
        }   
        
        
    fig    
        
 })

})
