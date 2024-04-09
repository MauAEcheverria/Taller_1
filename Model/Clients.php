<?php
    require_once 'Database/Conexion.php';
    class Cliente {

        public static function getAllClients() {
            $database = new Connection();
            $query = "SELECT * FROM clientes";
            $resultado = $database->query($query);
            $datos = [];
            if($resultado->num_rows) {
                while($row = $resultado->fetch_assoc()) {
                    $datos[] = [
                        'idcliente' => $row['idcliente'],
                        'nombres' => $row['nombres'],
                        'apellidos' => $row['apellidos'],
                        'identificacion' => $row['identificacion'],
                        'email' => $row['email'],
                        'telefono' => $row['telefono']
                    ];
                }//end while
                return $datos;
            }//end if
            return $datos;
        }//end getAll

        public static function getWhere($id_cliente) {
            $database = new Connection();
            $query = "SELECT *FROM clientes WHERE idcliente=$id_cliente";
            $resultado = $database->query($query);
            $datos = [];
            if($resultado->num_rows) {
                while($row = $resultado->fetch_assoc()) {
                    $datos[] = [
                        'idcliente' => $row['idcliente'],
                        'nombres' => $row['nombres'],
                        'apellidos' => $row['apellidos'],
                        'identificacion' => $row['identificacion'],
                        'email' => $row['email'],
                        'telefono' => $row['telefono']
                    ];
                }
                return $datos;
            }
            return $datos;
        }

        public static function insert($nombres, $apellidos, $identificacion, $email, $telefono) {
            $database = new Connection();
            $query = "INSERT INTO clientes (nombres, apellidos, identificacion, email, telefono) VALUES('".$nombres."', '".$apellidos."', '".$identificacion."', '".$email."', '".$telefono."')";
            $database->query($query);
            if($database->affected_rows) {
                return TRUE;
            }
            return FALSE;
        }

        public static function update($id_cliente, $nombres, $apellidos, $identificacion, $email, $telefono) {
            $database = new Connection();
            $query = "UPDATE clientes SET
            nombres='".$nombres."', apellidos='".$apellidos."', identificacion='".$identificacion."', email='".$email."', telefono='".$telefono."' 
            WHERE idcliente=$id_cliente";

            $database->query($query);
            if($database->affected_rows) {
                return TRUE;
            }
            return FALSE;
        }

        public static function delete($id_cliente) {
            $database = new Connection();
            $query = "DELETE FROM clientes WHERE idcliente=$id_cliente";
            $database->query($query);
            if($database->affected_rows) {
                return TRUE;
            }
            return FALSE;
        }

    }
?>