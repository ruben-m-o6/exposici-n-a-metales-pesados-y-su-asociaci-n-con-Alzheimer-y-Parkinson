library(dplyr)
library(tidyr)
library(readr)

# 1. Cargar datos
# Ajusta la ruta si tus archivos están en otra carpeta
df_genes <- read_csv("input/genesAlzheimerFiltrado.csv", show_col_types = FALSE)
df_metales <- read_csv("input/metales_pesados.csv", show_col_types = FALSE)

# 2. Limpieza de Genes (SIN BETA, SOLO ODDS)
genes_clean <- df_genes %>%
  select(
    mappedGenes,
    riskAllele,
    traitName,
    pValue,
    orValue  # Solo nos quedamos con el Odds Ratio
    # beta ha sido eliminado
  ) %>%
  # Convertir orValue a numérico (los guiones "-" se vuelven NA)
  mutate(orNumeric = as.numeric(orValue)) %>%
  
  # FILTRO ESTRICTO PEDIDO:
  # 1. Eliminar si no tiene dato de Odds Ratio (!is.na)
  # 2. Eliminar si el Odds Ratio es neutro (!= 1)
  filter(!is.na(orNumeric) & orNumeric != 1) %>%
  
  # Separar genes múltiples
  separate_rows(mappedGenes, sep = ",\\s*") %>%
  mutate(mappedGenes = trimws(mappedGenes)) %>%
  filter(!is.na(mappedGenes), mappedGenes != "", mappedGenes != "-") %>%
  
  # Eliminar la columna auxiliar numérica si quieres mantener el formato original,
  # o quedarte con la numérica para análisis. Aquí dejo la numérica limpia.
  select(-orValue) %>%
  rename(orValue = orNumeric)

# 3. Limpieza de Metales
metales_clean <- df_metales %>%
  filter(
    Organism == "Homo sapiens",
    grepl("lead|mercury|mercuric", ChemicalName, ignore.case = TRUE)
  ) %>%
  select(
    GeneSymbol,
    ChemicalName,
    Interaction,
    InteractionActions
  ) %>%
  mutate(GeneSymbol = trimws(GeneSymbol)) %>%
  filter(!is.na(GeneSymbol), GeneSymbol != "", GeneSymbol != "-")

# 4. Cruzar datos
df_combinado <- inner_join(
  genes_clean, 
  metales_clean, 
  by = c("mappedGenes" = "GeneSymbol")
) %>%
  arrange(mappedGenes, ChemicalName)

# 5. Guardar
dir.create("results", showWarnings = FALSE)
nombre_archivo_salida <- "results/Analisis_Genes_Metales_Alzheimer_SoloOdds.csv"

write_csv(df_combinado, nombre_archivo_salida)
