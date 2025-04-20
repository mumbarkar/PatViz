patviz_mod_demographics_ui <- function(id) {
  ns <- NS(id)
  tagList(
    h4("Demographic Info"),
    tableOutput(ns("demo_table"))
  )
}

patviz_mod_demographics_server <- function(id, data_reactive) {
  moduleServer(id, function(input, output, session) {
    output$demo_table <- renderTable({
      data <- data_reactive()
      data.frame(
        Subject = data$USUBJID,
        Age = data$AGE,
        Sex = data$SEX,
        Race = data$RACE,
        Arm = data$ARM
      )
    })
  })
}
