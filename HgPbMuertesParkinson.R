"Algo importante a tener en cuenta en este análisis es 
que el número de muertes se presenta con decimales. 
Esto se debe a que no es un recuento de muertes real, 
sino una estimación. Medir exactamente el número de 
muertes por Parkinson es muy complicado, ya que en muchas 
personas de edad avanzada la muerte puede atribuirse a la 
propia vejez o a otras patologías, y no directamente al 
Parkinson en sí. Por lo tanto, el resultado utilizado es 
una estimación generada mediante análisis computacional. 
De hecho, el documento original proporciona un límite 
inferior y un límite superior para cada valor, pero para 
este estudio hemos decidido utilizar la estimación media."

library(tidyverse)
library(tidyjson)
library(janitor)
library(countrycode)

# Rutas
file_path <- "input/muertesParkinson.csv"
datos_dir <- "input"
out_dir   <- "results"
dir.create(out_dir, showWarnings = FALSE, recursive = TRUE)

# Diccionario para normalizar nombres de países
diccionario_completo <- c(
  "Alemania" = "Germany",
  "Bélgica" = "Belgium",
  "España" = "Spain",
  "Noruega" = "Norway",
  "República Checa" = "Czech Republic",
  "Eslovenia" = "Slovenia" 
)

# 1. Leer biomonitorización (JSON)
bm_path <- file.path(datos_dir, "biomonitorizacion_filtrada.json")
bm_raw <- read_json(bm_path) %>%
  gather_array() %>%
  spread_all() %>%
  clean_names() %>%
  as_tibble() %>%
  filter(percentile == "P50") %>%
  select(-any_of(c("document_id", "array_index", "json"))) %>%
  distinct() %>%
  rename(country = any_of(c("country", "pais", "location_name")))

# 2. Leer muertes Parkinson y filtrar
datos_MP <- read_csv(file_path, show_col_types = FALSE) %>%
  filter(metric_name == "Número") %>%
  mutate(
    country = countrycode(
      location_name,
      origin = "country.name",
      destination = "country.name.en",
      custom_match = diccionario_completo
    )
  ) %>%
  select(
    country,
    year,
    numero_muertes = val
  ) %>%
  filter(!is.na(country), !is.na(year), !is.na(numero_muertes))

# 3. Relacionar los dos datasets
datos_combinados <- inner_join(
  bm_raw,
  datos_MP,
  by = c("country", "year")
) %>%
  arrange(country, year)

# 4. Mostrar y guardar resultados
cat("Filas combinadas:", nrow(datos_combinados), "\n")
print(head(datos_combinados, 10))

# Exportar resultado
write_csv(datos_combinados, file.path(out_dir, "muertesParkinson_HgPb.csv"))
cat("Archivo guardado en:", file.path(out_dir, "muertesParkinson_HgPb.csv"), "\n")

# Vista interactiva
if (interactive()) utils::View(datos_combinados)