#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  latest <- tidycovid19::download_merged_data(silent = TRUE, cached = TRUE) %>% 
    dplyr::filter(!is.na(confirmed))
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # List the first level UI elements here 
    fluidPage(
      mod_first_version_ui("first_version_ui_1", latest)
    )
  )
}

#' Add external Resources to the Application
#' 
#' This function is internally used to add external 
#' resources inside the Shiny application. 
#' 
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){
  
  add_resource_path(
    'www', app_sys('app/www')
  )
 add_resource_path(
   "distill", system.file("distill", package = "hamiltonThemes")
 )
  tags$head(
    favicon(ext = 'png'),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'hamiltonREstCountry'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert() 
  )
  
  tags$head(
    favicon(),
    bundle_resources(
      path = system.file("distill", package = "hamiltonThemes"),
      app_title = 'hamiltonREstCountry'
    )
  )
}

