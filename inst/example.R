
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
      correctIndex = 1,
      correctResponse = 'Custom correct response.',
      incorrectResponse = 'Custom incorrect response.'
    )
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
     ),
     question("Where are you right now? (select ALL that apply)",
              answer("Planet Earth", correct = TRUE),
              answer("Pluto"),
              answer("At a computing device", correct = TRUE),
              answer("In the Milky Way", correct = TRUE),
              incorrect = "Incorrect. You're on Earth, in the Milky Way, at a computer."
     )
)
