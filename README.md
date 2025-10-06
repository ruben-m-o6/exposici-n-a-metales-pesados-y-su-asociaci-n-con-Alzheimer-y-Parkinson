# Seminario: Exposición a Plomo y Mercurio y Riesgo Genético en Alzheimer y Parkinson (Europa)

Autores: (RELLENAR)
Curso: (RELLENAR)
Fecha: (se actualizará automáticamente en el RMarkdown)

## Descripción
Este repositorio contiene el seminario orientado a Europa que integra datos reales: variantes y genes de riesgo para Alzheimer y Parkinson (GWAS Catalog, p<5e-8), evidencia de interacción químico–gen (CTD) con plomo y mercurio, y biomonitorización de plomo y mercurio en sangre en adultos de seis países europeos (España, Alemania, Francia, Bélgica, Italia y Finlandia) a partir de 2009. Además, se construirá un índice ecológico exploratorio de co-ocurrencia entre percentiles altos de exposición y frecuencias alélicas europeas.

## Alcance
- Matriz: sangre exclusivamente.
- Metales: Plomo (Lead) y Mercurio total (en sangre; si algún país solo reporta hair Mercury se documentará pero **no** se incluirá en la tabla principal comparativa).
- Periodo: Estudios/informes ≥ 2009.
- Países: España, Alemania, Francia, Bélgica, Italia, Finlandia.
- Genes/variantes: Se incluirá el conjunto amplio de loci con significancia genome-wide (p<5×10⁻⁸) extraídos de GWAS Catalog para Alzheimer y Parkinson (no solo los clásicos), y se priorizarán subconjuntos para análisis descriptivo.

## Objetivo General
Evaluar integrativamente la convergencia entre variantes de riesgo genético para Alzheimer y Parkinson, la evidencia de interacción biológica con plomo y mercurio y los niveles de biomonitorización de estos metales en sangre en poblaciones adultas de seis países europeos, construyendo un índice ecológico exploratorio de co-ocurrencia exposición–frecuencia alélica.

## Objetivos Específicos
1. Compilar variantes y genes de riesgo (p < 5×10⁻⁸) para Alzheimer y Parkinson en población europea (GWAS Catalog, filtrando por significancia y anotando descripción de muestra).
2. Identificar genes de riesgo con interacciones anotadas con plomo o mercurio en CTD, clasificando tipo de evidencia (experimental vs inferred) y PMIDs asociados.
3. Describir comparativamente percentiles (P50, P90 y P75 si está disponible) de plomo y mercurio en sangre en adultos (≥18 años, o el grupo etario más representativo disponible) en España, Alemania, Francia, Bélgica, Italia y Finlandia (≥2009) documentando fuente, año(s) de muestreo, matriz, método y LOD.
4. Construir un índice ecológico exploratorio combinando percentiles altos de exposición (P90 escalado) y frecuencias alélicas europeas de variantes clave, discutiendo las limitaciones (heterogeneidad, falacia ecológica, diferencias de subpoblaciones genéticas, métodos analíticos).

## Estructura del Repositorio
```
/ (raíz)
├─ README.md
├─ .gitignore
├─ seminar_Europa.Rmd
├─ scripts/
│  ├─ install_packages.R
│  ├─ download_gwas_ctd.R
├─ data/
│  ├─ raw/
│  │  ├─ README_data_sources.txt
│  │  ├─ biomonitoring_extraction_template.csv
│  │  ├─ allele_frequencies_europe.csv
│  ├─ processed/ (se generará tras limpiar datos)
├─ figures/ (salida generada por el RMarkdown)
├─ output/
│  ├─ tables/ (tablas finales)
│  ├─ logs/
└─ renv/ (opcional si se activa reproducibilidad con renv)
```

## Reproducibilidad
1. Instalar paquetes: `source("scripts/install_packages.R")`
2. Descargar y procesar GWAS y CTD: `source("scripts/download_gwas_ctd.R")`
3. Completar manualmente `data/raw/biomonitoring_extraction_template.csv` con percentiles reales y citaciones.
4. Rellenar frecuencias alélicas reales en `data/raw/allele_frequencies_europe.csv`.
5. Renderizar: `rmarkdown::render("seminar_Europa.Rmd").`

## Notas sobre Datos
- GWAS Catalog y CTD se descargan automáticamente (fecha de acceso quedará registrada en el script). 
- Los datos de biomonitorización se extraen manualmente de informes PDF (citando página). 
- Las frecuencias alélicas provienen de gnomAD (Non-Finnish European, Finnish) y 1000 Genomes (IBS, TSI, CEU, GBR, FIN) según disponibilidad.

## Limitaciones
- Heterogeneidad temporal y metodológica entre estudios nacionales.
- Falta de microdatos combinando simultáneamente genotipo y exposición.
- Posible falta de comparabilidad en mercurio si algunos países solo reportan hair vs blood.
- El índice ecológico no representa riesgo individual ni modela interacciones gen-ambiente reales; es solo una visualización exploratoria.

## Próximos Pasos
1. Completar plantillas con datos reales.
2. Ejecutar scripts de descarga.
3. Generar tablas de intersección gene–metal.
4. Calcular índice ecológico.
5. Redactar introducción final y discusión.

## Licencia
Se recomienda liberar el código bajo MIT y el texto bajo CC-BY 4.0 (añadir LICENSE si se desea).

## Referencias (ejemplos preliminares)
- Kunkle et al. (2019) Nature Genetics.
- Nalls et al. (2019) Nature Genetics.
- CTD (http://ctdbase.org/).
- gnomAD Consortium.
- 1000 Genomes Project Consortium.
- Informes HBM4EU / GerES V / ESTEBAN / FLEHS / BIOAMBIENT.ES (citas completas se añadirán en el RMarkdown).