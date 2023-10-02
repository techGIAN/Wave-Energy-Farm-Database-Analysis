import pandas as pd

df = pd.read_csv('data/WEC_Sydney_49.csv')
columns = list(df.columns)
df.reset_index(inplace=True)
df.columns = ['w_id'] + columns
df.to_csv('data/wec_with_id.csv', index=False)