<?php

/* Este script contiene el codigo PHP que use para obtener la sintaxis del
 * ejercicio 8 en el script SQL econimia.sql. Esto lo use solo despues de
 * haber añadido los datos manualemnte.
 */

$conexion = new mysqli('localhost', 'montoro', 'ausias', 'economia');

if ($conexion->connect_error) {
    die("Error de conexión: " . $conexion->connect_error);
}

$sql = "SELECT `id` "
        . "FROM `Autonomias`";

$result1 = $conexion->query($sql);

$rows="";
while($fila = $result1->fetch_assoc()){
    foreach ($fila as $row1) {
        $sql2="SELECT `id` "
                . "FROM `Provincias` "
                . "WHERE `autonomia`='$row1';";
        
        $result2=$conexion->query($sql2);
        
        $sql3="UPDATE `Provincias` <br>"
               . "&nbsp&nbsp&nbsp&nbspSET `autonomia`='$row1' <br>"
               . "&nbsp&nbsp&nbsp&nbspWHERE `nombre` IN (";
                
        while($fila2 = $result2->fetch_assoc()){
            foreach($fila2 as $row){
                $sql3.="'".$row."',";
            }
        }
        $sql3 = substr($sql3, 0, strlen($sql3) - 1);
        $sql3.=");";
        echo $sql3," <br><br>";
    }
}

?>
