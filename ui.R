
library(shiny)

# Define UI for application that plots random distributions 
shinyUI(pageWithSidebar(
      
      # Application title
      headerPanel("Normal Distribution CDF Calculator"),
      
      # Sidebar with sliders, radio buttons
      sidebarPanel(
            # Radio buttons for selecting mode
            h5('Select Left Tail for a left tailed density plot, 
                  Center for a centered density plot,
                  Right Tail for a right tail density plot.
               '),
            h5(' '),
            radioButtons("opt", "Select scope:",
                         c("Left Tail" = "1",
                           "Center" = "2",
                           "Right Tail" = "3"),
                         selected="2"),
            h5('Use the Range slider to select the value to be used for the -left 
                  and +right margins of the Centered density plot.'),
            h5(' '),
            # Slider input for range for center
            sliderInput("rg", 
                        "Range (Center):", 
                        min = 0,
                        max = 4, 
                        value = 2,
                        step=.1),
            h5('Use the Point slider to select the left or right value to be used for the 
               margin of the Left or Right density plot.'),
            h5(' '),
            # Slider input for point for left, right tail
            sliderInput("pt", 
                        "Point (Left/ Right):", 
                        min = -4,
                        max = 4, 
                        value = 0,
                        step=.1)
      ),
      
      mainPanel(
            # Show the calculated CDF for the area
            h3('CDF Result (pnorm value)'),
            verbatimTextOutput("z"),
            # Show a plot of the generated distribution, area
            plotOutput("distPlot")       
      )
))
