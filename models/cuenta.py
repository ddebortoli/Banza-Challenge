from sqlalchemy import Integer, String, Table, Column
from config.db import meta,engine

cuentas = Table("Cuentas", meta,
    Column("id", Integer, primary_key=True), 
    Column("id_cliente", String(255))
    )

meta.create_all(engine)