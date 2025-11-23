# Exposición a Metales Pesados y su Asociación con Alzheimer y Parkinson

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![R](https://img.shields.io/badge/R-4.3%2B-blue)](https://www.r-project.org/)
[![Python](https://img.shields.io/badge/Python-3.8%2B-green)](https://www.python.org/)

Este repositorio contiene el análisis completo sobre la relación entre la exposición a metales pesados (plomo y mercurio) y variantes genéticas de riesgo para enfermedades neurodegenerativas: Alzheimer y Parkinson.


## 📋 Tabla de Contenidos

- [Descripción General](#-descripción-general)
- [Estructura del Repositorio](#-estructura-del-repositorio)
- [Requisitos y Dependencias](#-requisitos-y-dependencias)
- [Instalación](#-instalación)
- [Flujo de Trabajo](#-flujo-de-trabajo)
- [Datasets Utilizados](#-datasets-utilizados)
- [Metodología](#-metodología)
- [Resultados Esperados](#-resultados-esperados)
- [Licencia](#-licencia)
- [Contacto](#-contacto)



## 🔬 Descripción General

Este proyecto investiga cómo la exposición ambiental a plomo (Pb) y mercurio (Hg) puede potenciar el riesgo genético de desarrollar Alzheimer y Parkinson. Se realiza a lo largo del proyecto:

- **Análisis estadístico** de mortalidad por país y año.
- **Bioinformática genética** (GWAS: Genome-Wide Association Studies).
- **Datos de biomonitorización** (concentraciones de metales en sangre/orina).
- **Interacciones gen-metal** (base de datos CTD: Comparative Toxicogenomics Database).

### Objetivos principales

1. Identificar genes de riesgo para Alzheimer/Parkinson con asociación estadística(p < 1e-6, OR < 0.9 o OR > 1.1).
2. Relacionar estos genes con interacciones documentadas con Pb/Hg (mecanismos de aumento/disminución de expresión).
3. Correlacionar niveles de exposición a metales (biomonitorización por país/año) con tasas de mortalidad por Alzheimer/Parkinson.
4. Generar visualizaciones y reportes reproducibles.



## 📁 Estructura del Repositorio

```
├── README.md                          # Este archivo
├── LICENSE                            # Licencia MIT
├── requirements.txt                   # Dependencias R y Python
├── .gitignore                         # Archivos excluidos del versionado
├── FONDOFUENTES.png                   # Imagen de fondo para el archivo final
├── STYLE.css                          # Hoja de estilos para HTML
├── archivoFinal.rmd                   # Documento principal R Markdown con elanálisis completo
├── biliografia.bib                    # Bibliografía 
│
├── filtradoDatos/                     # Scripts de limpieza y filtrado
│   ├── modificadorGenesAlzheimer.r    # Limpieza genes Alzheimer
│   ├── modificadorGenesParkinson.r    # Limpieza genes Parkinson
│   └── otros scripts de preprocesamiento
│
├── input/                             # Datos de entrada
│   ├── genesAlzheimerFiltrado.csv     # Genes Alzheimer (p<1e-6, OR filtrado)
│   ├── genesParkinsonFiltrado.csv     # Genes Parkinson (p<1e-6, OR filtrado)
│   ├── muertesAlzhimer.csv            # Muertes Alzheimer 
│   ├── muertesParkinson.csv           # Muertes Parkinson 
│   ├── metales_pesados.csv            # Interacciones gen-metal (CTD)
│   ├── biomonitorizacion_filtrada.json # Niveles Pb/Hg por país/año
│   └── [archivos TSV grandes excluidos vía .gitignore]
│
├── results/                           # Resultados generados
│   ├── Analisis_Genes_Metales_Alzheimer_Filtrado.csv
│   ├── Analisis_Genes_Metales_Parkinson_Filtrado.csv
│   ├── muertesAlzheimer_HgPb.csv      # Datos combinados Alzheimer + biomonitorización
│   ├── muertesParkinson_HgPb.csv      # Datos combinados Parkinson + biomonitorización
│   └── [gráficos y tablas generadas]
│
└── Scripts principales (raíz):
    ├── HgPbMuertesAlzheimer.R         # Análisis muertes Alzheimer + metales
    ├── HgPbMuertesParkinson.R         # Análisis muertes Parkinson + metales
    ├── alzheimerMetalesGenes.R        # Cruce genes Alzheimer y interacciones Pb/Hg
    ├── parkinsonMetalesGenes.R        # Cruce genes Parkinson y interacciones Pb/Hg
    ├── reduccionVariantes.R           # Aplicación de filtros estadísticos rigurosos
    └── analisis_metales.R             # Análisis exploratorio
```


## 🛠️ Requisitos y Dependencias

### Software necesario

- **R** >= 4.3.0 ([Descargar](https://www.r-project.org/))
- **Python** >= 3.8 (opcional, para scripts auxiliares)
- **Git** ([Descargar](https://git-scm.com/))

### Librerías R (ver [`requirements.txt`](requirements.txt))

```r
# Manipulación de datos
tidyverse, dplyr, tidyr, readr, tibble, purrr, stringr, forcats, lubridate

# Datos estructurados (JSON)
jsonlite, tidyjson, rjson

# Limpieza y normalización
janitor, countrycode

# Importación de formatos
readxl

# Análisis estadístico
broom

# Visualización
ggplot2, ggrepel

# Optimización
lobstr

# Generación de reportes
rmarkdown, knitr
```

**Instalación rápida (R):**

```r
install.packages(c(
  "tidyverse", "jsonlite", "tidyjson", "rjson", "janitor", "countrycode",
  "readxl", "broom", "ggrepel", "lobstr", "rmarkdown", "knitr"
))
```

### Librerías Python

```bash
pip install pandas numpy matplotlib seaborn
```
## 🚀 Instalación

### 1. Clonar el repositorio

```bash
git clone https://github.com/ruben-m-o6/exposici-n-a-metales-pesados-y-su-asociaci-n-con-Alzheimer-y-Parkinson.git
cd exposici-n-a-metales-pesados-y-su-asociaci-n-con-Alzheimer-y-Parkinson
```

### 2. Instalar dependencias R

Abre RStudio y ejecuta:

```r
install.packages(c("tidyverse","jsonlite","tidyjson","janitor","countrycode","readxl","broom","ggrepel","lobstr","rmarkdown","knitr"))
```

### 3. Verificar estructura de carpetas

```bash
mkdir -p input results filtradoDatos
```

### 4. Descargar datasets (si no están incluidos)

Los archivos grandes (`.tsv`) están excluidos de Git. Descárgalos desde:

- **CTD (Comparative Toxicogenomics Database):** [https://ctdbase.org/](https://ctdbase.org/)
  - `CTD_chem_gene_ixns.tsv` (interacciones químico-gen)
  - Filtrar por `Organism == "Homo sapiens"` y guardar como `metales_pesados.csv` en `input/`

- **GWAS Catalog:** [https://www.ebi.ac.uk/gwas/](https://www.ebi.ac.uk/gwas/)
  - Descargar variantes asociadas a "Alzheimer's disease" y "Parkinson's disease"
  - Filtrar y limpiar con scripts en `filtradoDatos/`

- **GBD Institute (mortalidad):** [https://vizhub.healthdata.org/gbd-results/](https://vizhub.healthdata.org/gbd-results/)
  - Descargar muertes por Alzheimer/Parkinson (formato CSV)
  - Guardar como `muertesAlzhimer.csv` y `muertesParkinson.csv` en `input/`

- **HBM4EU (biomonitorización):** [https://www.hbm4eu.eu/](https://www.hbm4eu.eu/)
  - Datos de Pb/Hg en sangre/orina por país/año
  - aplicar el archivo filtra_exporta_json.py
  - Guardar en `input/`


## 🔄 Flujo de Trabajo

### Paso 0: Preparación de datos de biomonitorización 

```bash
# Ejecutar desde la carpeta filtradoDatos/
cd filtradoDatos
python filtra_exporta_json.py
```

Entrada: `datos/boxplot - overview (2).csv` (datos HBM4EU)  
Salida: `input/biomonitorizacion_filtrada.json` 


### Paso 1: Limpieza de datos genéticos y de compuestos (R)

```r
source("filtradoDatos/modificadorGenesAlzheimer.r")
source("filtradoDatos/modificadorGenesParkinson.r")
```

Entrada:
- `datos/genesAlzheimer.tsv` (GWAS Catalog)
- `datos/genesParkinson.tsv` (GWAS Catalog)

Salida:
- `input/genesAlzheimerFiltrado.csv` (sin 2 últimas columnas, limpio)
- `input/genesParkinsonFiltrado.csv` (sin 2 últimas columnas, limpio)

Qué hace:
- Elimina las 2 últimas columnas innecesarias del TSV.
- Convierte de formato TSV a CSV.
- Limpia espacios en blanco al inicio/fin de las celdas.

```r
source("filtradoDatos\filtradoCTD.r")
source("filtradoDatos\filtradoHumanosPlomo_Mercurio.r")
```
Entrada:
   primero:
   - `input\CTD_chem_gene_ixns (1).tsv` 
   segundo
   - `input\CTD_humanos_filtrado.tsv` 
   - 
Salida:
   primero:
   - `input\CTD_humanos_filtrado.tsv` 
   segundo:
   - `input\metales_pesados.csv` 

Qué hace:
   Reduce la densidad de informacion del archivo original para facilitar el manejo posterior de datos

### Paso 2: Cruce genes Y interacciones con metales (R)

```r
source("alzheimerMetalesGenes.R")
source("parkinsonMetalesGenes.R")
```

#### 2.1 Alzheimer

Entrada:
- `input/genesAlzheimerFiltrado.csv`
- `input/metales_pesados.csv` 

Salida:
   primero:
   - `results\AlzheimerMetalesFiltro.csv` (aplico otro filtrado con `filtradoDatos\reduccionVariantes.R`)
   segundo:
   - `results\Analisis_Genes_Metales_Alzheimer_SoloOdds.csv`

Qué hace:
- Aplica filtros de fiabilidad estadística:
  - `pValue < 1e-6` (asociación robusta)
  - `orValue < 0.9 o orValue > 1.1` (efecto biológico relevante)
- Separa genes múltiples 
- Filtra interacciones CTD: solo Plomo/Mercurio (`lead|mercury|mercuric`).
- Filtra mecanismos claros: solo `increases` o `decreases` (no "affects" ambiguo).
- Inner join por `mappedGenes = GeneSymbol`.
- Resultado: genes de Alzheimer con evidencia sólida que tienen interacciones documentadas con Pb/Hg.

Columnas finales:
- `mappedGenes`, `riskAllele`, `traitName`, `pValue`, `orValue`, `beta` (datos genéticos)
- `ChemicalName`, `Interaction`, `InteractionActions` (datos CTD)

#### 2.2 Parkinson

Entrada:
- `input/genesParkinsonFiltrado.csv`
- `input/metales_pesados.csv`

Salida:
   primero:
   - `results/ParkinsonMetalesFiltro.csv` (aplico otro filtrado con `filtradoDatos\reduccionVariantes.R`)
   segundo
   - `results\Analisis_Genes_Metales_Parkinson_SoloOdds.csv`

Qué hace:
- Idéntico al flujo de Alzheimer, pero con genes de Parkinson.



### Paso 3: Análisis mortalidad + biomonitorización (R)

```r
# Ejecutar en orden
source("HgPbMuertesAlzheimer.R")
source("HgPbMuertesParkinson.R")
```

#### 3.1 Alzheimer

Entrada:
- `input/muertesAlzhimer.csv` (GBD Institute: muertes por país/año)
- `input/biomonitorizacion_filtrada.json` (niveles Pb/Hg por país/año)

Salida:
- `results/muertesAlzheimer_HgPb.csv`


#### 3.2 Parkinson

Entrada:
- `input/muertesParkinson.csv`
- `input/biomonitorizacion_filtrada.json`

Salida:
- `results/muertesParkinson_HgPb.csv`



### Paso 4: Generación del reporte final (R Markdown)

```r
rmarkdown::render("archivoFinal.rmd")
```

Entrada:
- Todos los CSVs generados en `results/`: (exceptuando `results\AlzheimerMetalesFiltro.csv` y `results\ParkinsonMetalesFiltro.csv`)
- Archivos de configuración:
  - `STYLE.css` (estilos HTML)
  - `FONDOFUENTES.png` (imagen de fondo)
  - `biliografia.bib` (bibliografía BibTeX)

Salida:
- `archivoFinal.html` 

Qué hace:
- Carga todos los datasets procesados.
- Genera visualizaciones:
  - **Scatterplots:** muertes vs. niveles Pb/Hg.
  - **Heatmaps:** interacciones gen-metal.
  - **Series temporales:** evolución de muertes y exposición por país.
  - **Tablas dinámicas:** top genes de riesgo con interacciones claras.
- Aplica modelos estadísticos:
  - Correlaciones Pearson/Spearman.
  - Regresiones lineales (`lm()`).
  - Tests de significancia.
- Integra texto narrativo, figuras y bibliografía.
- Exporta a HTML con tabla de contenidos interactiva.

## 🧪 Metodología

### 1. Filtros de fiabilidad genética

- **p-valor < 1e-6:** Solo asociaciones estadísticamente robustas (estándar GWAS exploratorio).
- **OR < 0.9 o OR > 1.1:** Efecto biológico relevante (protector o de riesgo claro).
- **Mecanismos claros:** Solo interacciones gen-metal con `increases` o `decreases` en expresión/actividad.

### 2. Normalización de datos

- **Países:** Uso de `countrycode` para estandarizar nombres.
- **Años:** Rango común 2010-2020 (según disponibilidad de biomonitorización).
- **Metales:** Filtrado específico de compuestos de Pb y Hg (lead, mercury, mercuric).

### 3. Cruce de datos

- **Inner join** por `gene_symbol` (genes) y `GeneSymbol` (CTD).
- **Inner join** por `country` + `year` (biomonitorización y mortalidad).

### 4. Análisis estadístico

- Correlaciones Pearson/Spearman (niveles Pb/Hg vs. muertes).
- Modelos lineales (`lm()`) para cuantificar asociaciones.
- Visualización con `ggplot2` (scatterplots, heatmaps, series temporales).



## 📈 Resultados Esperados

### Archivos generados en `results/`

1. **Analisis_Genes_Metales_Alzheimer_Filtrado.csv**
   - Genes de Alzheimer con interacciones Pb/Hg confirmadas.
   - Columnas: `mappedGenes`, `pValue`, `orValue`, `ChemicalName`, `InteractionActions`.

2. **Analisis_Genes_Metales_Parkinson_Filtrado.csv**
   - Equivalente para Parkinson.

3. **muertesAlzheimer_HgPb.csv** / **muertesParkinson_HgPb.csv**
   - Datos combinados: país, año, muertes, niveles Pb/Hg.

4. **Gráficos** (generados en `.rmd`):
   - Correlaciones muertes vs. exposición.
   - Heatmaps de interacciones gen-metal.
   - Series temporales por país.


## 📜 Licencia

Este proyecto está bajo la licencia **MIT**. Ver archivo [`LICENSE`](LICENSE) para más detalles.


## 📧 Contacto

- **Autor:** Rubén M. ([@ruben-m-o6](https://github.com/ruben-m-o6))
- **Autor:** Álvaro C. ([@Acp1038])
- **Autor:** Adrian O  ([(AdriiannOrive]).
