from fastapi import APIRouter, Response
from config.db import conn
from sqlalchemy import text
#Modelos
from models.clientes import clientes
from models.categoria_cliente import categorias_clientes
from models.cuenta import cuentas
from models.categoria import categoria
from models.movimiento import movimientos

from schemas.movimiento import Movimiento

movimiento = APIRouter()

def obtenerSaldo(id):
    return conn.execute(text("SELECT SUM(importe) FROM movimiento where id_cuenta = "+str(id))).first()

#Registrar un nuevo movimiento
@movimiento.post("/movimiento", tags = ['movimientos'])
def registrar_movimiento(movimiento: Movimiento):
    if movimiento.tipo not in('Ingreso','Egreso'):
        return {"Status":"Error","Descripcion":"Las opciones validas son Ingreso y Egreso"}
    if movimiento.tipo == 'Egreso':
        saldo = float(obtenerSaldo(movimiento.id_cuenta)[0])
        if ( (saldo - movimiento.importe) < 0):
            return {"Status": "Error",
                    "Descripcion:":"No tiene suficiente saldo para realizar la operacion","Saldo":saldo}
            
        movimiento.importe = float(movimiento.importe - (movimiento.importe * 2))
        
    nuevo_movimiento = {
        "id_cuenta":movimiento.id_cuenta,
        "tipo":movimiento.tipo,
        "importe":movimiento.importe,
        "fecha":movimiento.fecha
        }
    resultado = conn.execute(movimientos.insert().values(nuevo_movimiento))
    return conn.execute(movimientos.select().where(movimientos.c.id == resultado.lastrowid)).first()

@movimiento.delete("/movimiento/{id}", tags = ['movimientos'])
def eliminar_movimiento(id:int):
    conn.execute(movimientos.delete().where(movimientos.c.id == id))
    return {"Status":"Exitoso","Descripción":"Eliminado exitosamente!"}

@movimiento.get("/movimiento/{id}", tags = ['movimientos'])
def consultar_movimiento(id:int):
    detalle_movimiento = conn.execute(movimientos.select().where(movimientos.c.id == id)).first() 
    if not detalle_movimiento:
        return {"Status" : "Exitoso", "Descripcion": "No hay resultados."}
    return detalle_movimiento