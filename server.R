library(shiny)

# Define server logic to render plot, area, CDF
shinyServer(function(input, output) {
      
      # Generates a plot of domain -4,4, plots the area resulting from 
      # the given range or point, calculated the CDF for the calculated area.

      output$distPlot <- renderPlot({
            
            # generate density plot
            x=seq(-4,4,length=200)
            y=dnorm(x)
            plot(x,y,type="l",lwd=2,col="red")
            if (input$opt=="1") {
                  x=seq(-4,input$pt,length=100)
                  y=dnorm(x)
                  polygon(c(-4,x,input$pt),c(0,y,0),col="gray")
                  output$z<-renderText({ 
                        pnorm(input$pt,lower.tail=TRUE)
                  })
            }
            if (input$opt=="2") {
                  x=seq(-input$rg,input$rg,length=100)
                  y=dnorm(x)
                  polygon(c(-input$rg,x,input$rg),c(0,y,0),col="gray")
                  output$z<-renderText({ 
                        pnorm(input$rg)-pnorm(-input$rg)
                  })
            }
            if (input$opt=="3") {
                  x=seq(input$pt,4,length=100)
                  y=dnorm(x)
                  polygon(c(input$pt,x,4),c(0,y,0),col="gray")
                  output$z<-renderText({ 
                        1-pnorm(input$pt,lower.tail=TRUE)
                  })
            }
      })
})
