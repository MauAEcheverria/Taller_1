<?php
   require_once 'Database/Conexion.php';
   class Trabajo {

       public static function getAlLTrabajos() {
           $database = new Connection();
           $query = "SELECT * FROM trabajo";
           $resultado = $database->query($query);
           $datos = [];
           if($resultado->num_rows) {
               while($row = $resultado->fetch_assoc()) {
                   $datos[] = [
                       'idtrabajo' => $row['idtrabajo'],
                       'titulo' => $row['titulo'],
                       'detalles' => $row['detalles'],
                       'tipo_reunion' => $row['tipo_reunion'],
                       'tipo_trabajo' => $row['tipo_trabajo']
                   ];
               }
           }
           return $datos;
       }

       public static function getWhere($id_trabajo) {
           $database = new Connection();
           $query = "SELECT * FROM trabajo WHERE idtrabajo=$id_trabajo";
           $resultado = $database->query($query);
           $datos = [];
           if($resultado->num_rows) {
               while($row = $resultado->fetch_assoc()) {
                   $datos[] = [
                        'idtrabajo' => $row['idtrabajo'],
                        'titulo' => $row['titulo'],
                        'detalles' => $row['detalles'],
                        'tipo_reunion' => $row['tipo_reunion'],
                        'tipo_trabajo' => $row['tipo_trabajo']
                   ];
               }
           }
           return $datos;
       }

       public static function insert($titulo, $detalles, $tipo_reunion, $tipo_trabajo) {
           $database = new Connection();
           $query = "INSERT INTO trabajo (titulo, detalles, tipo_reunion, tipo_trabajo) VALUES('".$titulo."', '".$detalles."', '".$tipo_reunion."', '".$tipo_trabajo."')";
           $database->query($query);
           if($database->affected_rows) {
               return TRUE;
           }
           return FALSE;
       }

       public static function update($id_trabajo, $titulo, $detalles, $tipo_reunion, $tipo_trabajo) {
           $database = new Connection();
           $query = "UPDATE trabajo SET
           titulo='".$titulo."', detalles='".$detalles."', tipo_reunion='".$tipo_reunion."', tipo_trabajo='".$tipo_trabajo.
           "' WHERE idtrabajo=".$id_trabajo;

           $database->query($query);
           if($database->affected_rows) {
               return TRUE;
           }
           return FALSE;
       }

       public static function delete($id_trabajo) {
           $database = new Connection();
           $query = "DELETE FROM trabajo WHERE idtrabajo=$id_trabajo";
           $database->query($query);
           if($database->affected_rows) {
               return TRUE;
           }
           return FALSE;
       }

   }
?>