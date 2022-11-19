welcomeUI <- function(id) {
  ns <- NS(id)
  tagList(
    tabBox(id = ns("tabbox"),
           width = 12,  
           tabPanel(title = "README",
             includeMarkdown("README.md")
           )
    )
  )
}
