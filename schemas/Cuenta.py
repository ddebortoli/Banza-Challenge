from pydantic import BaseModel
from typing import Optional

class Cuenta(BaseModel):
    id: Optional[int]
    id_cliente: int