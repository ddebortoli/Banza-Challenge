from pydantic import BaseModel
from typing import Optional

class Categoria(BaseModel):
    id: Optional[int]
    nombre: str