# https://packagemanager.posit.co/client/
# Packages available from snapshots as of 4.11.2022
options(repos = c(PPPM = "https://packagemanager.posit.co/cran/2022-11-04+pzBGwG7v"))

# output CRAN repositories used
cat(paste0("Repositories set:\n", paste0(options()$repos, collapse = ",\n"),"\n\n"))

# enter your own path here
.libPaths("C:/Users/vedoa/Desktop/r_env/shiny_leaflet_env")

# output loaded libraries
cat(paste0("Envs loaded:\n", paste0(.libPaths(),collapse = ",\n")))
