import os
import pandas as pd
from sqlalchemy import create_engine, Column, Table, MetaData, Integer, String, Float, Date, Boolean,text

# Database credentials
db_user = 'postgres'
db_password = 'rw3030'
db_host = 'localhost'
db_port = '5432'
db_name = 'NYU_Hospital'

# Directory containing SAS7BDAT files
data_directory = r"C:\Users\rzwan\OneDrive\Documents\NYU_Hospital_Project\Data"

# Create a connection to the PostgreSQL database
engine = create_engine(f'postgresql://{db_user}:{db_password}@{db_host}:{db_port}/{db_name}')
metadata = MetaData()

# Define a function to map pandas dtypes to SQLAlchemy types
def map_dtype(dtype):
    if pd.api.types.is_integer_dtype(dtype):
        return Integer
    elif pd.api.types.is_float_dtype(dtype):
        return Float
    elif pd.api.types.is_bool_dtype(dtype):
        return Boolean
    elif pd.api.types.is_datetime64_any_dtype(dtype):
        return Date
    elif pd.api.types.is_object_dtype(dtype):
        return String
    else:
        return String  # default to String if unknown type
'''
# Define table relationships based on the provided linking diagram
table_relations = {
    'tx_hr': {
        'PX_ID': ('cand_thor', 'PX_ID'),
        'DONOR_ID': ('donor_deceased', 'DONOR_ID'),
    },
    'stathist_thor': {
        'TX_ID': ('tx_hr', 'TX_ID')
    },
    'statjust_hr1a': {
        'TX_ID': ('tx_hr', 'TX_ID')
    },
    'statjust_hr2a': {
        'TX_ID': ('tx_hr', 'TX_ID')
    },
    'donor_disposition': {
        'DONOR_ID': ('donor_deceased', 'DONOR_ID')
    },
    'immuno': {
        'TRR_ID': ('tx_hr', 'TRR_ID')
    },
    'rec_histo': {
        'TX_ID': ('tx_hr', 'TX_ID')
    },
    'rec_histo_xmat': {
        'TX_ID': ('tx_hr', 'TX_ID')
    },
    'ptr_hr_20210101_20211231_pub': {
        'DONOR_ID': ('tx_hr', 'DONOR_ID')
    },
    'ptr_hr_20220101_20221231_pub': {
        'DONOR_ID': ('tx_hr', 'DONOR_ID')
    },
    'ptr_hr_20230101_20231231_pub': {
        'DONOR_ID': ('tx_hr', 'DONOR_ID')
    },
}
'''
# Step 1: Create all tables without foreign keys
for filename in os.listdir(data_directory):
    if filename.endswith(".sas7bdat"):
        table_name = filename.split('.')[0]
        file_path = os.path.join(data_directory, filename)

        # Read the SAS7BDAT file into a pandas DataFrame
        df = pd.read_sas(file_path)

        # Dynamically create the table schema without foreign keys
        columns = [Column(column_name, map_dtype(dtype)) for column_name, dtype in zip(df.columns, df.dtypes)]

        table = Table(table_name, metadata, *columns)

        # Create the table in the database
        metadata.create_all(engine)

        # Insert the data into the table
        df.to_sql(table_name, engine, if_exists='append', index=False)

        print(f'Table {table_name} created and data inserted successfully.')
'''
# Step 2: Add foreign keys after all tables are created
with engine.connect() as connection:
    for table_name, fk_columns in table_relations.items():
        for fk_column, (ref_table, ref_column) in fk_columns.items():
            try:
                fk_statement = f"""
                    ALTER TABLE "{table_name}"
                    ADD CONSTRAINT "fk_{table_name}_{fk_column}"
                    FOREIGN KEY ("{fk_column}") REFERENCES "{ref_table}"("{ref_column}");
                """
                executable_statement = text(fk_statement)
                connection.execute(executable_statement)
                print(f'Foreign key {fk_column} added to table {table_name}, referencing {ref_table}({ref_column}).')
            except Exception as e:
                print(f'Error adding foreign key {fk_column} to table {table_name}: {e}')

print("All tables created and foreign keys added successfully.")
'''