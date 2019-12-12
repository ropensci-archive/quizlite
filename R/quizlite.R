#' Create quiz
#'
#' @param quiz_db A nested list
#'
#' @return An html quiz
#' @export
#'
#'
quizlite <- function(quiz_db, ... ){
  dir0 <- tempdir()
  #x <- sketch::source_r("inst/unused/main.R")
  html <- system.file("index.html", package = "quizlite")
  jsonlite::write_json(quiz_db, file.path(dir0, "quiz_db.json"), auto_unbox = T)
  file.copy(html, file.path(dir0, "index.html"))
  browseURL(file.path(dir0, "index.html"))
}


#' Create knitted quiz
#'
#' @param quiz_db A nested list
#' @param ... Extra functions. e.g. height or width for sizing
#'
#' @return A html quiz inside a knitted html_document
#' @export
#'
quizlite_knit <- function(quiz_db, ... ){
  dir0 <- "./temp/"
  if(!dir.exists(dir0)){
    dir.create(dir0)
  }
  html <- system.file("index.html", package = "quizlite")
  jsonlite::write_json(quiz_db, file.path(dir0, "quiz_db.json"), auto_unbox = T)
  file.copy(html, file.path(dir0, "index.html"))
  #htmltools::attachDependencies(x = file.path(dir0, "index.html"), value = file.path(dir0, "quiz_db.json"))
  htmltools::doRenderTags(htmltools::tags$iframe(src = file.path(dir0, "index.html"), ...))
}
