import sqlite3
import pandas as pd

conn = sqlite3.connect("../protocol_2/program_workflow_rows3bottles/FINAL/web_point (1).db")
df = pd.read_sql_query("SELECT * FROM points", conn)
conn.close()

df.to_csv('protocol_2.dat', index=False)

print(df['name'])

keep = ['ptBottleAboveFinal_bottle1','ptBottle1','boxbottle_pt3NEW_Final','bottlepickUpBOX_pt4NEW_Final','ptBottleAboveFinal_bottle2','ptBottle2','ptBottleAboveFinal_bottle3','ptBottle3','pHome']

df = df[df['name'].isin(keep)]
df_sorted = df.sort_values('name')
df_sorted.to_csv('tray_points3_position.dat', index=False)

### This is data from the last working new finger protocol with a single bottle on the wood table slab. Not the tray and only 1 bottle!!!! 

conn = sqlite3.connect("protocol0e_filler_suction_newFingers/web_point (1).db")
df = pd.read_sql_query("SELECT * FROM points", conn)
conn.close()

df.to_csv('protocol_0e_newFingers.dat', index=False)
