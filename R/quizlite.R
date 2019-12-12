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
  html <- "index.html"

  # convert `quiz_db` into a JSON and write to dir0 here

  jsonlite::write_json(quiz_db, paste0(dir0, "/quiz_db.json"), auto_unbox = T)

  file.copy(html, file.path(dir0, html))
  browseURL(file.path(dir0, html))
}
