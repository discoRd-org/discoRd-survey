server <- function(input, output, session){
  
  # discoRd survey quetzio ####
  
  ## definition of quetzios in a link (every quetzio is one page) ####
  
  discoRd_quetzio <- QuetzioLink_create(
    page_1 = Quetzio_create(
      source_method = "gsheet",
      source_gsheet_id = discoRd_survey_ss,
      source_gsheet_sheetname = "Questions_discoRd_Page1",
      module_id = "discoRd_page1",
      custom_txts = custom_txt_discoRd
    ),
    page_2 = Quetzio_create(
      source_method = "gsheet",
      source_gsheet_id = discoRd_survey_ss,
      source_gsheet_sheetname = "Questions_discoRd_Page2",
      module_id = "discoRd_page2",
      custom_txts = custom_txt_discoRd
    ),
    robot_check = Quetzio_create(
      source_method = "gsheet",
      source_gsheet_id = discoRd_survey_ss,
      source_gsheet_sheetname = "Questions_discoRd_robot_check",
      module_id = "discoRd_robot_check",
      custom_txts = custom_txt_discoRd
    ),
    page_3 = Quetzio_create(
      source_method = "gsheet",
      source_gsheet_id = discoRd_survey_ss,
      source_gsheet_sheetname = "Questions_discoRd_Page3",
      module_id = "discoRd_page3",
      custom_txts = custom_txt_discoRd
    ),
    page_4 = Quetzio_create(
      source_method = "gsheet",
      source_gsheet_id = discoRd_survey_ss,
      source_gsheet_sheetname = "Questions_discoRd_Page4",
      module_id = "discoRd_page4",
      custom_txts = custom_txt_discoRd
    ),
    page_5 = Quetzio_create(
      source_method = "gsheet",
      source_gsheet_id = discoRd_survey_ss,
      source_gsheet_sheetname = "Questions_discoRd_Page5",
      desc_gsheet_sheetname = "Description_discoRd_Page5",
      custom_txts = list("submit_enabled" = "Send your answers!"),
      module_id = "discoRd_page5"
    ),
    link_id = "discoRd_quetzio"
    # , output_gsheet = T,
    # output_gsheet_id = discoRd_output_ss,
    # output_gsheet_sheetname = "Answers_discoRd"
  )
  
  ## Observer to update the progress bar and show THANK YOU modal ####
  
  observe({
    
    completion_rate <- discoRd_quetzio$completion()*100
    
    updateProgressBar(
      session = session,
      id = "discoRd_survey_progress",
      value = completion_rate
    )
    
    if (completion_rate == 100) {
      showModal(
        modalDialog(
          title = "Thank you!",
          "We want to thank you so much for participation in our survey! We hope your answers can help us understand our discoRd community even more!"
        )
      )
    }
    
    # json script to scroll from down to up
    shinyjs::runjs('document.getElementById("scrollLimit-discoRd_survey").scrollIntoView({behavior: "smooth", block: "nearest"});')
    
  })
  
  # get-togetheR questionnaire definition
  
  get_togethR_quetzio <- Quetzio_create(
    source_method = "gsheet",
    source_gsheet_id = discoRd_survey_ss,
    source_gsheet_sheetname = "Questions_getTogethR",
    desc_gsheet_sheetname = "Description_getTogethR",
    module_id = "getTogethR_module"
    # , output_gsheet = T,
    # output_gsheet_id = discoRd_output_ss,
    # output_gsheet_sheetname = "Answers_getTogethR"
  )
  
  # observer to trigger modal dialog
  
  observe({
   
    req(isTRUE(get_togethR_quetzio$is_done()))
    
    showModal(
      modalDialog(
        title = "Thank you!",
        "We want to thank you so much for participation in our survey! We hope your answers can help us make our monthly get-togethR meetings even better!"
      )
    )
     
  })
  
}