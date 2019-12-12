# Create a new DOM element with id
dom <- function(tag, id) {
  declare(el)
  el <- document$createElement(tag)
  el$id <- id
  return(el)
}

insert_into <- function(x, y) {
  document$querySelector(y)$appendChild(x)
}


start_button <- dom("a", "quiz-start-btn")
start_button$href <- "#"
start_button$class <- "quiz-button"
start_button$innerText <- "Start"

insert_into(dom("div", "quiz-header"), "#new_sketch")
insert_into(dom("div", "quiz-start-screen"), "#new_sketch")
insert_into(start_button, "#new_sketch")
