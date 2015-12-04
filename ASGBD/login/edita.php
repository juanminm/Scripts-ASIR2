<!DOCTYPE html>
<html>
    <head>
        <title>Configuración de usuario</title>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    </head>
    <body>
        <?php
        require('credentials.php');
        $conexion= new mysqli($dbConn['host'],$dbConn['user'],$dbConn['pass'],$dbConn['database']);

        if($conexion->connect_errno){
            die("Error de conexión: ".$conexion->connect_error);
        }

        $conexion->set_charset("utf8");

        $username=$conexion->real_escape_string($_POST["username"]);
        $password=$conexion->real_escape_string($_POST["password"]);

        $sql = "SELECT * "
                . "FROM `clientes` "
                . "WHERE `username`='$username' "
                . "AND `password`=SHA2('$password',512)";

        $resultado=$conexion->query($sql);
        
        $row=$resultado->fetch_assoc();

        if($resultado->num_rows==1){ ?>
        <form action="guardar.php" method="post">
            <table>
                <tr>
                    <td>NIF</td>
                    <td><input type="text" name="nif" value="<?php echo $row["nif"] ?>" /></td>
                </tr>
                <tr>
                    <td>Nombre</td>
                    <td><input type="text" name="nombre" value="<?php echo $row["nombre"] ?>"/></td>
                </tr>
                <tr>
                    <td>Primer apellido</td>
                    <td><input type="text" name="apellido1" value="<?php echo $row["apellido1"] ?>"/></td>
                </tr>
                <tr>
                    <td>Segundo apellido</td>
                    <td><input type="text" name="apellido2" value="<?php echo $row["apellido2"] ?>"/></td>
                </tr>
                <tr>
                    <td>Correo electrónico</td>
                    <td><input type="text" name="email" value="<?php echo $row["email"] ?>"/></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" name="submit" value="Enviar"></td>
                </tr>
            </table>
            <input type="hidden" name="username" value="<?php echo $username ?>"/>
        </form>
        <?php
        } else {
            header("Location: http://172.20.111.3/php/login/valida.html");
            exit();
        }
        ?>
    </body>
</html>
