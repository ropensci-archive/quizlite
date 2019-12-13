compose_q_list <- function(dots,
                           correct_response,
                           incorrect_response){
       list(
           q = dots[["q"]], # this is where our question list structure is generated
           options = c(dots[["options"]][which(dots[["options"]] != "TRUE")]), # Takes the input from questions list, grabbing the named options vector
           correctIndex = (match("TRUE", dots[["options"]]) - 2),
           correctResponse = correct_response,
           incorrectResponse = incorrect_response
         )
}

quizlite_test <- function(...,
                          correct_response = 'Custom correct response.',
                          incorrect_response = 'Custom incorrect response.'
                          ){
  dots <- rlang::dots_list(...)

  list( counterFormat = 'Question %current of %total', #Do not modify,
      questions = purrr::map(.x = dots,
                  .f = compose_q_list,
                  correct_response,
                  incorrect_response) %>% unname()
  )
}

question <- function(text,
                     ...){
  answers <- rlang::dots_list(...)
  return(list(q = text, options = unname(unlist(answers))))
}

answer <- function(text,
                   correct = NULL){

  list(option = text,
       correct = correct)

}

debugonce(quizlite_test)

list_quiz <-
  quizlite_test(
    question(text = 'wat',
             answer('Answer 1'),
             answer('Answer 2',correct = TRUE),
             answer('Answer 3'),
             answer('Answer 4')),
    question(text = 'A new question?',
             answer('Answer 1'),
             answer('Answer 2', correct = TRUE))
    )

quizlite(quiz_db = list_quiz)


quizlite2 <- function(...,
                     correct_response = 'Custom correct response.',
                     incorrect_response = 'Custom incorrect response.'
){
  dots <- rlang::dots_list(...)

  quiz_db <- list(counterFormat = 'Question %current of %total', #Do not modify,
       questions = purrr::map(.x = dots,
                              .f = compose_q_list,
                              correct_response,
                              incorrect_response)
  )
  dir0 <- tempdir()
  #x <- sketch::source_r("inst/unused/main.R")
  html <- system.file("index.html", package = "quizlite")
  jsonlite::write_json(quiz_db, file.path(dir0, "quiz_db.json"), auto_unbox = T)
  file.copy(html, file.path(dir0, "index.html"))
  browseURL(file.path(dir0, "index.html"))
}

quizlite(question(text = "What is better?",
                  answer("R", correct = TRUE),
                  answer("Python")
                  ),
         question(text = "Who is awesome?",
                  answer("I am"),
                  answer("Not me", correct = TRUE)
                  )
         )







