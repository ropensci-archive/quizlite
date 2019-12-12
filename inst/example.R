
quiz_db <- list(
  counterFormat = 'Question %current of %total',
  questions = list(
    list(
      q= 'A sample question?',
      options= c('Answer 1', 'Answer 2', 'Answer 3', 'Answer 4'),
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

debugonce(quizlite)
quizlite(quiz_db)
