from pydantic import BaseModel
from typing import Optional

class Categoria_Cliente(BaseModel):
    id_categoria: int
    id_cliente: int