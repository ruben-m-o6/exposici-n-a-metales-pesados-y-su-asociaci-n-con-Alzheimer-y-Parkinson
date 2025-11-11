# Seminario: Exposición a Plomo y Mercurio y Riesgo Genético en Alzheimer y Parkinson (Europa)

**Autores:** Rubén Moreno Ortega, Adrián Orive Rodríguez, Álvaro Carbonell Pastor 

**Curso:** FUENTES DE DATOS BIOMÉDICAS Y WEB SEMÁNTICA

**Fecha:** (se actualizará automáticamente en el RMarkdown)

## Descripción
Este repositorio contiene el seminario orientado a Europa que integra datos reales sobre variantes y genes de riesgo para Alzheimer y Parkinson (GWAS Catalog), evidencia de interacción químico–gen y biomonitorización en sangre para los metales plomo (Pb) y mercurio (Hg). El objetivo es analizar la convergencia entre exposición ambiental y riesgo genético.

## Alcance
- **Matriz:** sangre exclusivamente.
- **Metales:** Plomo (Lead) y Mercurio total (en sangre).
- **Países:** España, Alemania, Noruega, Bélgica, Eslovenia y República Checa.
- **Genes/variantes:** Loci con significancia genome-wide extraídos de GWAS Catalog para Alzheimer y Parkinson.

## Objetivo General
Evaluar integrativamente la convergencia entre variantes de riesgo genético para Alzheimer y Parkinson, la evidencia de interacción biológica con plomo y mercurio y los niveles de biomonitorización en Europa.

## Objetivos Específicos
1. Compilar variantes y genes de riesgo para Alzheimer y Parkinson en población europea (GWAS Catalog).
2. Identificar genes de riesgo con interacciones anotadas con plomo o mercurio en CTD, clasificando tipo de evidencia y PMIDs asociados.
3. Describir comparativamente percentiles de plomo y mercurio en sangre en adultos en los países seleccionados.
4. Construir un índice ecológico exploratorio combinando percentiles altos de exposición y frecuencias alélicas europeas.

## Estructura del Repositorio

```
/ (raíz)
├─ README.md                # Este documento
├─ LICENSE                  # Licencia MIT del código
├─ .gitignore               # Archivos y carpetas ignoradas (R, datos temporales, etc.)
├─ filtra_exporta_json.py   # Script para filtrar datos de biomonitorización y exportar a JSON
├─ datos/
│  ├─ biomonitorizacion_filtrada.json                # Resultados filtrados de biomonitorización, formato JSON
│  ├─ boxplot - overview (2).csv                    # Fuente principal de biomonitorización (CSV, UTF-16, tabulado)
│  ├─ gwas-association-downloaded_2025-10-06-MONDO_0004975-withChildTraits.tsv  # Variantes GWAS para Alzheimer
│  ├─ gwas-association-downloaded_2025-10-06-MONDO_0005180-withChildTraits.tsv  # Variantes GWAS para Parkinson
│  ├─ ... otros archivos de datos ...
```

## Requisitos y Uso

### Requisitos
- Python 3.x (para filtrar/exportar datos)
- Paquetes Python: `pandas`
- R (para reproducir el análisis y el informe)
- Paquetes R: ver `scripts/install_packages.R` (no incluido en los archivos listados, pero mencionado en el README original)
- Editor compatible con codificación UTF-16 para abrir `.csv` original

### Flujo de trabajo

1. **Filtrado de datos de biomonitorización:**
   - Ejecuta el script Python `filtra_exporta_json.py` para procesar `boxplot - overview (2).csv` y generar `biomonitorizacion_filtrada.json`.
     - Modifica la ruta del CSV en el script si es necesario.
     - El script filtra por población general y matrices de sangre, y exporta percentiles relevantes.

2. **Datos GWAS:**
   - Los archivos `.tsv` en la carpeta `datos/` contienen variantes genéticas asociadas a Alzheimer y Parkinson, descargadas del GWAS Catalog.

3. **Análisis en R:**
   - (Según README original) Instala dependencias en R y ejecuta los scripts de análisis.
   - Renderiza el informe principal (no incluido en los datos mostrados) con:  
     `rmarkdown::render("seminar_Europa.Rmd")`

## Notas sobre Datos

- **biomonitorizacion_filtrada.json:** Contiene percentiles de plomo y mercurio en sangre por país y año, derivados del CSV original.
- **boxplot - overview (2).csv:** Fuente original de biomonitorización, debe abrirse con codificación UTF-16 y separador tabulación.
- **gwas-association-downloaded_2025-10-06-MONDO_0004975-withChildTraits.tsv:** Variantes GWAS para Alzheimer.
- **gwas-association-downloaded_2025-10-06-MONDO_0005180-withChildTraits.tsv:** Variantes GWAS para Parkinson.

## Licencia

El código fuente está bajo licencia MIT (ver archivo LICENSE). Se recomienda liberar el texto bajo CC-BY 4.0.

## Referencias

- GWAS Catalog
- CTD (http://ctdbase.org/)
- gnomAD Consortium
- 1000 Genomes Project Consortium
- Informes HBM4EU / GerES V / ESTEBAN / FLEHS / BIOAMBIENT.ES

---

