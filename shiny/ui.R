# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyUI(
    navbarPage("One stop health calculator",
               tabPanel(p(icon("flash"), "Body Mass Index (BMI) Calculator"),
                        sidebarPanel(
                            numericInput('weight', 'Type your weight in kilograms', 80) ,
                            br(),
                            numericInput('height', 'Type your height in metres', 1.70, min = 0.2, max = 3, step = 0.01),
                            br(),
                            submitButton('Submit')
                        ), 
                        
                        mainPanel(
                            p('The Body mass index (BMI) is a measure of body fat based on height and weight that applies to adult men and women.'),
                            p('The World Health Organization (WHO) proposes the following classification:'),
                            tags$div(
                                tags$ul(
                                    tags$li('BMI <18.5       : Underweight'),
                                    tags$li('BMI [18.5-24.9] : Normal weight'),
                                    tags$li('BMI [25-29.9]   : Overweight'),
                                    tags$li('BMI >=30        : Obesity')
                                )
                            ),
                            
                            h4('The values entered by you are:'), 
                            h4('Your weight:'), verbatimTextOutput("inputweightvalue"),
                            h4('Your height:'), verbatimTextOutput("inputheightvalue"),
                            h3('Your BMI is:'),verbatimTextOutput("estimation"),
                            h3('Based on your BMI, you are:'),strong(verbatimTextOutput("diagbmi"))
                            
                        )
               ),
               # Ideal weight
               tabPanel(p(icon("leaf"), "Ideal weight"),
                        sidebarPanel(
                            numericInput('iwheight', 'Type your height in metres', 1.70, min = 1.5, max = 3, step = 0.01),
                            br(),
                            radioButtons("gender", "Select your gender:",
                                         list("Male", "Female")),
                            br(),
                            
                            submitButton('Submit')
                        ),
                        mainPanel(
                            p('The Ideal Weight Calculator computes the ideal body weight as well as a healthy body weight range based on height, gender, and age. People have pursued an ideal weight formula for centuries, and hundreds of formulas and tables have been created. However, there is still no definite answer regarding the "best" weight for a person. However, the results obtained by most formulas are very good.'),
                            p('B. J. Devine Formula (1974) is used here:'),
                            tags$div(
                                tags$ul(
                                    tags$li('Man    :   50.0 + 2.3 kg per inch over 5 feet'),
                                    tags$li('Woman  :   45.5 + 2.3 kg per inch over 5 feet')
                                )
                            ),
                            h4('Your selected gender is:'),strong(verbatimTextOutput("textgender")),
                            h4('Your selected height(m) is:'),strong(verbatimTextOutput("inputiwheight")),
                            h3('Your ideal weight in Kg(s) is:'),strong(verbatimTextOutput("idweight"))
                            
                        )
               ),
               # Targer and max HR
               tabPanel(p(icon("heart"), "Heart rate"),
                        sidebarPanel(
                            numericInput('age', 'Type your age in years', 25, min = 1, max = 100, step = 1),
                            br(),
                            submitButton('Submit')
                        ),
                        mainPanel(
                            p('Your maximum heart rate is about 220 minus your age.'),
                            p('Heart rate during moderately intense activities is about 50-69% of your maximum heart rate, whereas heart rate during hard physical activity is about 70% to less than 90% of the maximum heart rate.'),

                            h3('Your age is:'),verbatimTextOutput("inputagevalue"),
                            h3('Your maximum heart rate (bpm) is:'),verbatimTextOutput("maximumhr"),
                            h3('Your target heart rate (bpm) for moderately intense activities is:'),verbatimTextOutput("targethr")
                        )
               ),
               # About
               tabPanel(p(icon("cog"), "About"),
                        mainPanel(
                            includeMarkdown("include.md")
                        )
               )
    )
)