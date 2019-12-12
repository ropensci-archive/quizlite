#! load_script("https://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js")
# Source: https://github.com/jchamill/jquery-quiz
#! load_script("./jquery.quiz.css")
#! load_script("./jquery.quiz.js")
#! load_script("simple_interface.R")
jQuery$getJSON(
  "quiz_db.json",
  function(quiz_db_json) {
    jQuery('#new_sketch')$quiz(quiz_db_json)
  }
)
