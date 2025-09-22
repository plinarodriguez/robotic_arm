import sqlite3
import pandas as pd

conn = sqlite3.connect("protocol0e_filler_suction/web_point (1).db")
df = pd.read_sql_query("SELECT * FROM points", conn)
conn.close()

df.to_csv('protocol0e_filler_suction_points.dat', index=False)
