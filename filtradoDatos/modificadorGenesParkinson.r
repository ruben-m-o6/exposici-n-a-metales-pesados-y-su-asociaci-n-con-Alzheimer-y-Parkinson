library(readr)
library(dplyr)
archivo_entrada <- "datos/genesParkinson.tsv"
archivo_salida <- "datos/genesParkinsonFiltrado.csv"

#cargamos datos
datos <- read_tsv(archivo_entrada, show_col_types = FALSE)

#eliminamos las 2 ultimas columnas
datos <- datos[,1:(ncol(datos)-2)]
write_csv(datos, archivo_salida)