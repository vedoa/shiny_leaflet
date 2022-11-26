advancedExample1UI <- function(id, title) {
  ns <- NS(id)
  tabPanel(title = title,
           fluidRow(column(width = 9,
                           leafletOutput(ns("map"))
                    ),
                    column(width = 3,
                           htmlColorPickerInput(ns("colorPicker")),
                           textOutput(ns("hexColor"))
                    )
           )
  )
}

advancedExample1Server <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
    
        output$map <- renderLeaflet({
          leaflet() %>% 
            addTiles() %>% 
            addMarkers(data = city, lng = ~lng, lat = ~lat, layerId = ~id, group = "base", popup = ~name)
        })
        
        output$hexColor <- renderText({paste0(input$colorPicker)})
        
        observe({
          proxy <- leafletProxy("map")
          proxy %>%
            clearGroup("base") %>%
            addMarkers(data = city, 
                       lng = ~lng, 
                       lat = ~lat, 
                       layerId = ~id, 
                       group = "base", 
                       popup = ~name, 
                       icon = makeIcon(iconUrl = paste0('data:image/svg+xml;base64,', 
                                                 RCurl::base64Encode(paste0('<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" baseProfile="full" width="24.48" height="33.6" viewBox="0 0 24.48 33.60" enable-background="new 0 0 24.48 33.60" xml:space="preserve">
                                                                       <g>
                                                                        <path fill="',input$colorPicker,'" fill-opacity="1" stroke-width="0.96" stroke-linejoin="round" d="M 24.48,33.6L 19.7925,33.6L 14.1675,24.1125C 13.6275,23.2275 13.1038,22.475 12.5962,21.855C 12.0887,21.235 11.5675,20.7275 11.0325,20.3325C 10.4975,19.9375 9.92375,19.65 9.31125,19.47C 8.69875,19.29 8.005,19.2 7.23,19.2L 3.84,19.2L 3.84,33.6L 0,33.6L 0,1.43051e-006L 10.2225,1.43051e-006C 11.7225,1.43051e-006 13.105,0.183752 14.37,0.551248C 15.635,0.918752 16.7337,1.47625 17.6662,2.22375C 18.5987,2.97125 19.3275,3.9025 19.8525,5.0175C 20.3775,6.1325 20.64,7.4375 20.64,8.9325C 20.64,10.1025 20.4587,11.175 20.0962,12.15C 19.7337,13.125 19.2187,13.9937 18.5513,14.7563C 17.8837,15.5188 17.08,16.1688 16.14,16.7063C 15.2,17.2437 14.1425,17.6625 12.9675,17.9625L 12.9675,18.0525C 13.5525,18.3025 14.0612,18.5875 14.4938,18.9075C 14.9262,19.2275 15.3375,19.6075 15.7275,20.0475C 16.1175,20.4875 16.505,20.985 16.89,21.54C 17.275,22.095 17.7025,22.74 18.1725,23.475L 24.48,33.6 Z M 3.84,3.36L 3.84,15.84L 9.315,15.84C 10.32,15.84 11.2513,15.6875 12.1088,15.3825C 12.9662,15.0775 13.7062,14.6413 14.3287,14.0738C 14.9512,13.5062 15.4388,12.8112 15.7912,11.9888C 16.1437,11.1663 16.32,10.2425 16.32,9.2175C 16.32,7.3775 15.7237,5.94125 14.5312,4.90875C 13.3387,3.87625 11.615,3.36 9.36,3.36L 3.84,3.36 Z "/>
                                                                       </g>
                                                                      </svg>')
                                                                     )
                                                 ),
                                       iconAnchorX = 12,
                                       iconAnchorY = 12,
                                       iconWidth = 25,
                                       iconHeight = 25)
            ) 
        })
    }
  )
}
