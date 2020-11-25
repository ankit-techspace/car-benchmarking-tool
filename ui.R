#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(markdown) 


shinyUI(navbarPage("Car Benchmarking tool", 
                   tabPanel("Table", 
                            
                            # Sidebar 
                            sidebarLayout( 
                                sidebarPanel( 
                                    helpText("Please select car characterstics and information about trip for basis of benchmark"), 
                                    sliderInput('hp', 'Gross horsepower', min=50, max=340, value=c(50,340), step=10), 
                                    checkboxGroupInput('cyl', 'Number of cylinders:', c("Four"=4, "Six"=6, "Eight"=8), selected = c(4,6,8)), 
                                    checkboxGroupInput('am', 'Transmission:', c("Automatic"=0, "Manual"=1), selected = c(0,1)),
                                    sliderInput('disp', 'Displacement', min=70, max=480, value=c(70,480), step=10),
                                    numericInput('dis', 'Distance (in miles):', 100, min = 1, max = 1000),
                                    numericInput('cost', 'Gasoline Price (per gallon):', 1.99, min = 2, max = 5, step=0.01), 
                                    numericInput('gas', 'Maximum expenditure on gasoline:', 50, min=1, max=1000)
                                ), 
                                
                                
                                mainPanel( 
                                    dataTableOutput('table') 
                                ) 
                            ) 
                   ), 
                   tabPanel("About",
                            mainPanel( 
                                includeMarkdown("about.Rmd") 
                            ) 
                   ) 
) 
)   