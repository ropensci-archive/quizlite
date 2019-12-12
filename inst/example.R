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
  )
)
#debugonce(quizlite)
quizlite(quiz_db)

# Ideal Implementation ----------------------------------------------------
quiz(caption = "Quiz 1",
     question("What number is the letter A in the *English* alphabet?",
              answer("8"),
              answer("14"),
              answer("1", correct = TRUE),
              answer("23")
     )
     )
