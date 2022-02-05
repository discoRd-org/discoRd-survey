ui <- tagList(
  # add meta tags
  tags$head(
    meta() %>%
      meta_general(
        application_name = "Surveys for R discord channel",
        description = "Questionnaires for users of discoRd channel built with Shiny.",
        generator = "R-Shiny"
      ) %>%
      meta_tag(name = "keywords", 
               content = "R programming langauge, discord channel, Shiny App, shiny.quetzio, Shiny questionnaire, Shiny survey")
  ),
  # use Waiter for loading screen
  useWaiter(),
  shinyjs::useShinyjs(),
  waiterPreloader(
    fadeout = 300,
    color = "#d7d5d5"
  ),
  # create a navbar page. Tabs defined in tabs.R
  navbarPage(
    title = "discoRd surveys",
    id = "navbar_main",
    tabPanel("discoRd-survey",
             discoRd_survey_tab),
    tabPanel("get-togetheR-survey",
             togetheR_survey_tab),
    theme = "navbar.css",
    header = header_tab
  ))
