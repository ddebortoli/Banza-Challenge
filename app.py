from fastapi import FastAPI
from routes.cliente import cliente
from routes.movimientos import movimiento
app = FastAPI(
    title="Banza Challange FASTAPI",
    openapi_tags=[{
        "name":"Banza Challenge API",
        "description": "API desarrollada con FASTAPI para desafio técnico Banza"
    }]
)

app.include_router(cliente)
app.include_router(movimiento)