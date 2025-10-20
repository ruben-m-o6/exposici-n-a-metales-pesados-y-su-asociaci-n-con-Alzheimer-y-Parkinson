library(readr)
library(dplyr)

archivo_entrada <- "datos/CTD_humanos_filtrado.tsv"
archivo_csv_salida <- "datos/metales_pesados.csv"

# Cargar y filtrar
datos_humanos <- read_tsv(archivo_entrada, show_col_types = FALSE)
colnames(datos_humanos)[1] <- "ChemicalName"
datos_metales <- datos_humanos[grepl("lead|mercury|mercuric", datos_humanos$ChemicalName, ignore.case = TRUE), , drop = FALSE]

if (nrow(datos_metales) > 0) {
  write_csv(datos_metales, archivo_csv_salida)
}