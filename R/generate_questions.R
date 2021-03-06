library(googlesheets4)
library(dplyr)
library(rlang)
library(shiny)

# function used to add red asterisk to mandatory fields
labelMandatory <- function(label){
  tagList(
    label,
    span("*", class = "mandatory_star")
  )
}

# Sanitize google sheet input
sanitize_input <- function(x){
  if (!is.null(x[["mandatory"]]) && isTRUE(x$mandatory)) {
    x$label <- bquote(labelMandatory(.(x$label)))
    x$mandatory <- NULL
  } else {
    x$mandatory <- NULL
  }

  if (!is.null(x[["choices"]])) {
    x$choices <- scan(text = x$choices, what = character(), sep = ",",
                      strip.white = TRUE, quiet = TRUE)
    x$choices <- x$choices[x$choices != ""]

    if (is.na(x$selected)) {
      x$selected <- character(0)
    }
  }

  if (is.na(x$width)) {
    x$width <- NULL
  }
  return(x)
}

# Select columns based on input type
select_cols <- function(df, ..., prefix=NULL){
  if (!is.null(prefix)) {
    df <- select(df, ..., starts_with(prefix)) %>%
      rename_at(vars(starts_with(prefix)), ~sub(prefix, '', .x))
  } else {
    df <- select(df, ...)
  }

  df %>%
    as.list() %>%
    sanitize_input()
}

# Return corresponding shiny object with respect to input type
choose_input <- function(input_df) {
  switch(
    input_df$type,
    multipleChoice = {
      input_list <- select_cols(
        input_df, 'inputId', 'label', 'mandatory', 'width', prefix = 'mult_'
      )
      bquote(radioButtons(..(input_list)), splice = TRUE)
    },
    numericInput = {
      input_list <- select_cols(
        input_df, 'inputId', 'label', 'mandatory', 'width', prefix = 'num_'
      )
      bquote(numericInput(..(input_list)), splice = TRUE)
    },
    textInput = {
      input_list <- select_cols(
        input_df, 'inputId', 'label', 'mandatory', 'width', prefix = 'chr_'
      )
      bquote(textInput(..(input_list)), splice = TRUE)
    }
  )
}

# Create a div in shiny UI with input objects corresponding to questions in the googlesheet
populate_questions <- function(questions, ss, sheet, div_id) {
  inputs <- questions %>%
    rowwise() %>%
    group_map(~choose_input(.x))

  # Drop invalid input types (returned as NULL from `choose_input()`)
  inputs <- inputs[!sapply(inputs, is.null)]

  return(eval(bquote(htmltools::div(
    id = div_id,
    ..(inputs),
    actionButton(
      inputId = "submit",
      label = "Submit",
      class = "btn-primary",
      width = 350
    )
  ), splice = TRUE)))
}
