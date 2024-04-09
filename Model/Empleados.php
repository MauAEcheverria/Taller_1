<?php
    require_once 'Database/Conexion.php';
    class Empleado {

        public static function getAllEmpleados() {
            $database = new Connection();
            $query = "SELECT * FROM empleados";
            $resultado = $database->query($query);
            $datos = [];
            if($resultado->num_rows) {
                while($row = $resultado->fetch_assoc()) {
                    $datos[] = [
                        'idempleado' => $row['idempleado'],
                        'nombre' => $row['nombre'],
                        'apellidos' => $row['apellidos'],
                        'identificacion' => $row['identificacion'],
                        'cargo' => $row['cargo'],
                        'telefono' => $row['telefono']
                    ];
                }
            }
            return $datos;
        }

        public static function getWhere($id_empleado) {
            $database = new Connection();
            $query = "SELECT *FROM empleados WHERE idempleado=$id_empleado";
            $resultado = $database->query($query);
            $datos = [];
            if($resultado->num_rows) {
                while($row = $resultado->fetch_assoc()) {
                    $datos[] = [
                        'idempleado' => $row['idempleado'],
                        'nombre' => $row['nombre'],
                        'apellidos' => $row['apellidos'],
                        'identificacion' => $row['identificacion'],
                        'cargo' => $row['cargo'],
                        'telefono' => $row['telefono']
                    ];
                }
            }
            return $datos;
        }

        public static function insert($nombres, $apellidos, $identificacion, $cargo, $telefono) {
            $database = new Connection();
            $query = "INSERT INTO empleados (nombre, apellidos, identificacion, cargo, telefono) VALUES('".$nombres."', '".$apellidos."', '".$identificacion."', '".$cargo."', '".$telefono."')";
            $database->query($query);
            if($database->affected_rows) {
                return TRUE;
            }
            return FALSE;
        }

        public static function update($id_empleado, $nombres, $apellidos, $identificacion, $cargo, $telefono) {
            $database = new Connection();
            $query = "UPDATE empleados SET
            nombre='".$nombres."', apellidos='".$apellidos."', identificacion='".$identificacion."', cargo='".$cargo."', telefono='".$telefono."' 
            WHERE idempleado=$id_empleado";

            $database->query($query);
            if($database->affected_rows) {
                return TRUE;
            }
            return FALSE;
        }

        public static function delete($id_empleado) {
            $database = new Connection();
            $query = "DELETE FROM empleados WHERE idempleado=$id_empleado";
            $database->query($query);
            if($database->affected_rows) {
                return TRUE;
            }
            return FALSE;
        }

    }
?>