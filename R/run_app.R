#' Launch the Patient Profile Viewer
#'
#' @param adsl Subject-level dataset (required)
#' @param adae AE dataset (optional)
#' @param adlb Lab dataset (optional)
#' @export
run_patviz <- function(adsl, adae = NULL, adlb = NULL) {
  options(patviz.adsl = adsl)
  options(patviz.adae = adae)
  options(patviz.adlb = adlb)

  shiny::shinyApp(
    ui = app_ui(),
    server = app_server
  )
}
