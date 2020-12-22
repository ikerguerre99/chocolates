var miApp = angular.module('miApp', []);
miApp.controller('miControlador', ["$scope", "$http", function ($scope, $http) {
  $scope.ver = "si";
  $scope.seccion = "no";
  $scope.contenidoCarro = [];

  $scope.productoNuevo = {
    nombre: "",
    tipo: "",
    cantidad: "",
    precio: "",
    foto: "img/prueba.jpg"
  }

  $http({
    method: 'GET',
    url: 'controller/cShowProductos.php'
  }).then(function successCallback(response) {
    $scope.lista = response.data.list;

  }, function errorCallback(response) {
    alert("mal");
  });

  $scope.deleteProducto = function (idProducto) {
    alerta = confirm("El producto seleccionado se va a eliminar. Quiere realizar esta operación?");
    if (alerta == true) {
      var data = { 'idProducto': idProducto };

      $http({
        method: 'POST',
        url: 'controller/cDeleteProducto.php',
        data: JSON.stringify(data)
      }).then(function successCallback(response) {
        console.log(response.error);
        location.reload();
      }, function errorCallback(response) {
        alert('mal');
      });
    }
  }

  $scope.insertProducto = function () {
    seccion = document.getElementById("seccion");
    $scope.ver = "no";
    $scope.seccion = "si";

  }

  $scope.submitInsert = function () {
    data = { 'nombre': $scope.productoNuevo.nombre, 'tipo': $scope.productoNuevo.tipo, 'cantidad': $scope.productoNuevo.cantidad, 'precio': $scope.productoNuevo.precio, 'foto': $scope.productoNuevo.foto };

    $http({
      method: 'POST',
      url: 'controller/cInsertProducto.php',
      data: JSON.stringify(data)
    }).then(function successCallback(response) {
      console.log(response.error);
    }, function errorCallback(response) {
      alert('mal');
    });
    location.reload()
  }

  $scope.mostrarProductos = function () {
    $scope.ver = "si";
    $scope.seccion = "no";
  }

  $scope.mostrarCarro = function () {
    $scope.carro = "si";
  }
  $scope.esconderCarro = function () {
    $scope.carro = "no";
  }

  $scope.disminuirStock = function (posicion, producto) {
    $scope.encontrado == false;

    if ($scope.lista[posicion].cantidad <= 0) {
      alert("no amigo no se puede");
      return false;
    } else {
    }

    $scope.lista[posicion].cantidad = $scope.lista[posicion].cantidad - 1;

    if ($scope.contenidoCarro.length == 0) {
      $scope.contenidoCarro.push({idProducto: $scope.lista[posicion].idProducto, nombre: $scope.lista[posicion].nombre, tipo: $scope.lista[posicion].tipo, cantidad: $scope.lista[posicion].cantidad, precio: $scope.lista[posicion].precio, unidad: 1 });
    } else {

      for (let i = 0; i < $scope.contenidoCarro.length; i++) {
        if ($scope.lista[posicion].idProducto == $scope.contenidoCarro[i].idProducto) {
          $scope.contenidoCarro[i].unidad = $scope.contenidoCarro[i].unidad + 1;
          $scope.encontrado = true;
        } else{

        }
      }// cierre for

      if($scope.encontrado == false){
        $scope.contenidoCarro.push({idProducto: $scope.lista[posicion].idProducto, nombre: $scope.lista[posicion].nombre, tipo: $scope.lista[posicion].tipo, cantidad: $scope.lista[posicion].cantidad, precio: $scope.lista[posicion].precio, unidad: 1 });
      }else{

      }
      $scope.encontrado = false;
    }

    console.log($scope.contenidoCarro);
  }

  $scope.vaciarCarro = function(){

    $scope.contenidoCarro = [];

  }

  $scope.añadirUnidad = function(){

  }

  $scope.restarUnidad = function(){

  }
}]);