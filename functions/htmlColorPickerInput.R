htmlColorPickerInput <- function(inputId, label = "Choose color", value = "#ffffff") {
  addResourcePath(
    prefix = 'colPick', directoryPath = './www/js'
  )
  tagList(
    singleton(
      tags$head(
        tags$script(
          src = "colPick/colorPicker.js"
        )
      )
    ),
    tags$label(label),
    tags$br(),
    tags$input(
      id = inputId,
      value = value, 
      type = "color", 
      class = "htmlColorPicker"
    )
  )
}
