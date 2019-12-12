quizlite <- function(...){
  list(
    counterFormat = 'Question %current of %total',
    questions = list(
      # this is where our question list structure is generated
    )
    )
}

question <- function(text, .
                     ...,
                     correct = "Correct!",
                     incorrect = "Incorrect."){
  answers <- rlang::dots_list(...)
}

answer <- function(text,
                   correct = NULL,
                   message = NULL){

  list(option = text,
       correct = correct,
       message = message)

}
