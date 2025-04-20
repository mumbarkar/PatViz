app_server <- function(input, output, session) {
  adsl <- getOption("patviz.adsl")
  updateSelectInput(session, "subjid", choices = unique(adsl$USUBJID))

  subj_data <- reactive({
    req(input$subjid)
    adsl[adsl$USUBJID == input$subjid, ]
  })

  output$domain_ui <- renderUI({
    req(input$domains)
    tabs <- list()
    if ("demo" %in% input$domains) {
      tabs <- c(tabs, tabPanel("Demographics", patviz_mod_demographics_ui("demo")))
    }
    do.call(tabsetPanel, tabs)
  })

  observe({
    if ("demo" %in% input$domains) {
      patviz_mod_demographics_server("demo", subj_data)
    }
  })
}
