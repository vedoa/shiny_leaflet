basicExampleUI <- function(id, type = c("click", "DT", "customMarker"), title) {
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
           }else if(type == "customMarker"){
             fluidRow(column(width = 8,
                             leafletOutput(ns("map"))
                     ),
                     column(width = 4,
                            radioButtons(ns("radio"), label = "Choose cutom marker", choiceNames = customMarker$id, choiceValues = customMarker$id),
                            uiOutput(ns("markerSVG")),
                            HTML("<b>Setup custom marker</b>"),
                            numericInput(inputId = ns("anchX"), label = "Anchor X", value = 12),
                            numericInput(inputId = ns("anchY"), label = "Anchor Y", value = 12),
                            numericInput(inputId = ns("iW"), label = "Width", value = 25, min = 1, max = 100),
                            numericInput(inputId = ns("iH"), label = "Height", value = 25, min = 1, max = 100),
                            actionButton(inputId = ns("updateMarker"), label = "Update marker")
                     )
             )
           }
          )
}

basicExampleServer <- function(id, type = c("click", "DT", "customMarker")) {
  moduleServer(
    id,
    function(input, output, session) {
      # example 1 -------------------------------------
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
      # example 2 -------------------------------------
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
      # example 3 -------------------------------------
      }else if(type == "customMarker"){
        output$map <- renderLeaflet({
          leaflet() %>% 
            addTiles() %>% 
            addMarkers(data = city, lng = ~lng, lat = ~lat, layerId = ~id, group = "base", popup = ~name)
        })
        output$markerSVG <- renderUI({ 
          tagList(
            HTML("<b>Marker preview</b><br>"),
            img(src = customMarker[which(customMarker$id == input$radio), "image"])
          )
        })
        observeEvent(input$updateMarker, {
          proxy <- leafletProxy("map")
          proxy %>%
            clearGroup("base") %>%
            addMarkers(data = city, 
                       lng = ~lng, 
                       lat = ~lat, 
                       layerId = ~id, 
                       group = "base", 
                       popup = ~name, 
                       icon = makeIcon(iconUrl = customMarker[which(customMarker$id == input$radio), "image"],
                                       iconAnchorX = input$anchX,
                                       iconAnchorY = input$anchY,
                                       iconWidth = input$iW,
                                       iconHeight = input$iH)
            ) 
        })
        
      }
    }
  )
}
