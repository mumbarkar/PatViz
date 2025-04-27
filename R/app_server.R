app_server <- function(input, output, session) {
  observe({
    req(adsl)
    updateSelectInput(session, "subjid", choices = unique(adsl$USUBJID))
  })

  adsl <- getOption("patviz.adsl")
  subj_data <- reactive({
    req(input$subjid)
    adsl[adsl$USUBJID == input$subjid, ]
  })

  output$domain_ui <- renderUI({
    req(input$domains)
    tab_list <- lapply(input$domains, function(domain) {
      if (domain == "demo") {
        tabPanel("Demographics", patviz_mod_demographics_ui("demo"))
      }
      # add future domains here
    })

    do.call(tabsetPanel, tab_list)
  })

  observe({
    if ("demo" %in% input$domains) {
      patviz_mod_demographics_server("demo", subj_data)
    }
  })
}
