library(shiny)
library(tidyverse)
library(DT)
library(htmltools)

survey_data <- readRDS("data/survey_crosstab_for_shiny.RDS")
likert_ordering <- read_csv("data/likert_ordering.csv")
#audience_questions <- sort(unique(survey_data$audience_question_text))
#insight_questions <- sort(unique(survey_data$insight_question_text))

audience_questions_2001 <- survey_data %>% 
  ungroup() %>%
  filter(audience_survey_id == "2001") %>%
  select(audience_question_text) %>%
  distinct() %>%
  arrange() %>%
  pull(audience_question_text)

audience_questions_covid <- survey_data %>% 
  ungroup() %>%
  filter(audience_survey_id == "COVID") %>%
  select(audience_question_text) %>%
  distinct() %>%
  arrange() %>%
  pull(audience_question_text)

insight_questions_2001 <- survey_data %>% 
  ungroup() %>%
  filter(insight_survey_id == "2001") %>%
  select(insight_question_text) %>%
  distinct() %>%
  arrange() %>%
  pull(insight_question_text)

insight_questions_covid <- survey_data %>% 
  ungroup() %>%
  filter(insight_survey_id == "COVID") %>%
  select(insight_question_text) %>%
  distinct() %>%
  arrange() %>%
  pull(insight_question_text)
