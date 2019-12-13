quizlite_test <- function(...,
                          correct_response = 'Custom correct response.',
                          incorrect_response = 'Custom incorrect response.'
                          ){
  dots <- rlang::dots_list(...)[[1]]
  list(counterFormat = 'Question %current of %total', #Do not modify,
  questions = list(
    #counterFormat = 'Question %current of %total', #Do not modify,
    list(
    q = dots[["q"]], # this is where our question list structure is generated
    options = c(dots[["options"]]), # Takes the input from questions list, grabbing the named options vector
    correctIndex = (match("TRUE", dots[["options"]]) - 2),
    correctResponse = correct_response,
    incorrectResponse = incorrect_response
  ),
  list()
  )
  )
}

question <- function(text,
                     ...,
                     correct = "Correct!",
                     incorrect = "Incorrect."){
  answers <- rlang::dots_list(...)
  return(list(q = text, options = unname(unlist(answers))))
}

answer <- function(text,
                   correct = NULL,
                   message = NULL){

  list(option = text,
       correct = correct,
       message = message)

}

#debugonce(quizlite_test)
list_quiz <-
  quizlite_test(
    question(text = "What is better?",
             answer("R", correct = TRUE),
             answer("Python")),
    question(text = "Who is awesome?",
             answer("I am", correct = TRUE),
             answer("Not me"))
    )



quizlite(quiz_db = list_quiz)


options_string <- unlist(list_quiz$questions[[1]]["options"])

list_quiz$questions[[1]][["options"]][["correct"]]

