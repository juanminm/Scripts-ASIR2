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
            
            div#error{
                color: red;
            }
        </style>
    </head>
    <body>
        <?php 
            function isNumeric($feet, $inches){
                global $error;
                if(!is_numeric($feet)){
                    $error="El valor de los pies no es un número.";
                    return false;
                } elseif (!is_numeric($inches)){
                    $error="El valor de las pulgadas no es un número.";
                    return false;
                } else {
                    return true;
                }
            }
            if(isset($_REQUEST["submit"])){
                if(isset($_REQUEST["feet"]) && isset($_REQUEST["inches"])){
                    $feet=$_REQUEST["feet"];
                    $inches=$_REQUEST["inches"];
                    
                    if(isNumeric($feet, $inches)){
                        $centimetres=($inches+($feet*12))*2.54;
                    }
                }
            }   
         ?>
        <h2>Conversión de pies y pulgadas a metros</h2>
        <form action="ejercicio2.3.php" method="post">
            <table>
                <tr>
                    <td>Pies</td>
                    <td>
                        <input type="text" name="feet" value="0.0" />
                    </td>
                </tr>
                <tr>
                    <td>Pulgadas</td>
                    <td>
                        <input type="text" name="inches" value="0.0" />
                    </td>
                </tr>
                <tr>
                    <td><strong>Centimetros</strong></td>
                    <td>
                        <input type="text" name="metres" readonly="readonly" value="<?php if(isset($centimetres)){ echo $centimetres; } else { echo "0.0"; } ?>" />
                    </td>
                </tr>
            </table>
            <input type="submit" name="submit" value="Enviar" />
        </form>
        <div id="error">
            <?php
                if(isset($error)){
                     print $error;
                 }
            ?>
        </div>
    </body>
</html>
