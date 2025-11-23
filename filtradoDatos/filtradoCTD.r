# cargo librerias que necesito
library(readr)
library(dplyr)
library(data.table)

# rutas de entrada y salida
archivo_entrada <- "datos/CTD_chem_gene_ixns (1).tsv"
archivo_salida  <- "datos/CTD_humanos_filtrado.tsv"

# busco donde empieza la cabecera (el archivo tiene comentarios al inicio)
lineas_inicio <- readLines(archivo_entrada, n = 50)
header_line <- NULL
for (i in seq_along(lineas_inicio)) {
  if (grepl("ChemicalName", lineas_inicio[i]) && grepl("Organism", lineas_inicio[i])) {
    header_line <- i
    break
  }
}
if (is.null(header_line)) stop("Header no encontrado")
skip_lines <- header_line - 1

# contadores para ir viendo el progreso
filas_procesadas <- 0
filas_humanos <- 0
primera_vez <- TRUE

# funcion que procesa cada trozo del archivo (no lo leo todo de golpe)
procesar_chunk <- function(chunk, pos) {
  filas_procesadas <<- filas_procesadas + nrow(chunk)
  
  # me quedo solo con las filas de humanos
  chunk_filtrado <- chunk[chunk$Organism == "Homo sapiens", , drop = FALSE]
  filas_humanos <<- filas_humanos + nrow(chunk_filtrado)
  
  # si hay algo, lo guardo (append = TRUE despues de la primera vez)
  if (nrow(chunk_filtrado) > 0) {
    write_tsv(chunk_filtrado, archivo_salida, append = !primera_vez)
    primera_vez <<- FALSE
  }
}

# leo el archivo gigante por trozos y lo filtro sobre la marcha
read_tsv_chunked(
  archivo_entrada,
  callback = DataFrameCallback$new(procesar_chunk),
  chunk_size = 50000,
  skip = skip_lines,
  show_col_types = FALSE
)

# muestro resumen al final
cat("Procesadas:", filas_procesadas, "Filtradas (Homo sapiens):", filas_humanos, "\n")