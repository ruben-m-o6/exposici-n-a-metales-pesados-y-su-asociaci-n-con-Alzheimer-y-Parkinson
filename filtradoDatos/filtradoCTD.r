library(readr)
library(dplyr)
library(data.table)

archivo_entrada <- "datos/CTD_chem_gene_ixns (1).tsv"
archivo_salida  <- "datos/CTD_humanos_filtrado.tsv"

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

filas_procesadas <- 0
filas_humanos <- 0
primera_vez <- TRUE

procesar_chunk <- function(chunk, pos) {
  filas_procesadas <<- filas_procesadas + nrow(chunk)
  chunk_filtrado <- chunk[chunk$Organism == "Homo sapiens", , drop = FALSE]
  filas_humanos <<- filas_humanos + nrow(chunk_filtrado)
  if (nrow(chunk_filtrado) > 0) {
    write_tsv(chunk_filtrado, archivo_salida, append = !primera_vez)
    primera_vez <<- FALSE
  }
}

read_tsv_chunked(
  archivo_entrada,
  callback = DataFrameCallback$new(procesar_chunk),
  chunk_size = 50000,
  skip = skip_lines,
  show_col_types = FALSE
)

cat("Procesadas:", filas_procesadas, "Filtradas (Homo sapiens):", filas_humanos, "\n")