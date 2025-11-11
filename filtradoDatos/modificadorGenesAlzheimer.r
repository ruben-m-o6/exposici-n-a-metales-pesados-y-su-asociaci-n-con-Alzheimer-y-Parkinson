library(readr)
library(dplyr)
archivo_entrada <- "datos/genesAlzheimer.tsv"
archivo_salida <- "datos/genesAlzheimerFiltrado.csv"

#cargamos datos
datos <- read_tsv(archivo_entrada, show_col_types = FALSE)

#eliminamos las 2 ultimas columnas
datos <- datos[,1:(ncol(datos)-2)]
write_csv(datos, archivo_salida)