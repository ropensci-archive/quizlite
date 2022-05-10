
<!-- README.md is generated from README.Rmd. Please edit that file -->

# quizlite

<!-- badges: start -->

<!-- badges: end -->

The goal of quizlite is to generate lightweight quizzes.

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("ropenscilabs/quizlite")
```

## Example

These examples currently don’t work for github, but they will work when
you run it locally\!

``` r
library(quizlite)
quizlite(question(text = "What is better?",
                             answer("R", correct = TRUE),
                             answer("Python"),
                             answer("Javascript"),
                             answer("S")),
                    question(text = "Who is awesome?",
                             answer("I am", correct = TRUE),
                             answer("Not me")))
```

``` r
quizlite_knit(question(text = "What is better?",
                             answer("R", correct = TRUE),
                             answer("Python"),
                             answer("Javascript"),
                             answer("S")),
                    question(text = "Who is awesome?",
                             answer("I am", correct = TRUE),
                             answer("Not me")))
```
