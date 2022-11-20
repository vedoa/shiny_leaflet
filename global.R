# load all modules, data, function
scriptsList <- list.files(path = c("./modules/",
                                   "./functions/",
                                   "./data/"),
                          pattern = ".*\\.R$", 
                          full.names = TRUE)
lapply(scriptsList, source)
