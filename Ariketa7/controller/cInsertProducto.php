<?php
include_once ("../model/productoModel.php");

$data=json_decode(file_get_contents("php://input"),true);

$nombre=$data['nombre'];
$tipo=$data['tipo'];
$cantidad=$data['cantidad'];
$precio=$data['precio'];
$foto=$data['foto'];

$producto = new productoModel();

$producto->nombre=$nombre;
$producto->tipo=$tipo;
$producto->cantidad=$cantidad;
$producto->precio=$precio;
$producto->foto=$foto;

$response=array();
$response['error']=$producto->insert();

echo json_encode($response);

unset ($producto);