<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Ejercicio 2.3</title>
        <style>
            table{
                border-collapse: collapse;
                border: none;
            }
        </style>
    </head>
    <body>
        <?php 
            if(isset($_REQUEST["submit"])){
                if(isset($_REQUEST["feet"]) && isset($_REQUEST["inches"])){
                    $feet=$_REQUEST["feet"];
                    $inches=$_REQUEST["inches"];
                    
                    $centimetres=($inches+($feet*12))*2.54;
                } 
            }
         ?>
        <h2>Conversión de pies y pulgadas a metros</h2>
        <form action="ejercicio2.3.php" method="post">
            <table>
                <tr>
                    <td>Pies</td>
                    <td>
                        <input type="text" name="feet" />
                    </td>
                </tr>
                <tr>
                    <td>Pulgadas</td>
                    <td>
                        <input type="text" name="inches" />
                    </td>
                </tr>
                <tr>
                    <td><strong>Centimetros</strong></td>
                    <td>
                        <input type="text" name="metres" readonly="readonly" value="
                            <?php
                            if(isset($_REQUEST["submit"])){
                                echo $centimetres;
                            }
                            ?>
                        " />
                    </td>
                </tr>
            </table>
            <input type="submit" name="submit" value="Enviar" />
        </form>
    </body>
</html>
