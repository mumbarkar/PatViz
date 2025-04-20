app_ui <- function() {
  fluidPage(
    titlePanel("Patient Profile Viewer"),
    sidebarLayout(
      sidebarPanel(
        selectInput("subject", "Subject ID", choices = NULL),
        checkboxGroupInput("domains", "Data Domains", choices = c("Demographics" = "demo"))
      ),
      mainPanel(
        uiOutput("domain_ui")
      )
    )
  )
}
