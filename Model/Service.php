<?php
   require_once 'Database/Conexion.php';
   class Service {

        /**
         * MÉTODOS QUE SON EJECUTADOS POR GET.
         */
       public static function getAlLServices() {
           $database = new Connection();
           $query = "SELECT * FROM servicio";
           $resultado = $database->query($query);
           $datos = [];
           if($resultado->num_rows) {
               while($row = $resultado->fetch_assoc()) {
                   $datos[] = [
                    'idservicio' => $row['idservicio'],
                    'idempleado' => $row['idempleado'],
                    'idcliente' => $row['idcliente'],
                    'idtrabajo' => $row['idtrabajo'],
                    'dia_contratacion' => $row['dia_contratacion'],
                    'dia_finalizacion' => $row['dia_finalizacion'],
                    'cantidad_pago' => $row['cantidad_pago'],
                    'tipo_pago' => $row['tipo_pago']
                   ];
               }
           }
           return $datos;
       }

       public static function getWhere($idservicio) {
           $database = new Connection();
           $query = "SELECT * FROM servicio WHERE idservicio=$idservicio";
           $resultado = $database->query($query);
           $datos = [];
           if($resultado->num_rows) {
               while($row = $resultado->fetch_assoc()) {
                   $datos[] = [
                    'idservicio' => $row['idservicio'],
                    'idempleado' => $row['idempleado'],
                    'idcliente' => $row['idcliente'],
                    'idtrabajo' => $row['idtrabajo'],
                    'dia_contratacion' => $row['dia_contratacion'],
                    'dia_finalizacion' => $row['dia_finalizacion'],
                    'cantidad_pago' => $row['cantidad_pago'],
                    'tipo_pago' => $row['tipo_pago']
                   ];
               }
           }
           return $datos;
       }

       public static function getDetailsService($idservicio) {
            $database = new Connection();
            $query = "SELECT 
                            servicio.idservicio,
                            servicio.dia_contratacion,
                            servicio.dia_finalizacion,
                            servicio.cantidad_pago,
                            CONCAT(clientes.nombres, ' ', clientes.apellidos) AS nombre_cliente,
                            clientes.email AS email_cliente,
                            clientes.telefono AS telefono_cliente,
                            CONCAT(empleados.nombre, ' ', empleados.apellidos) AS nombre_empleado,
                            empleados.cargo,
                            trabajo.titulo,
                            trabajo.detalles,
                            trabajo.tipo_trabajo
                        FROM servicio
                        JOIN clientes ON clientes.idcliente = servicio.idcliente
                        JOIN empleados ON empleados.idempleado = servicio.idempleado
                        JOIN trabajo ON trabajo.idtrabajo = servicio.idtrabajo
                        WHERE servicio.idservicio =".$idservicio.";";

            $resultado = $database->query($query);
            $datos = [];
            if($resultado->num_rows) {
                   while($row = $resultado->fetch_assoc()) {
                    $datos[] = [
                        'idservicio' => $row['idservicio'],
                        'dia_contratacion' => $row['dia_contratacion'],
                        'dia_finalizacion' => $row['dia_finalizacion'],
                        'cantidad_pago' => $row['cantidad_pago'],
                        'nombre_cliente' => $row['nombre_cliente'],
                        'email_cliente' => $row['email_cliente'],
                        'telefono_cliente' => $row['telefono_cliente'],
                        'nombre_empleado' => $row['nombre_empleado'],
                        'cargo' => $row['cargo'],
                        'titulo' => $row['titulo'],
                        'detalles' => $row['detalles'],
                        'tipo_trabajo' => $row['tipo_trabajo'],
                        
                    ];
               }
           }
           return $datos;
       }

        public static function getServicesByEmployee($idempleado) {
            $database = new Connection();
            $query = "SELECT 
                            servicio.idservicio,
                            servicio.dia_contratacion,
                            servicio.dia_finalizacion,
                            servicio.cantidad_pago,
                            CONCAT(empleados.nombre, ' ', empleados.apellidos) AS nombre_empleado,
                            empleados.cargo,
                            empleados.telefono
                        FROM servicio
                        JOIN empleados ON empleados.idempleado = servicio.idempleado
                        WHERE empleados.idempleado =".$idempleado.";";

            $resultado = $database->query($query);
            $datos = [];
            if($resultado->num_rows) {
                while($row = $resultado->fetch_assoc()) {
                    $datos[] = [
                        'idservicio' => $row['idservicio'],
                        'dia_contratacion' => $row['dia_contratacion'],
                        'dia_finalizacion' => $row['dia_finalizacion'],
                        'cantidad_pago' => $row['cantidad_pago'],
                        'nombre_empleado' => $row['nombre_empleado'],
                        'cargo' => $row['cargo'],
                        'telefono' => $row['telefono']
                        
                    ];
            }
        }
        return $datos;
        }

       /**
        * MÉTODOS EJECUTADOS POR POST
        */
       public static function insert($idempleado, $idcliente, $idtrabajo, $dia_contratacion, $dia_finalizacion, $cantidad_pago, $tipo_pago) {
           $database = new Connection();
           $query = "INSERT INTO servicio (idempleado, idcliente, idtrabajo, dia_contratacion, dia_finalizacion, cantidad_pago, tipo_pago) VALUES(".$idempleado.", ".$idcliente.", ".$idtrabajo.", '"
           .$dia_contratacion."', '".$dia_finalizacion."', ".$cantidad_pago.",'".$tipo_pago."');";;
           $database->query($query);
           if($database->affected_rows) {
               return TRUE;
           }
           return FALSE;
       }


       /**
        * MÉTODOS EJECUTADOS POR PUT
        */
       public static function update($idservicio, $dia_contratacion, $dia_finalizacion, $cantidad_pago, $tipo_pago) {
           $database = new Connection();
           $query = "UPDATE servicio SET
           dia_contratacion='".$dia_contratacion.
           "', dia_finalizacion='".$dia_finalizacion.
           "', cantidad_pago=".$cantidad_pago.
           ", tipo_pago='".$tipo_pago.
           "' WHERE idservicio=".$idservicio;

           $database->query($query);
           if($database->affected_rows) {
               return TRUE;
           }
           return FALSE;
       }


       /**
        * MÉTODOS EJECUTADOS POR DELETE
        */
       public static function delete($idservicio) {
           $database = new Connection();
           $query = "DELETE FROM servicio WHERE idservicio=$idservicio";
           $database->query($query);
           if($database->affected_rows) {
               return TRUE;
           }
           return FALSE;
       }

   }
?>