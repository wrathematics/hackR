#' hack_the_planet
#' 
#' Run the hackR webapp.
#' 
#' @importFrom shiny runApp
#' @export
hack_the_planet <- function()
{
  shiny::runApp(file.path(system.file("shinyapp", package="hackR")))
}
