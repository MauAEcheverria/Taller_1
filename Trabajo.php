<?php
    require_once 'Model/Trabajo.php';

    $datos = json_decode(file_get_contents('php://input'));
    if ($datos == NULL && $_SERVER['REQUEST_METHOD'] != 'GET') {
        http_response_code(400);
    }
    else {
        header('Content-type:application/json;charset=utf-8');
        switch ($_SERVER['REQUEST_METHOD']) {

            case 'GET':
                if($datos != NULL) { echo json_encode(Trabajo::getWhere($datos->idtrabajo)); }
                else { echo json_encode(Trabajo::getAllTrabajos()); }
                break;

            case 'POST':
                if(Trabajo::insert($datos->titulo, $datos->detalles, $datos->tipo_reunion, $datos->tipo_trabajo)) {
                    http_response_code(200);
                }
                else {
                    http_response_code(400);
                }
                break;

            case 'PUT':
                    if(Trabajo::update($datos->idtrabajo, $datos->titulo, $datos->detalles, $datos->tipo_reunion, $datos->tipo_trabajo)) {
                        http_response_code(200);
                    } else { http_response_code(400); }
                break;

            case 'DELETE':
                if(Trabajo::delete($datos->idtrabajo)) { http_response_code(200); }
                else { http_response_code(400); }
                break;
            
            default:
                http_response_code(405);
                break;
        }

    }
?>