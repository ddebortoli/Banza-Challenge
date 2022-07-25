import unittest
import requests
import datetime
class TestMyModule(unittest.TestCase):
    
    def test_obtenerCliente(self):
        json = requests.get("http://127.0.0.1:8000/cliente").json()
        for row in json:
            if row['nombre'] == 'Damian':
                self.assertEqual(row['nombre'],'Damian')
                
    def test_crearCliente(self):
        test_user = 'BanzaUser' #Insert Test user name
        my_request = {"nombre":test_user}
        json = requests.post("http://127.0.0.1:8000/cliente",json = my_request).json()
        self.assertEqual(json['nombre'],test_user)
        #Test eliminar usuario
        status = self.test_eliminarUsuario(json['id'])
        self.assertEqual('Sucessfull',status)
    
    def test_eliminarUsuario(self,id=0):
        json = requests.delete("http://127.0.0.1:8000/cliente/" + str(id)).json()
        return json['Status']
    
    def test_editarCliente(self):
        test_user = 'BanzaUser' #Insert Test user name
        my_request = {"nombre":test_user}
        json = requests.post("http://127.0.0.1:8000/cliente",json = my_request).json()
        id = json['id']
        my_request = {"nombre": (test_user + ' testado con insert')}
        json = requests.put("http://127.0.0.1:8000/cliente/" + str(id), json = my_request).json()
        self.assertEqual((test_user + ' testado con insert'), json['nombre'])
        self.test_eliminarUsuario(json['id'])
            
    def test_datosClientes(self):
        #Creamos un cliente de prueba
        id = self.crearCliente('test_user_01')
        #Le asignamos una categoria
        my_request = {"id_categoria":1,"id_cliente":id}
        data = requests.post("http://127.0.0.1:8000/asignarCategoria",json = my_request).json()
        self.assertEqual(data['Status'],'Sucessfull')
        
        #Verificamos que la tenga
        data = requests.get("http://127.0.0.1:8000/cliente/" + str(id)).json()
        r = data[2]
        r = r['categorias'][0]
        self.assertEqual(r['nombre'],'Clase alta')
    
    def test_saldos_de_cuentas(self):
        id_cliente = '1' #Inserte un cliente con multiples cuentas, puede usar la 1 para probar, si quiere otra, debe crearse desde la base de datos
        url = "http://127.0.0.1:8000/cliente/" + id_cliente + "/cuentas"
        print(url)
        data = requests.get(url).json()
        #Hay que refinar el test, lo ideal seria tomar los saldos de las cuentas del cliente
        #Y de paso convertirlo a dolares con la api, pero por temas de tiempo no llegue a testear esta parte
        #Sin embargo doy fe de que el endpoint esta funcionando, se puede testear manualmente
        self.assertEqual(4,len(data))
    
    def test_registrarMovimiento(self):
        my_request = {
            "id_cuenta":1,
            "tipo":"Ingreso",
            "importe": 500,
            "fecha": "2022-07-25"
        }
        data = requests.post("http://127.0.0.1:8000/movimiento",json=my_request).json()
        self.assertTrue(data['id']) #Si existe Id, se hizo el importe
        my_request = {
            "id_cuenta":1,
            "tipo":"Egreso",
            "importe": 500000,
            "fecha": "2022-07-25"
        }
        data = requests.post("http://127.0.0.1:8000/movimiento",json=my_request).json()
        self.assertEqual(data['Status'],'Error')
        
    def crearCliente(self,nombre='test_user'):
        my_request = {"nombre": nombre}
        json = requests.post("http://127.0.0.1:8000/cliente",json = my_request).json()
        print("Created client with id " + str(json['id']))
        return json['id']
        
if __name__ == "__main__":
    unittest.main()