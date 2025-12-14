import sqlite3
import pandas as pd

conn = sqlite3.connect("web_point_row16_bottle86.db")
df = pd.read_sql_query("SELECT * FROM points", conn)
conn.close()

df.to_csv('points_row16_bottle86.db', index=False)

# print(df['name'])

keep = ['b86_calib_filler_under_approach', 'b86_calib_filler_insert', 'b86_calib_filler_edge']

df = df[df['name'].isin(keep)]
df_sorted = df.sort_values('name')
df_sorted.to_csv('b86_filler.dat', index=False)