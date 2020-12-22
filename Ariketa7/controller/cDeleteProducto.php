<?php

include_once ("../model/productoModel.php");

$data=json_decode(file_get_contents("php://input"),true);

$idProducto=$data['idProducto'];

$producto= new productoModel();
$producto->idProducto=$idProducto;

$response=array();
$response['error']=$producto->delete();

echo json_encode($response);

unset ($producto);
