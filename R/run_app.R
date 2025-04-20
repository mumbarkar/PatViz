#' Launch the Patient Profile Viewer
#'
#' @param adsl Subject-level dataset (required)
#' @param adae AE dataset (optional)
#' @param adlb Lab dataset (optional)
#' @export
run_patviz <- function(adsl, adae = NULL, adlb = NULL) {
  options(patientProfile.adsl = adsl)
  options(patientProfile.adae = adae)
  options(patientProfile.adlb = adlb)

  shiny::shinyApp(
    ui = app_ui(),
    server = app_server
  )
}
