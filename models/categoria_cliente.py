from sqlalchemy import Integer, String, Table, Column
from config.db import meta,engine

categorias_clientes = Table("Categoria_Cliente", meta,
    Column("id_categoria", Integer,primary_key=True), 
    Column("id_cliente", Integer,primary_key=True)
    )

meta.create_all(engine)