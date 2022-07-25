from sqlalchemy import Integer, String, Table, Column,Float,Date
from config.db import meta,engine

movimientos = Table("Movimiento", meta,
    Column("id", Integer, primary_key=True), 
    Column("id_cuenta", Integer),
    Column("tipo", String(255)),
    Column("importe",Float),
    Column("fecha",Date)
    )

meta.create_all(engine)