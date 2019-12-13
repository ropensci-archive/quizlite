#' Quiz questions
#'
#' Add multiple choice quiz questions for quizlite. It is used within
#'   [quizlite()].
#'
#' @param text question or option text
#' @param ... one or more questions or answers
#'
#' @return question output
#' @export
#'
#' @examples
#' question(text = "What is better?",
#'     answer("R", correct = TRUE),
#'     answer("Python"),
#'     answer("Javascript"),
#'     answer("S"))
question <- function(text,
                     ...){
  answers <- rlang::dots_list(...)
  return(list(q = text, options = unname(unlist(answers))))
}

#' Quiz answers
#'
#' Add multiple choice answers to questions
#'
#' @param text answer text
#' @param correct correct - mark TRUE if correct, else leave blank, as default
#'   is NULL.
#'
#' @return answer output
#' @export
#'
#' @examples
#' question(text = "What is better?",
#'     answer("R", correct = TRUE),
#'     answer("Python"),
#'     answer("Javascript"),
#'     answer("S"))
answer <- function(text,
                   correct = NULL){

  list(option = text,
       correct = correct)

}
