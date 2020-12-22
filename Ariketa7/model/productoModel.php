<?php
include_once ("connect_data.php");

include_once("productoClass.php");


class productoModel extends productoClass {
    
    private $link;
    
    public function OpenConnect(){
        $konDat=new connect_data();
        try
        {
            $this->link=new mysqli($konDat->host,$konDat->userbbdd,$konDat->passbbdd,$konDat->ddbbname);
        }
        catch(Exception $e)
        {
            echo $e->getMessage();
        }
        $this->link->set_charset("utf8");
    }
    
    public function CloseConnect(){
        mysqli_close ($this->link);
    }

    public function setList(){
        $this->OpenConnect();
       
        $sql="call spSelectAll()";
        $result= $this->link->query($sql);
        
        $list=array();
        
        while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
        {
            $nuevo = new productoModel();           
            $nuevo->idProducto=$row['idProducto'];
            $nuevo->nombre=$row['nombre'];
            $nuevo->tipo=$row['tipo'];
            $nuevo->cantidad=$row['cantidad'];
            $nuevo->precio=$row['precio'];
            $nuevo->foto=$row['foto'];

            array_push($list, $nuevo);
            
        }
        mysqli_free_result($result);
        $this->CloseConnect();
        return $list;
    } 
    
    public function delete(){
    
        $this->OpenConnect();  
    
        $idProducto=$this->getIdProducto();
        $sql="CALL spDeleteProductos($idProducto)";
    
        // var_dump($sql);
         if ($this->link->query($sql))  
        {
            return "borrado.Num de deletes: ".$this->link->affected_rows;
        } else {
            return "Error al borrar";
        }
        $this->CloseConnect();
        
    }

    public function insert(){
     
        $this->OpenConnect();
        $nombre=$this->nombre;
        $tipo=$this->tipo;
        $cantidad=$this->cantidad;
        $precio=$this->precio;
        $foto=$this->foto;
   
        $sql = "CALL spInsertProductos('$nombre', '$tipo', $cantidad, $precio, '$foto')";
        
        if ($this->link->query($sql))
        {
            return true;
        } else {
            return $sql."Error al insertar";
        }
        
        $this->CloseConnect();
    }

}