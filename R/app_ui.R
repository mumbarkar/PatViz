library(shiny)

app_ui <- function() {
  fluidPage(
    titlePanel("Patient Profile Viewer"),
    sidebarLayout(
      sidebarPanel(
        selectInput("subjid", "Subject ID", choices = character(0)),
        checkboxGroupInput("domains", "Data Domains", choices = c("Demographics" = "demo"))
      ),
      mainPanel(
        uiOutput("domain_ui")
      )
    )
  )
}
