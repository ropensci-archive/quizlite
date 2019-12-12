quizlite_test <- function(...){
  list(
    counterFormat = 'Question %current of %total',
    questions = list(question
      # this is where our question list structure is generated
    )
  )
}

question <- function(text,
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

debugonce(question)
list_quiz <- quizlite_test(question(text = "What is better?", answer("R", correct = TRUE), answer("Python")))
