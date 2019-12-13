quizlite_test <- function(...){
  list(
    counterFormat = 'Question %current of %total', #Do not modify
    questions = list(...# this is where our question list structure is generated
        ),
    options = c(...), # Takes the input from questions list, grabbing the named options vector
    correctIndex = match("TRUE", options)
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

debugonce(question)
list_quiz <- quizlite_test(question(text = "What is better?", answer("R", correct = TRUE), answer("Python")))




options_string <- unlist(list_quiz$questions[[1]]["options"])

list_quiz$questions[[1]][["options"]][["correct"]]

