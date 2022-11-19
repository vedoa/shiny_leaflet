basicExampleUI <- function(id, type = c("click", "DT"), title) {
  ns <- NS(id)
  tabPanel(title = title,
           if(type == "click"){
              fluidRow(column(width = 9,
                            leafletOutput(ns("map"))
                       ),
                       column(width = 3,
                              htmlOutput(ns("text_lng_lat"))
                       )
              )
           }else if(type == "DT"){
             fluidRow(column(width = 6,
                             leafletOutput(ns("map"))
             ),
             column(width = 6,
                    DTOutput(ns("dt"))
             )
             )
           }
          )
}

basicExampleServer <- function(id, type = c("click", "DT")) {
  moduleServer(
    id,
    function(input, output, session) {
      if(type == "click"){
        output$map <- renderLeaflet({
          leaflet() %>% 
            addTiles() %>% 
            setView(lat = 44.811962, lng = 15.868565, zoom = 7)
        })
        observeEvent(input$map_click, {
          temp <- input$map_click
          proxy <- leafletProxy("map")
          proxy %>% 
            clearMarkers() %>% 
            addMarkers(lng = temp$lng, lat = temp$lat)
          
          output$text_lng_lat <- renderText({ 
            HTML(paste0("<b>Coordinates</b><br>lng = ", temp$lng, "<br>lat = ", temp$lat))
          })
        })
      }else if(type == "DT"){
        output$map <- renderLeaflet({
          leaflet() %>% 
            addTiles() %>% 
            addMarkers(data = city, lng = ~lng, lat = ~lat, layerId = ~id, group = "base", popup = ~name)
        })
        output$dt <- renderDT({
            city
        })
        observeEvent(input$map_marker_click, {
          selectRows(proxy = dataTableProxy("dt"), selected = input$map_marker_click$id, ignore.selectable = TRUE)
        })
        observeEvent(input$dt_rows_selected, ignoreNULL = FALSE, {
          proxy <- leafletProxy("map")
          proxy %>%
            clearGroup(group = "dt_selected") %>%
            addCircles(data = city[input$dt_rows_selected, ], lng = ~lng, lat = ~lat, color = "blue", group = "dt_selected", radius = 10000)
        })
      }
    }
  )
}
