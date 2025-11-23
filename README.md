# Asociación de la exposición a metales pesados (plomo y mercurio) con variantes genéticas de riesgo para Alzheimer y Parkinson

Este repositorio contiene los scripts, análisis y documentación correspondientes al estudio sobre la relación entre la exposición ambiental a metales pesados (plomo y mercurio) y variantes genéticas vinculadas al riesgo de desarrollar Alzheimer y Parkinson.

## Descripción general

El estudio investiga cómo la exposición a plomo y mercurio puede potenciar el riesgo genético de padecer enfermedades neurodegenerativas. El trabajo combina análisis estadísticos, bioinformática y visualización de datos utilizando principalmente R y algo de Python, con soporte visual en CSS.

---

## Estructura y contenido del repositorio

A continuación, se describe la función principal de cada carpeta y archivo relevante:

### Archivos principales

- [README.md](https://github.com/ruben-m-o6/exposici-n-a-metales-pesados-y-su-asociaci-n-con-Alzheimer-y-Parkinson/blob/main/README.md): Este archivo de documentación.
- [LICENSE](https://github.com/ruben-m-o6/exposici-n-a-metales-pesados-y-su-asociaci-n-con-Alzheimer-y-Parkinson/blob/main/LICENSE): Licencia del proyecto (MIT).
- [.gitignore](https://github.com/ruben-m-o6/exposici-n-a-metales-pesados-y-su-asociaci-n-con-Alzheimer-y-Parkinson/blob/main/.gitignore): Archivos y carpetas excluidas del control de versiones.
- [FONDOFUENTES.png](https://github.com/ruben-m-o6/exposici-n-a-metales-pesados-y-su-asociaci-n-con-Alzheimer-y-Parkinson/blob/main/FONDOFUENTES.png): Imagen utilizada en reportes y visualización.
- [STYLE.css](https://github.com/ruben-m-o6/exposici-n-a-metales-pesados-y-su-asociaci-n-con-Alzheimer-y-Parkinson/blob/main/STYLE.css): Hoja de estilos para las visualizaciones gráficas y documentos HTML.

### Scripts de Análisis en R

- [HgPbMuertesAlzheimer.R](https://github.com/ruben-m-o6/exposici-n-a-metales-pesados-y-su-asociaci-n-con-Alzheimer-y-Parkinson/blob/main/HgPbMuertesAlzheimer.R): Análisis estadístico de muertes por Alzheimer asociadas a exposición a mercurio y plomo.
- [HgPbMuertesParkinson.R](https://github.com/ruben-m-o6/exposici-n-a-metales-pesados-y-su-asociaci-n-con-Alzheimer-y-Parkinson/blob/main/HgPbMuertesParkinson.R): Análisis estadístico de muertes por Parkinson con exposición a metales.
- [alzheimerMetalesGenes.R](https://github.com/ruben-m-o6/exposici-n-a-metales-pesados-y-su-asociaci-n-con-Alzheimer-y-Parkinson/blob/main/alzheimerMetalesGenes.R): Correlación entre genes de riesgo de Alzheimer y concentración de metales pesados.
- [parkinsonMetalesGenes.R](https://github.com/ruben-m-o6/exposici-n-a-metales-pesados-y-su-asociaci-n-con-Alzheimer-y-Parkinson/blob/main/parkinsonMetalesGenes.R): Correlación entre genes de riesgo de Parkinson y exposición a metales.
- [reduccionVariantes.R](https://github.com/ruben-m-o6/exposici-n-a-metales-pesados-y-su-asociaci-n-con-Alzheimer-y-Parkinson/blob/main/reduccionVariantes.R): Filtrado y reducción de variantes genéticas relevantes.
- [archivoFinal.rmd](https://github.com/ruben-m-o6/exposici-n-a-metales-pesados-y-su-asociaci-n-con-Alzheimer-y-Parkinson/blob/main/archivoFinal.rmd): Documento principal de análisis en formato RMarkdown, donde se presenta el trabajo completo.
- [analisis_metales.R](https://github.com/ruben-m-o6/exposici-n-a-metales-pesados-y-su-asociaci-n-con-Alzheimer-y-Parkinson/blob/main/analisis_metales.R): Script para análisis exploratorio de metales (actualmente vacío).
- [biliografia.bib](https://github.com/ruben-m-o6/exposici-n-a-metales-pesados-y-su-asociaci-n-con-Alzheimer-y-Parkinson/blob/main/biliografia.bib): Bibliografía usada (actualmente vacío).

### Carpetas

- [filtradoDatos/](https://github.com/ruben-m-o6/exposici-n-a-metales-pesados-y-su-asociaci-n-con-Alzheimer-y-Parkinson/tree/main/filtradoDatos): Almacena scripts y recursos para limpieza y filtrado de datos previos al análisis. Aquí se puede encontrar la manipulación y preprocesamiento de las matrices de datos.
- [input/](https://github.com/ruben-m-o6/exposici-n-a-metales-pesados-y-su-asociaci-n-con-Alzheimer-y-Parkinson/tree/main/input): Carpeta destinada a los archivos de entrada de datos, ya sean tablas de genes, variantes, concentraciones ambientales, etc.
- [results/](https://github.com/ruben-m-o6/exposici-n-a-metales-pesados-y-su-asociaci-n-con-Alzheimer-y-Parkinson/tree/main/results): Aquí se guardan los resultados del análisis: gráficos, tablas de resumen y reportes generados.

---

## Flujo de trabajo

1. **Entrada de datos:** Ubica tus archivos en /input según el formato requerido.
2. **Preprocesamiento:** Ejecuta los scripts de /filtradoDatos para limpiar y organizar los datos.
3. **Análisis principal:** Utiliza los scripts en el directorio raíz para realizar el análisis estadístico y genético.
4. **Visualización:** Los resultados pueden consultarse en /results y personalizarse visualmente vía STYLE.css y recursos gráficos.
5. **Reporte:** Elabora el informe final con archivoFinal.rmd combinando datos, gráficos y bibliografía.

---

## Instalación y ejecución

1. Clona el repositorio:
   ```bash
   git clone https://github.com/ruben-m-o6/exposici-n-a-metales-pesados-y-su-asociaci-n-con-Alzheimer-y-Parkinson.git
   ```
2. Instala los paquetes necesarios para R (`tidyverse`, `ggplot2`, `knitr`, etc.) y configura tu entorno según lo indicado en los scripts.
3. Sitúa los datos en /input.
4. Ejecuta los scripts desde RStudio o terminal de R.
5. Revisa los resultados en /results.

---

## Resultados esperados

- Correlaciones gráficas y tabulares entre variantes genéticas y exposición a metales.
- Identificación de grupos de riesgo y posibles factores ambientales agravantes.
- Informes completos listos para publicación o revisión.

---

## Contacto, contribuciones y licencia

- Autor: ruben-m-o6, 
- Licencia: MIT ([LICENSE](https://github.com/ruben-m-o6/exposici-n-a-metales-pesados-y-su-asociaci-n-con-Alzheimer-y-Parkinson/blob/main/LICENSE))
