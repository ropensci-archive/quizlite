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
