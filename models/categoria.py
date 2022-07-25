from sqlalchemy import Integer, String, Table, Column
from config.db import meta,engine

categoria = Table("Categoria", meta,
    Column("id", Integer, primary_key=True), 
    Column("nombre", String(255))
    )

meta.create_all(engine)