function(input, output, session) {
  
  data_to_display <- reactive({
    
    my_data <- survey_data %>%
      filter(audience_question_text == input$audience &
               insight_question_text == input$insight)
   # print(head(my_data))
    return(my_data)
    
  })

  output$composition_table = renderDataTable({
    data_to_display() %>%
      arrange(insight_ordering) %>%
      select(audience_answer, insight_answer, composition_raw) %>%
      pivot_wider(id_cols = audience_answer, 
                  names_from = insight_answer, 
                  values_from = composition_raw) %>%
      left_join(x = ., y = likert_ordering, 
                by = c("audience_answer" = "likert_option")) %>%
      #distinct() %>%
      arrange(ordering) %>%
      select(-ordering) %>%
      rename(audience = audience_answer) %>%
      datatable(options = list(sDom  = '<"top">lrt<"bottom">ip'), 
                caption = tags$caption(style = 'font-weight: bold; line-height: 2;
                                       text-align: center;', 
                                       input$insight)) %>%
      formatPercentage(columns = -1, digits = 0)
  })
  
  output$index_table = renderDataTable({
    data_to_display() %>%
      arrange(insight_ordering) %>%
      select(audience_answer, insight_answer, index_raw) %>%
      pivot_wider(id_cols = audience_answer, 
                  names_from = insight_answer, 
                  values_from = index_raw) %>%
      left_join(x = ., y = likert_ordering, 
                by = c("audience_answer" = "likert_option")) %>%
      #distinct() %>%
      arrange(ordering) %>%
      select(-ordering) %>%
      rename(audience = audience_answer) %>%
      datatable(options = list(sDom  = '<"top">lrt<"bottom">ip'), 
                caption = tags$caption(style = 'font-weight: bold; line-height: 2;
                                       text-align: center;', 
                                       input$insight)) %>%
      formatCurrency(columns = -1, currency = "", digits = 0)
  })
}