library(shiny)

shinyUI(fluidPage(
        
        # Here generate the title
        titlePanel("Dependence of MPG on Selected Numeric Attributes?"),
        
        # The following controls define the analysis attribute and the plotting
        # parameters.
        sidebarLayout(
                sidebarPanel(
                        selectInput("att", "Attributes:",
                                    c("Displacement" = "disp",
                                      "Cylinders" = "cyl",
                                      "Horse Power" = "hp",
                                      "Rear Axle Ratio" = "drat",
                                      "Weight" = "wt",
                                      "1/4 Mile Time" = "qsec",
                                      "Number of Forward Gears" = "gear",
                                      "Number of carburetors" = "carb")),
                        
                        radioButtons("dataColors", 
                                    label = h4("Select a Color for Data"), 
                                    choices = list("Light Blue" = 5, 
                                                   "Pink" = 6, 
                                                   "Yellow" = 7),
                                    selected = 5),
                                    
                        
                        sliderInput("pointSize", label = h4("Point Size"),
                                    min = 1, max = 10, value = 6),
                        
                        sliderInput("pointAlpha", label = h4("Point Alpha"),
                                    min = 0.1, max = 1, value = 0.5, step = 0.1),
                        
                        radioButtons("fitColors", 
                                     label = h4("Select a Color for Linear Fit"), 
                                     choices = list("Red" = 2, 
                                                    "Green" = 3, 
                                                    "Blue" = 4),
                                     selected = 2),
                        
                        sliderInput("lineWidth", label = h4("Line Width"),
                                    min = 0.2, max = 3, value = 2, step = 0.2)
                        
                ),
                
                # Generating the results

                mainPanel(
                        h3(textOutput("caption")),
                        
                        plotOutput("mpgPlot")#,
                        
                        #h4(textOutput("lModel"))
                )
        ),
        
        # User's guide.
        
        h4("How to use the App?"),
        
        "The App analyzes the dependence of MPG on the cars' attributes using the mtcars dataset in R's
        \"datasets\" library.", br(),
        
        "1. User can use the drop-down box to select the attribute for the analysis.", br(),
        
        "2. User can also change the plot color, point size, and line width with the interactive components."
        
))
