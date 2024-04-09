<?php
    class Connection extends Mysqli {

        function __construct() {
            parent::__construct('localhost', 'root', 'toor', 'trabajophp');
            $this->set_charset('utf8');
            $this->connect_error == NULL ? 'Se realizó la conexión' : die('Error. No se puede conectar a la base de datos.');
        }
    }
?>