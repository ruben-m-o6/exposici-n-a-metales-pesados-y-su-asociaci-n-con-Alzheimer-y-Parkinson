# =============================================================================
# SCRIPT: Filtrar datos CTD para Homo sapiens (SOLUCIÓN DEFINITIVA)
# =============================================================================

library(readr)
library(dplyr)
library(data.table)

rm(list = ls())

# =============================================================================
# CONFIGURACIÓN
# =============================================================================

archivo_entrada <- "datos/CTD_chem_gene_ixns (1).tsv"
archivo_salida <- "datos/CTD_humanos_filtrado.tsv"

print(paste("Procesando archivo:", archivo_entrada))

# =============================================================================
# SOLUCIÓN: Leer sin comment, pero saltando manualmente las líneas de comentario
# =============================================================================

print("=== EXPLORANDO ESTRUCTURA (SOLUCIÓN CORRECTA) ===")

# Leer las primeras líneas para encontrar dónde empiezan los datos reales
lineas_inicio <- readLines(archivo_entrada, n = 50)
print("Primeras líneas del archivo:")
print(head(lineas_inicio, 10))

# Encontrar la línea que contiene los headers (ChemicalName, ChemicalID...)
header_line <- NULL
for(i in 1:length(lineas_inicio)) {
  if(grepl("ChemicalName", lineas_inicio[i]) && grepl("Organism", lineas_inicio[i])) {
    header_line <- i
    print(paste("Headers encontrados en línea:", i))
    print(paste("Header:", lineas_inicio[i]))
    break
  }
}

# Leer correctamente saltando las líneas de comentario hasta el header
skip_lines <- header_line - 1
print(paste("Saltando", skip_lines, "líneas de comentario"))

# Leer muestra correctamente
muestra <- read_tsv(archivo_entrada, 
                   skip = skip_lines,
                   n_max = 10, 
                   show_col_types = FALSE)

print("\n=== ESTRUCTURA CORRECTA ===")
print("Columnas encontradas:")
print(colnames(muestra))
print("\nPrimeras filas:")
print(muestra)

# Verificar organismos
print("\nOrganismos en muestra:")
print(table(muestra$Organism, useNA = "ifany"))

# =============================================================================
# FILTRADO CORRECTO
# =============================================================================

print("=== FILTRANDO POR HOMO SAPIENS ===")

filtrar_humanos_correcto <- function(archivo_entrada, archivo_salida, skip_lines, chunk_size = 50000) {
  
  filas_procesadas <- 0
  filas_humanos <- 0
  primera_vez <- TRUE
  
  procesar_chunk <- function(chunk, pos) {
    
    filas_procesadas <<- filas_procesadas + nrow(chunk)
    
    # Filtro por Homo sapiens
    chunk_filtrado <- chunk %>%
      filter(Organism == "Homo sapiens")
    
    filas_humanos <<- filas_humanos + nrow(chunk_filtrado)
    
    if (nrow(chunk_filtrado) > 0) {
      write_tsv(chunk_filtrado, archivo_salida, append = !primera_vez)
      primera_vez <<- FALSE
    }
    
    if (filas_procesadas %% 100000 == 0) {
      print(paste("📊 Procesadas:", format(filas_procesadas, big.mark = ","), 
                  "| 👥 Homo sapiens:", format(filas_humanos, big.mark = ",")))
    }
    
    return(chunk_filtrado)
  }
  
  # Leer con skip correcto
  read_tsv_chunked(archivo_entrada,
                   callback = DataFrameCallback$new(procesar_chunk),
                   chunk_size = chunk_size,
                   skip = skip_lines,  # Usar el skip calculado
                   show_col_types = FALSE)
  
  return(list(procesadas = filas_procesadas, filtradas = filas_humanos))
}

# Solo ejecutar si encontramos el header
if(!is.null(header_line)) {
  print("🚀 Iniciando filtrado con estructura correcta...")
  
  resultado <- filtrar_humanos_correcto(archivo_entrada, archivo_salida, skip_lines)
  
  print("=== RESULTADO FINAL ===")
  print(paste("📊 Total procesadas:", format(resultado$procesadas, big.mark = ",")))
  print(paste("👥 Homo sapiens encontradas:", format(resultado$filtradas, big.mark = ",")))
  
  if(resultado$filtradas > 0) {
    print(paste("📈 Porcentaje humanos:", round(resultado$filtradas / resultado$procesadas * 100, 1), "%"))
    
    # Verificación
    if (file.exists(archivo_salida)) {
      datos_verificacion <- read_tsv(archivo_salida, n_max = 5, show_col_types = FALSE)
      
      print("\n=== VERIFICACIÓN EXITOSA ===")
      print(paste("📁 Original:", round(file.size(archivo_entrada) / (1024^2), 1), "MB"))
      print(paste("📁 Filtrado:", round(file.size(archivo_salida) / (1024^2), 1), "MB"))
      
      print("\n🔍 Primeras filas filtradas:")
      print(datos_verificacion)
      
      print("\n✅ Organismos en resultado:")
      print(table(datos_verificacion$Organism))
    }
    
  } else {
    print("❌ No se encontraron datos de Homo sapiens")
  }
} else {
  print("❌ ERROR: No se pudo encontrar la línea de headers en el archivo")
}

print("=== SCRIPT COMPLETADO ===")