<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            if(isset($_REQUEST["nombre"]) && isset($_REQUEST["apellidos"])){
                $nombre=$_REQUEST["nombre"];
                $apellidos=$_REQUEST["apellidos"];  
                print "Se llama <strong>".$nombre." ".$apellidos.".</strong>";
            } else {
                echo "Te falta algun campo";
            }
        ?>
    </body>
</html>
