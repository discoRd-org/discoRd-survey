discoRd_survey_tab <- fluidPage(
  theme = "page.css",
  tags$div(class = "questionnaire_page",
           tags$div(class = "questionnaire_desc",
           h1("discoRd Member Survey"),
           tags$p("Thank you for being an awesome part of the discoRd community!"),
           tags$p("To learn more about our server members, we would like to collect demographic and interests information. Please be assured that this survey is completely anonymous and the data/analysis will only be shared within the discoRd server."),
           tags$p("Please contact the server admins via", tags$b("@ModMail"), "or ping", tags$b("@admin"), "in the", tags$i("#server-concerns"), "channel if you have any questions regarding this survey."),
           tags$hr(id = "scrollLimit-discoRd_survey"),
           shinyWidgets::progressBar("discoRd_survey_progress",
                                     0,
                                     title = "Progress on the survey")),
           shiny.quetzio::quetzio_link_UI("discoRd_quetzio")
  )
)

togetheR_survey_tab <- fluidPage(
  tags$div(
    class = "questionnaire_page",
    tags$div(
      class = "questionnaire_desc",
      h1("discoRd get-togethR Event Questionnaire"),
      tags$p("Welcome to the discoRd get-togethR questionnaire!"),
      tags$p("The purpose of this questionnaire is to allow discoRd members the opportunity to contribute potential discussion topics and guest speakers for our monthly get-togethR event."),
      tags$p("Our goal is to have each monthly get-togethR feature a main discussion topic to help guide our conversation. Event announcements are posted 7 days prior to the next get-togethR event, so attendees will have some time to think about the topic, organize their thoughts, and come up with possible questions or comments ahead of time."),
      tags$p("In addition to discussion topics, we are interested in working with guest speakers on occasion. If someone's expertise aligns with an upcoming discussion topic, we are open to reaching out to them and asking if they’d like to participate in the event as a guest speaker. Guest speakers are encouraged - but not required - to prepare a brief presentation related to the discussion topic which would then be followed by a Q&A session with attendees."),
      tags$p("Please note, at its heart, the get-togethR event is a casual get together of like minded people. It is not an academic exercise. If you’d rather attend and just chat with other people, that is fine! Please don’t feel pressured to perform or prepare ahead of time."),
      tags$p("Thank you for taking the time to help us grow this recurring event into a meaningful experience!"),
),
      shiny.quetzio::quetzio_UI("getTogethR_module")
  )
)