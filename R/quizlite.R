#' Create a quizlite quiz
#'
#' @param ... A series of nested functions. In the form question("A sample question", answer("Answer 1"),
#' answer("Answer 2", correct = TRUE)). Question and answer text must be a text string.
#' Mark the correct answer with a correct = TRUE.
#' @param correct_response A text string. Message to give to user when response is correct
#' @param incorrect_response A text string. Message to give to user when they are incorrect
#'
#' @return An html quiz
#' @export
#'
#' @examples quizlite(question(text = "What is better?",
#'                             answer("R", correct = TRUE),
#'                             answer("Python"),
#'                             answer("Javascript"),
#'                             answer("S")),
#'                    question(text = "Who is awesome?",
#'                             answer("I am", correct = TRUE),
#'                             answer("Not me")))
#'
quizlite <- function(...,
                      correct_response = 'Custom correct response.',
                      incorrect_response = 'Custom incorrect response.') {
  dots <- rlang::dots_list(...)

  quiz_db <-
    list(
      counterFormat = 'Question %current of %total',
      #Do not modify,
      questions = unname(purrr::map(
        .x = dots,
        .f = compose_q_list,
        correct_response,
        incorrect_response
      ))
    )
  dir0 <- tempdir()
  #x <- sketch::source_r("inst/unused/main.R")
  html <- system.file("index.html", package = "quizlite")
  jsonlite::write_json(quiz_db, file.path(dir0, "quiz_db.json"), auto_unbox = T)
  file.copy(html, file.path(dir0, "index.html"))
  browseURL(file.path(dir0, "index.html"))
}

#' Knit a quizlite quiz inside a html_document
#'
#' @param ... A series of nested functions. In the form question("A sample question", answer("Answer 1"),
#' answer("Answer 2", correct = TRUE)). Question and answer text must be a text string.
#' Mark the correct answer with a correct = TRUE.
#' @param correct_response A text string. Message to give to user when response is correct
#' @param incorrect_response A text string. Message to give to user when they are incorrect
#'
#' @return A html quiz inside a knitted html_document
#' @note Currently this will not display when outputted to a browser. It will only display in the viewer pane
#' Upload the .html and assests folder to a github or online repository to display in a browser.
#' @export
#'
#' @examples quizlite_knit(question(text = "What is better?",
#'                             answer("R", correct = TRUE),
#'                             answer("Python"),
#'                             answer("Javascript"),
#'                             answer("S")),
#'                         question(text = "Who is awesome?",
#'                             answer("I am", correct = TRUE),
#'                             answer("Not me")))
quizlite_knit <- function(...,
                          correct_response = 'Custom correct response.',
                          incorrect_response = 'Custom incorrect response.') {
  dots <- rlang::dots_list(...)

  quiz_db <-
    list(
      counterFormat = 'Question %current of %total',
      #Do not modify,
      questions = unname(purrr::map(
        .x = dots,
        .f = compose_q_list,
        correct_response,
        incorrect_response
      ))
      )
  dir0 <- "./assests/"
  if(!dir.exists(dir0)){
    dir.create(dir0)
  }
  html <- system.file("index.html", package = "quizlite")
  jsonlite::write_json(quiz_db, file.path(dir0, "quiz_db.json"), auto_unbox = T)
  file.copy(html, file.path(dir0, "index.html"))
  #htmltools::attachDependencies(x = file.path(dir0, "index.html"), value = file.path(dir0, "quiz_db.json"))
  htmltools::doRenderTags(htmltools::tags$iframe(src = file.path(dir0, "index.html")))
}
