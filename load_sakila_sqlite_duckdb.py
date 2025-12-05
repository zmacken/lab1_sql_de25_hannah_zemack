#from kokchungs video code along
import dlt
from dlt.sources.sql_database import sql_database
from pathlib import Path

SQLITE_PATH = Path(__file__).parent / "data/sqlite-sakila.db"
DUCKDB_PATH = Path(__file__).parent / "data/sakila.duckdb"

source = sql_database(credentials=f"sqlite:///{SQLITE_PATH}", schema="main")

pipeline = dlt.pipeline(
    pipeline_name="sakila_sqlite_to_duckdb",
    destination=dlt.destinations.duckdb(str(DUCKDB_PATH)),
    dataset_name="staging",
)

load_info = pipeline.run(source, write_disposition="replace")

print(load_info)