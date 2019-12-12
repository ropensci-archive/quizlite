#! load_script("https://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js")

# Source: https://github.com/jchamill/jquery-quiz
#! load_script("inst/jquery.quiz.css")
#! load_script("inst/jquery.quiz.js")

#! load_script("inst/simple_interface.R")
quiz_db <- list(
  counterFormat = 'Question %current of %total',
  questions = c(
    list(
      q= 'A sample question?',
      options= c('Answer 1',
                 'Answer 2',
                 'Answer 3',
                 'Answer 4'),
      correctIndex = 1,
      correctResponse = 'Custom correct response.',
      incorrectResponse = 'Custom incorrect response.'
    ),
    list(
      q= 'A new question?',
      options= c('Answer 1', 'Answer 2'),
      correctIndex = 0,
      correctResponse = 'Custom correct response.',
      incorrectResponse = 'Custom incorrect response.'
    )
  )
)

jQuery('#new_sketch')$quiz(quiz_db)
