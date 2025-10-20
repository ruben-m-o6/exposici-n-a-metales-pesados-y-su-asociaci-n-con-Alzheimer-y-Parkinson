# =============================================================================
# SCRIPT SIMPLE: Filtrar Lead, Mercury y Mercuric a CSV
# =============================================================================

library(readr)
library(dplyr)

# Limpiar entorno
rm(list = ls())

# =============================================================================
# CONFIGURACIÓN
# =============================================================================

archivo_entrada <- "datos/CTD_humanos_filtrado.tsv"
archivo_csv_salida <- "datos/metales_pesados.csv"

print("=== FILTRADO SIMPLE A CSV ===")

# =============================================================================
# CARGAR Y FILTRAR
# =============================================================================

# Cargar datos
datos_humanos <- read_tsv(archivo_entrada, show_col_types = FALSE)

# Renombrar primera columna
colnames(datos_humanos)[1] <- "ChemicalName"

print(paste("📊 Total filas de humanos:", format(nrow(datos_humanos), big.mark = ",")))

# Filtrar por Lead, Mercury y Mercuric
datos_metales <- datos_humanos %>%
  filter(grepl("lead|mercury|mercuric", ChemicalName, ignore.case = TRUE))

print(paste("⚗️ Interacciones con metales encontradas:", format(nrow(datos_metales), big.mark = ",")))

# =============================================================================
# GUARDAR CSV
# =============================================================================

if(nrow(datos_metales) > 0) {
  
  # Guardar CSV
  write_csv(datos_metales, archivo_csv_salida)
  
  print("✅ ARCHIVO CSV GUARDADO")
  print(paste("📁 Ubicación:", archivo_csv_salida))
  print(paste("📊 Filas guardadas:", format(nrow(datos_metales), big.mark = ",")))
  print(paste("📈 Tamaño:", round(file.size(archivo_csv_salida) / (1024^2), 1), "MB"))
  
  # Estadísticas rápidas
  lead_count <- sum(grepl("lead", datos_metales$ChemicalName, ignore.case = TRUE))
  mercury_count <- sum(grepl("mercury", datos_metales$ChemicalName, ignore.case = TRUE))
  mercuric_count <- sum(grepl("mercuric", datos_metales$ChemicalName, ignore.case = TRUE))
  
  print("\n📊 RESUMEN:")
  print(paste("🔶 Lead:", format(lead_count, big.mark = ",")))
  print(paste("🔶 Mercury:", format(mercury_count, big.mark = ",")))
  print(paste("🔶 Mercuric:", format(mercuric_count, big.mark = ",")))
  
  # Muestra
  print("\n🔍 Primeras 5 filas:")
  print(head(datos_metales[, c("ChemicalName", "GeneSymbol", "InteractionActions")], 5))
  
} else {
  print("❌ No se encontraron datos de metales pesados")
}

print("\n✅ PROCESO COMPLETADO")