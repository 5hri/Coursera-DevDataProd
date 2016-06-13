library(shiny) 

BMI<-function(weight,height) {weight/(height^2)}

diagbmi<-function(weight,height){
    BMI_value<-weight/(height^2)
    ifelse(BMI_value<18.5,"Underweight",ifelse(BMI_value<25,"Normal weight",ifelse(BMI_value<30,"Overweight","Obesity")))
}

maxhr<-function(age) {(220-age)}
tarhr<-function(age) {(220-age)*0.7}

idweight <- function(height, gender){
    if(height<1.524){
        if(gender == "Male"){50}else{45.5}
    }else{
        if(gender == "Male"){50+90.55*(height-1.5)}else{45.5+90.55*(height-1.5)}
    }
}


shinyServer(
    function(input, output) {
        #BMI
        output$inputweightvalue <- renderPrint({input$weight})
        output$inputheightvalue <- renderPrint({input$height})
        output$estimation <- renderPrint({BMI(input$weight,input$height)})
        output$diagbmi <- renderPrint({diagbmi(input$weight,input$height)})
        
        #Ideal weight
        output$inputiwheight <- renderPrint({input$iwheight})
        output$textgender <- renderText({input$gender})
        output$idweight <- renderPrint({idweight(input$iwheight,input$gender)})
        
        #HR
        output$inputagevalue <- renderPrint({input$age})
        output$maximumhr <- renderPrint({maxhr(input$age)})
        output$targethr <- renderPrint({tarhr(input$age)})
    } 
)