# load all modules
modulesList <- list.files(path = "./module/",
                          pattern = ".*\\.R$", 
                          full.names = TRUE)
lapply(modulesList, source)

# Source https://de.wikipedia.org/wiki/Bosnien_und_Herzegowina
city <- data.frame(id = 1:5,
                   name = c("Sarajevo", "Banja Luka", "Tuzla", "Zenica", "Bijeljina"),
                   population = c(291422, 150997, 120441, 115134, 114663),
                   lng = c(18.413029, 17.191000, 18.66709, 17.90397, 19.21437),
                   lat = c(43.856430, 44.772182, 44.53842, 44.20169, 44.75874)
                   )

