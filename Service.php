<?php

    require_once 'Model/Service.php';

    $datos = json_decode(file_get_contents('php://input'));
    if ($datos == NULL && $_SERVER['REQUEST_METHOD'] != 'GET') {
        http_response_code(400);
    }
    else {
        header('Content-type:application/json;charset=utf-8');
        switch ($_SERVER['REQUEST_METHOD']) {
            case 'GET':
                $accion = $_GET['consultar_servicio'];
                if ($accion == "consultaGeneral"){
                    if($datos != NULL) { echo json_encode(Service::getWhere($datos->idservicio)); }
                    else { echo json_encode(Service::getAllServices()); }
                    break;
                }
                
                if ($accion == "consultaDetallada") {
                    echo json_encode(Service::getDetailsService($datos->idservicio));
                    break;
                }

                if ($accion == "detallesEmpleado") {
                    echo json_encode(Service::getServicesByEmployee($datos->idempleado));
                }
                break;

            case 'POST':
                if(Service::insert($datos->idempleado, $datos->idcliente, $datos->idtrabajo, $datos->dia_contratacion, $datos->dia_finalizacion, $datos->cantidad_pago, $datos->tipo_pago)) {
                    http_response_code(200);
                }
                else {
                    http_response_code(400);
                }
                break;

            case 'PUT':
                    if(Service::update($datos->idservicio, $datos->dia_contratacion, $datos->dia_finalizacion, $datos->cantidad_pago, $datos->tipo_pago)) {
                        http_response_code(200);
                    } else { http_response_code(400); }
                break;

            case 'DELETE':
                if(Service::delete($datos->idservicio)) { http_response_code(200); }
                else { http_response_code(400); }
                break;
            
            default:
                http_response_code(405);
                break;
        }
    }
?>