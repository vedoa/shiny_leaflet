# Source https://de.wikipedia.org/wiki/Bosnien_und_Herzegowina
city <- data.frame(id = 1:5,
                   name = c("Sarajevo", "Banja Luka", "Tuzla", "Zenica", "Bijeljina"),
                   population = c(291422, 150997, 120441, 115134, 114663),
                   lng = c(18.413029, 17.191000, 18.66709, 17.90397, 19.21437),
                   lat = c(43.856430, 44.772182, 44.53842, 44.20169, 44.75874)
)

customMarker <- data.frame(id = c("circle", "rectangle", "custom"),
                           svg = c('<svg height="25" width="25" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" >
                                     <circle cx="13" cy="13" r="10" stroke="black" stroke-width="3" fill="red" />
                                    </svg>', 
                                   '<svg width="25" height="25" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" >
                                     <rect width="24" height="24" style="fill:rgb(0,0,255);stroke-width:3;stroke:rgb(0,0,0)" />
                                    </svg>',
                                   '<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" baseProfile="full" width="48" height="48" viewBox="0 0 48.00 48.00" enable-background="new 0 0 48.00 48.00" xml:space="preserve">
                                   	  <ellipse fill="none" stroke-width="0.96" stroke-linejoin="round" stroke="#000000" stroke-opacity="1" cx="11.4" cy="14.22" rx="7.74" ry="7.74"/>
                                   	  <ellipse fill="none" stroke-width="0.96" stroke-linejoin="round" stroke="#000000" stroke-opacity="1" cx="34.86" cy="14.22" rx="7.74" ry="7.74"/>
                                   	  <ellipse fill="#FFFFFF" fill-opacity="1" stroke-width="0.96" stroke-linejoin="round" stroke="#000000" stroke-opacity="1" cx="22.98" cy="27.75" rx="13.26" ry="13.26"/>
                                   	  <ellipse fill="none" stroke-width="0.96" stroke-linejoin="round" stroke="#000000" stroke-opacity="1" cx="18.45" cy="22.38" rx="1.89" ry="1.89"/>
                                   	  <ellipse fill="none" stroke-width="0.96" stroke-linejoin="round" stroke="#000000" stroke-opacity="1" cx="26.04" cy="22.38" rx="1.89" ry="1.89"/>
                                   	  <path fill="#000000" fill-opacity="1" stroke-width="0.96" stroke-linejoin="round" d="M 22.59,27.21C 23.1699,27.21 23.64,27.5324 23.64,27.93C 23.64,28.3276 23.1699,28.65 22.59,28.65C 22.0101,28.65 21.54,28.3276 21.54,27.93C 21.54,27.5324 22.0101,27.21 22.59,27.21 Z "/>
                                   	  <path fill="none" stroke-width="0.96" stroke-linejoin="round" stroke="#000000" stroke-opacity="1" d="M 18.12,32.31L 21.6,34.17L 26.82,32.85"/>
                                    </svg>')
             )
customMarker$image <- paste0('data:image/svg+xml;base64,', sapply(customMarker$svg, RCurl::base64Encode, simplify = TRUE))
