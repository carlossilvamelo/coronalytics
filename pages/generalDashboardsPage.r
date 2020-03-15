
generalDashboardsPage <- function(){

  tagList(
            
            box(class="boxes",title = "casos confirmados por pais",width = "100%",
                selectInput("observationDateValue", "Data de observacao:",OBSERVATION_DATE_INPUT_OPTIONS),
                plotlyOutput("gCorona")),
            
            box(class="boxes",title = "Casos confirmados ao longo do tempo",width = "100%",
                selectInput("countryNameInput", "Country:",COUNTRIES),
                plotlyOutput("confirmedCasesByTime"))
            )

}

generalDashboardsPageServer <- function(input, output, session) {

  output$gCorona <- renderPlotly({
    
    if(input$observationDateValue  == "ALL"){
      filtered = dataConfirmedCasesByCountry(dataSet)
    }else{
      filtered = dataConfirmedCasesByCountryAndDate(dataSet,input$observationDateValue)
    }
    plotly::ggplotly(
      ggplot() +   geom_bar(aes(x = filtered$COUNTRIES, y = filtered$countryConfirmedValues),
                            stat = "identity",
                            color = "red",
                            fill = "pink"
      ) + coord_flip()
    )
  })
  
  output$confirmedCasesByTime <- renderPlotly({

   confirmedCasesByDateByCountry = filterByCountryByDate(dataSet, countryName = input$countryNameInput)
    x = confirmedCasesByDateByCountry$OBSERVATION_DATE_COLUMN
    y = confirmedCasesByDateByCountry$confirmedCasesNumber
    plotly::ggplotly(
      ggplot(confirmedCasesByDateByCountry, 
             aes(x=x, y=y)) +
        geom_point(color="black") +geom_line()
    )
  })


}