import pandas as pd
import json

csv_file = r"C:\Users\moren\OneDrive\Escritorio\fuentes\exposici-n-a-metales-pesados-y-su-asociaci-n-con-Alzheimer-y-Parkinson\datos\boxplot - overview (2).csv"
df = pd.read_csv(csv_file, sep='\t', encoding='utf-16')

df_filtrado = df[
    (df["Filter population or agecat title"] == "POPULATION") &
    (df["Matrix_detail"].str.contains("Blood Whole Blood|Blood Serum", na=False)) &
    (df["Statistics"].isin(["P05", "P10", "P25", "P50", "P75", "P90", "P95"]))
]

final = []
for _, row in df_filtrado.iterrows():
    try:
        final.append({
            "country": row["Country"],
            "year": int(str(row["EndYear"]).split("-")[0]),
            "metal": str(row["Biomarker"]).split()[0],
            "matrix": row["Matrix_detail"],
            "unit": row["Unit with µ"],
            "population": row["Filter population or agecat title"],
            "n": int(str(row["N"]).replace(',', '')),
            "source": row["Metadata.IPCHEM"],
            "percentile": row["Statistics"],
            "value": float(row["value.for.tooltip"])
        })
    except Exception as e:
        print(f"Fila ignorada por error: {e}")

with open("biomonitorizacion_filtrada.json", "w", encoding='utf-8') as f:
    json.dump(final, f, indent=2, ensure_ascii=False)

print(f"Exportados {len(final)} registros a biomonitorizacion_filtrada.json")