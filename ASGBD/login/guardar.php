<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
    </head>
    <body>
        <?php
        require('credentials.php');
        $conexion= new mysqli($dbConn['host'],$dbConn['user'],$dbConn['pass'],$dbConn['database']);

        if($conexion->connect_errno){
            die("Error de conexión: ".$conexion->connect_error);
        }
        
        $conexion->set_charset("utf8");
        
        $nif=$conexion->real_escape_string($_POST["username"]);
        $nombre=$conexion->real_escape_string($_POST["nombre"]);
        $apellido1=$conexion->real_escape_string($_POST["apellido1"]);
        $apellido2=$conexion->real_escape_string($_POST["apellido2"]);
        $username=$conexion->real_escape_string($_POST["username"]);
        $email=$conexion->real_escape_string($_POST["email"]);
        
        $sql = "UPDATE `clientes`"
                . "SET `nif`='".$nif."', "
                . "`nombre`='".$nombre."', "
                . "`apellido1`='".$apellido1."', "
                . "`apellido2`='".$apellido2."', "
                . "`email='".$email."' "
                . "WHERE `username`='".$username."';";
        
        echo $sql;
        
        $conexion->close();
        ?>
    </body>
</html>
