import pandas as pd
from sqlalchemy import create_engine
from dotenv import load_dotenv
import os

load_dotenv()

df = pd.read_excel('Adidas Us Sales Datasets.xlsx', header=4)

df = df.drop(columns=['Unnamed: 0'])

print(df.head())
print(df.describe())
print(df.info())

SNOWFLAKE_ACCOUNT = os.getenv('SNOWFLAKE_ACCOUNT')
SNOWFLAKE_USER = os.getenv('SNOWFLAKE_USER')
SNOWFLAKE_PASSWORD = os.getenv('SNOWFLAKE_PASSWORD')
SNOWFLAKE_DATABASE = os.getenv('SNOWFLAKE_DATABASE')
SNOWFLAKE_SCHEMA = os.getenv('SNOWFLAKE_SCHEMA')
SNOWFLAKE_WAREHOUSE = os.getenv('SNOWFLAKE_WAREHOUSE')


snowflake_engine = create_engine(
    f'snowflake://{SNOWFLAKE_USER}:{SNOWFLAKE_PASSWORD}@{SNOWFLAKE_ACCOUNT}/'
    f'{SNOWFLAKE_DATABASE}/{SNOWFLAKE_SCHEMA}?warehouse={SNOWFLAKE_WAREHOUSE}'
)


snowflake_table_name = 'RAW_ADIDAS_SALES'

try:
    df.to_sql(
        name=snowflake_table_name,
        con=snowflake_engine,
        if_exists='replace', 
        index=False       
    )
    print(f"\nData successfully loaded into Snowflake table: {SNOWFLAKE_DATABASE}.{SNOWFLAKE_SCHEMA}.{snowflake_table_name}")
except Exception as e:
    print(f"\nError loading data to Snowflake: {e}")

snowflake_engine.dispose()