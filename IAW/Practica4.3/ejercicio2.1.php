<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            if(isset($_REQUEST["submit"])){
                if(isset($_REQUEST["nombre"]) && isset($_REQUEST["apellidos"])){
                    $nombre=$_REQUEST["nombre"];
                    $apellidos=$_REQUEST["apellidos"];  
                    print "Se llama <strong>".$nombre." ".$apellidos.".</strong>";
                } else {
                    echo "Te falta algun campo";
                }
            } else {
                echo <<<EOF
                    <form action="ejercicio2.1.php" method="post">
                        <table>
                            <tr>
                                <td>Nombre:</td>
                                <td>
                                    <input type="text" name="nombre"/>
                                </td>
                            </tr>
                            <tr>
                                <td>Apellidos:</td>
                                <td>
                                    <input type="text" name="apellidos"/>
                                </td>
                            </tr>
                        </table>
                        <input type="submit" name="submit" value="Enviar">
                    </form>
EOF;
            }
        ?>
    </body>
</html>
