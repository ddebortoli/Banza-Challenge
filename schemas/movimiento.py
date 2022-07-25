from pydantic import BaseModel
from typing import Optional


import datetime
class Movimiento(BaseModel):
    id: Optional[int]
    id_cuenta: int
    tipo: str
    importe: float
    fecha: datetime.date