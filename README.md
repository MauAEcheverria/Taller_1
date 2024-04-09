## Definición de las tablas:

- Tabla 1: Tabla de Clientes
- Tabla 2: Tabla de Servicios
- Tabla 3: Tabla de Empleados
- Tabla 4: Tabla de Trabajos

## Tener en cuenta al momento de realizar las consultas:

Endpoints por clase:

Clients:
```
➡️ GET

➡️ POST

➡️ PUT

➡️ DELETE
```

Empleados:
```
➡️ GET

➡️ POST

➡️ PUT

➡️ DELETE
```

Trabajo:
```
➡️ GET

➡️ POST

➡️ PUT

➡️ DELETE
```

Servicios:
```
➡️ GET: Se tiene que agregar el queryParam **consultar_servicio**

    - consultar_servicio=consultaGeneral ➡️ define la consulta general de los datos. Para tomar servicio en específico se pone la entrada JSON "idservicio"

    - consultar_servicio=consultaDetallada ➡️ define los datos específicos tomados en el punto 3.2. Se pone una entrada JSON "idservicio"

    - consultar_servicio=detallesEmpleado ➡️ Consulta los datos de servicio donde esté incluido el id del empleado seleccionado (Punto 3.3). Se pone una entrada JSON "idempleado".

➡️ POST

➡️ PUT

➡️ DELETE
```