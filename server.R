library(shiny)
library(datasets)
library(ggplot2)

# attList is used to convert the abbreviations of attributes to their full names

attList <- c("cyl" = "Cylinders",
             "disp" = "Displacement",
             "hp" = "Horse Power",
             "drat" = "Rear Axle Ratio",
             "wt" = "Weight",
             "qsec" = "1/4 Mile Time",
             "gear" = "Number of Forward Gears",
             "carb" = "Number of carburetors")


shinyServer(function(input, output) {
        
        # Generate the title text based on the selected attribute.
        textTitle <- reactive({
                paste("MPG ~", attList[input$att])
        })
        
        
        output$caption <- renderText({
                textTitle()
        })
        
        # Use ggplot2 library to generate the plot and its linear fit.
        output$mpgPlot <- renderPlot({
                
                # Get the input parameters
                pColor <- input$dataColors
                pSize <- input$pointSize
                pAlpha <- input$pointAlpha
                
                lColor <- input$fitColors
                lWidth <- input$lineWidth
                
                # Prepare the data for plotting
                tempData <- cbind(mtcars[,input$att], mtcars[,"mpg"])
                colnames(tempData) <- c("Attribute", "mpg")
                tempData <- data.frame(tempData)
                
                # Plot with ggplot2 library
                p <- ggplot(tempData, aes(Attribute, mpg))
                p <- p + geom_point(size = pSize, colour = pColor, alpha = pAlpha) + geom_smooth(
                        method = "lm", se=FALSE, color=lColor, size = lWidth) 
                p + xlab(attList[input$att]) + ylab("Miles per Gallon")
        })
})
