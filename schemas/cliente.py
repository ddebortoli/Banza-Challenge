from pydantic import BaseModel
from typing import Optional

class Cliente(BaseModel):
    id: Optional[int]
    nombre: str