<?php
    require_once 'Model/Empleados.php';
    $datos = json_decode(file_get_contents('php://input'));
    if ($datos == NULL && $_SERVER['REQUEST_METHOD'] != 'GET') {
        http_response_code(400);
    }
    else {
        header('Content-type:application/json;charset=utf-8');
        switch ($_SERVER['REQUEST_METHOD']) {

            case 'GET':
                if($datos != NULL) { echo json_encode(Empleado::getWhere($datos->idempleado)); }
                else { echo json_encode(Empleado::getAllEmpleados()); }
                break;

            case 'POST':
                if(Empleado::insert($datos->nombre, $datos->apellidos, $datos->identificacion, $datos->cargo, $datos->telefono)) {
                    http_response_code(200);
                }
                else {
                    http_response_code(400);
                }
                break;
    
            case 'PUT':
                    if(Empleado::update($datos->idempleado, $datos->nombre, $datos->apellidos, $datos->identificacion, $datos->cargo, $datos->telefono)) {
                        http_response_code(200);
                    } else { http_response_code(400); }
                break;

            case 'DELETE':
                if(Empleado::delete($datos->idempleado)) { http_response_code(200); }
                else { http_response_code(400); }
                break;
            
            default:
                http_response_code(405);
                break;
        }
    }
?>