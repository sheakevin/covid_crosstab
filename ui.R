ui <- fluidPage(
 
  tags$head(
    tags$style(HTML("

      .optgroup[data-group=\"National Consumer Study: Jan 28 - Mar 9, 2020\"] .optgroup-header {
        font-size: 16px;
        font-weight: bold;
        color: black;
      }
      .optgroup[data-group=\"Coronavirus Study: Mar 22 - Mar 29, 2020\"] .optgroup-header {
        font-size: 16px;
        font-weight: bold;
        color: black;
    }"
    ))
  ),
    
  titlePanel(windowTitle = "Resonate Coronavirus Study",
    fluidRow(
      column(9, "Resonate Coronavirus Study"), 
      column(3, img(src='Resoante White No Tagline-20.jpg', 
                    align = "right", height="50%", width="50%"))
    )
  ),
  fluidRow(
    column(10, 
    p("Coronavirus is on all our minds, screens and media feeds – and is changing the way we, 
      as humans, perceive our values and motivations. 
      At Resonate we want to help provide insight into what’s happening across the consumer landscape: 
      how we, as humanity, are reacting, how behaviors are shifting, where we’re turning, 
      and what this means for businesses of every kind."), 
    p("To gain insights, select an", span("Audience", style = "font-weight: bold;"), 
    "– i.e. a single survey question  (displayed in rows) that you are seeking to understand 
    and the", span("Insights", style = "font-weight: bold;"),
    "that you want to learn about that Audience (displayed in columns). 
      This will provide insight into the composition 
      (the % of respondents who gave a specific answer across the 
      total respondent base for that question) of the defined audience."), 
    #br(),
    p("Note: All stats in this report are from a Resonate Coronavirus study of 
      4,888 U.S. internet users aged 18+ collected between Mar 22 – 29 in the U.S. 
      and provides select insights into how people who have different attitudes and opinions
      (as collected through Resonate’s National Consumer Study fielded between Jan 28 and Mar 9) 
      may be reacting to it."), 
    #br(),

    ),
  ),
  
  h3("Study Results"),
  
  fluidRow(
    column(6, 
           selectizeInput(inputId = 'audience', 
                          label = 'Select Audience', 
                          choices = list(`Coronavirus Study: Mar 22 - Mar 29, 2020` = 
                                           audience_questions_covid,
                                          `National Consumer Study: Jan 28 - Mar 9, 2020` = 
                                           audience_questions_2001), 
                          selected = "What is your gender?",
                          multiple = FALSE,
                          width = '100%')), 
    column(6, 
           selectizeInput(inputId = 'insight', 
                          label = 'Select Insight', 
                          choices = list(`Coronavirus Study: Mar 22 - Mar 29, 2020` = 
                                           insight_questions_covid,
                                         `National Consumer Study: Jan 28 - Mar 9, 2020` = 
                                           insight_questions_2001),
                          selected = "Overall, to what extent are you concerned about the coronavirus (COVID-19) situation?",
                          multiple = FALSE, 
                          width = '100%'))
    
  ), 
  mainPanel(
    
    h2("Composition"), 
    dataTableOutput("composition_table", width = "100%"), 
    h2("Index"),
    dataTableOutput("index_table")
  )
)