from fastapi import APIRouter, Response
from pymysql import IntegrityError
from config.db import conn
from sqlalchemy import text
#Modelos
from models.clientes import clientes
from models.categoria_cliente import categorias_clientes
from models.cuenta import cuentas
from models.categoria import categoria

from routes.movimientos import obtenerSaldo
#Esquemas
from schemas.cliente import Cliente
from schemas.categoria_cliente import Categoria_Cliente

import requests

cliente = APIRouter()
#Listar todos los clientes
@cliente.get("/cliente", tags = ['cliente - datos generales'])
def obtener_cliente():
    return conn.execute(clientes.select()).fetchall()

#Registrar un nuevo cliente
@cliente.post("/cliente", tags = ['cliente - datos generales'])
def crear_cliente(cliente: Cliente):
    nuevo_cliente = {"nombre":cliente.nombre}
    resultado = conn.execute(clientes.insert().values(nuevo_cliente))
    return conn.execute(clientes.select().where(clientes.c.id == resultado.lastrowid)).first()

#Editar un cliente
@cliente.put("/cliente/{id}", tags = ['cliente - datos generales'])
def editar_cliente(id: int,cliente: Cliente):
    conn.execute(clientes.update().values(nombre=cliente.nombre).where(clientes.c.id == id))
    return conn.execute(clientes.select().where(clientes.c.id == id)).first()

#Eliminar un cliente
@cliente.delete("/cliente/{id}", tags = ['cliente - datos generales'])
def eliminar_cliente(id: int):
    conn.execute(clientes.delete().where(clientes.c.id == id))
    return {"Status":"Sucessfull","Descripcion":"Usuario eliminado exitosamente!"}

#Asignarle categorias a un cliente
@cliente.post("/asignarCategoria", tags = ['cliente - datos generales'])
def asignar_cliente_a_categoria(categoria: Categoria_Cliente):
    asignar_categoria = {
        "id_cliente":categoria.id_cliente,
        "id_categoria": categoria.id_categoria
        } 
    try:
        conn.execute(categorias_clientes.insert().values(asignar_categoria))
    except:
        return {"Status":"Fallo!","Descripcion":"Este cliente ya tiene cargada esta categoria"}
    
    query = "SELECT * FROM categoria_cliente WHERE id_categoria = %s and id_cliente = %s" % (categoria.id_categoria,categoria.id_cliente)
    conn.execute(text(query))
    
    return {"Status":"Sucessfull","Descripcion":"Ingresado exitosamente"}

#Consultar un cliente, sus cuentas y categorías.
@cliente.get("/cliente/{id}", tags = ['cliente - datos generales'])
def obtener_datos_cliente(id:int):
    cliente = conn.execute(clientes.select().where(clientes.c.id == id)).first()
    cuenta = conn.execute(cuentas.select().where(cuentas.c.id_cliente == id)).fetchall()
    
    categorias = conn.execute(
        text(
            """SELECT * FROM categoria_cliente 
            inner join categoria on categoria_cliente.id_categoria = categoria.id 
            WHERE categoria_cliente.id_cliente = """ + str(id)))
    lista_de_categorias = []
    for row in categorias:
        lista_de_categorias.append(row)
    response = {"datos_cliente":cliente},{"datos_cuenta":cuenta},{"categorias":lista_de_categorias}
    return response

#   Consultar saldo disponible en cada una de sus cuentas. El saldo se construye utilizando los movimientos.
#   La clase Cuenta debe exponer el método get_total_usd que valorice el saldo
#   disponible en dólares utilizando la cotización expuesta en la API de
#   https://www.dolarsi.com/api/api.php?type=valoresprincipales, “Dolar Bolsa" y
#   retorne el valor correspondiente.
@cliente.get("/cliente/{id}/cuentas/", tags = ['cliente - datos generales'])
def obtener_saldos_de_cuentas(id:int):
    cuenta = conn.execute(cuentas.select().where(cuentas.c.id_cliente == id)).fetchall()
    response = []
    cotizacionDolar = obtenerCotizacionUSD()
    for row in cuenta:
        saldo = obtenerSaldo(row[0])[0] or 0
        response.append(
                {
                    "id_cuenta": row[0],
                    "Saldo:":float("{:.2f}".format(saldo)),
                    "Saldo en USD": float("{:.2f}".format(saldo / cotizacionDolar))
                }
            )
    return response
    
def obtenerCotizacionUSD():
    json = requests.get('https://www.dolarsi.com/api/api.php?type=valoresprincipales').json()
    for row in json:
        if(row['casa']['nombre'] == 'Dolar Bolsa'):
            dolar = row['casa']['venta'].replace(',','.')
            return float(dolar)

    
    return 1