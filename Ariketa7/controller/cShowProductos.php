<?php

include_once '../model/productoModel.php';

$response = array();

$producto = new productoModel();

$response['list']= $producto->setList();
$response['error']='no error';

echo json_encode($response);
unset($response);