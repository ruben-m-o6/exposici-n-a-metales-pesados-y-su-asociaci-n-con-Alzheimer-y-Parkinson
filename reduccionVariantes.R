library(dplyr)
library(readr)

# 1. Cargar tus archivos actuales (los de SoloOdds)
df_alz <- read_csv("results/Analisis_Genes_Metales_Alzheimer_SoloOdds.csv", show_col_types = FALSE)
df_park <- read_csv("results/Analisis_Genes_Metales_Parkinson_SoloOdds.csv", show_col_types = FALSE)

# Función para limpiar duplicados conservando la mejor evidencia
limpiar_duplicados <- function(df) {
  df %>%
    # Agrupamos por Gen y por Metal (para no mezclar tóxicos distintos)
    group_by(mappedGenes, ChemicalName) %>%
    
    # ORDENAMOS:
    # 1. Primero el pValue más pequeño (más fiable)
    # 2. Luego el Odds Ratio más alto (mayor riesgo) para desempatar
    arrange(pValue, desc(orValue)) %>%
    
    # Nos quedamos solo con la PRIMERA fila de cada grupo (el "campeón")
    slice(1) %>%
    
    # Desagrupamos para volver a tener un dataframe normal
    ungroup()
}

# 2. Ejecutar la limpieza
df_alz_unico <- limpiar_duplicados(df_alz)
df_park_unico <- limpiar_duplicados(df_park)

# 3. Ver la diferencia
cat("--- ALZHEIMER ---\n")
cat("Filas originales:", nrow(df_alz), "\n")
cat("Filas únicas (Gen+Metal):", nrow(df_alz_unico), "\n")
cat("Reducción del:", round((1 - nrow(df_alz_unico)/nrow(df_alz))*100, 1), "%\n\n")

cat("--- PARKINSON ---\n")
cat("Filas originales:", nrow(df_park), "\n")
cat("Filas únicas (Gen+Metal):", nrow(df_park_unico), "\n")
cat("Reducción del:", round((1 - nrow(df_park_unico)/nrow(df_park))*100, 1), "%\n")

# 4. Guardar los archivos limpios y resumidos
write_csv(df_alz_unico, "results/AlzheimerMetalesFiltro.csv")
write_csv(df_park_unico, "results/ParkinsonMetalesFiltro.csv")