quizlite_test <- function(...,
                          correct_response = 'Custom correct response.',
                          incorrect_response = 'Custom incorrect response.'
                          ){
  dots <- rlang::dots_list(...)[[1]]

  list(
    counterFormat = 'Question %current of %total', #Do not modify
    questions = dots[["q"]], # this is where our question list structure is generated
    options = dots[["options"]], # Takes the input from questions list, grabbing the named options vector
    correctIndex = (match("TRUE", dots[["options"]]) - 2),
    correctResponse = correct_response,
    incorrectResponse = incorrect_response
  )
}

question <- function(text,
                     ...,
                     correct = "Correct!",
                     incorrect = "Incorrect."){
  answers <- rlang::dots_list(...)
  return(list(q = text, options = unlist(answers)))
}

answer <- function(text,
                   correct = NULL,
                   message = NULL){

  list(option = text,
       correct = correct,
       message = message)

}

debugonce(quizlite_test)
list_quiz <-
  quizlite_test(
    question(text = "What is better?",
             answer("R", correct = TRUE),
             answer("Python"))
    )




options_string <- unlist(list_quiz$questions[[1]]["options"])

list_quiz$questions[[1]][["options"]][["correct"]]

