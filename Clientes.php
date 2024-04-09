<?php
    require_once 'Model/Clients.php';

    $datos = json_decode(file_get_contents('php://input'));
    if ($datos == NULL && $_SERVER['REQUEST_METHOD'] != 'GET') {
        http_response_code(400);
    }
    else {
        header('Content-type:application/json;charset=utf-8');
        switch ($_SERVER['REQUEST_METHOD']) {

            case 'GET':
                if($datos != NULL) { echo json_encode(Cliente::getWhere($datos->idcliente)); }
                else { echo json_encode(Cliente::getAllClients()); }
                break;

            case 'POST':
                if(Cliente::insert($datos->nombres, $datos->apellidos, $datos->identificacion, $datos->email, $datos->telefono)) {
                    http_response_code(200);
                }
                else {
                    http_response_code(400);
                }
                break;
    
            case 'PUT':
                    if(Cliente::update($datos->idcliente, $datos->nombres, $datos->apellidos, $datos->identificacion, $datos->email, $datos->telefono)) {
                        http_response_code(200);
                    } else { http_response_code(400); }
                break;

            case 'DELETE':
                if(Cliente::delete($datos->idcliente)) { http_response_code(200); }
                else { http_response_code(400); }
                break;
            
            default:
                http_response_code(405);
                break;
        }

    }
    
?>