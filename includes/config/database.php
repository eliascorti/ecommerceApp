<?php

function conectarDB() : mysqli {
    $db = new mysqli('bfsf0irljlmfxx85yhlx-mysql.services.clever-cloud.com', 'udsjeduv4shfiqp8', 'R1d1JFXqxpEv7qM0GT3Q', 'bfsf0irljlmfxx85yhlx');

    if(!$db) {
        echo 'Error no se pudo conectar';
        exit;
    }
    return $db;
}
