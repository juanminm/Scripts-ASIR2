<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$conexion= new mysqli("localhost","root","ausias","gestion");

if($conexion->connect_errno){
    die("Error de conexión: ".$conexion->connect_error);
}

$username=$conexion->real_escape_string($_POST["username"]);
$password=$conexion->real_escape_string($_POST["password"]);

$sql = "SELECT * "
        . "FROM `clientes` "
        . "WHERE `username`='$username' "
        . "AND `password`=SHA2('$password',512)";

echo $sql."<br/>";

$resultado=$conexion->query($sql);

if($resultado->num_rows==1){ ?>
<form action="guardar.php" method="post">
    <table>
        <tr>
            <td>Nombre</td>
            <td><input type="text" name="fullname" /></td>
        </tr>
        <tr>
            <td>Edad</td>
            <td><input type="text" name="age"/></td>
        </tr>
        <tr>
            <td>Curso Actual</td>
            <td><input type="text" name="year"/></td>
        </tr>
        <tr>
            <td>Usuario</td>
            <td><input type="text" name="username"/></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" name="submit" value="sumbit"></td>
        </tr>
    </table>
</form>
<?php
} else {
    header("Location: http://172.20.111.3/php/login/valida.html");
    exit();
}
?>