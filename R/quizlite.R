#' Create quiz
#'
#' @param quiz_db A nested list
#'
#' @return An html quiz
#' @export
#'
#'
quizlite <- function(quiz_db){
  dir0 <- tempdir()
  x <- sketch::source_r("inst/main.R")
  html <- "index.html"
  jsonlite::write_json(quiz_db, paste0(dir0, "/quiz_db.json"), auto_unbox = T)
  file.copy(html, file.path(dir0, html))
  #browseURL(file.path(dir0, html))
  htmltools::doRenderTags(htmltools::tags$iframe(src = file.path(dir0, html), style = "border: none;"))
}