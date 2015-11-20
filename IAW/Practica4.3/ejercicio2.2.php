<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Ejercicio 2.2</title>
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
            function whichGender($value){
                global $gender;
                if($value == "H"){
                    $gender="un hombre";
                } else {
                    $gender="una mujer";
                }
            }
            if(isset($_REQUEST["submit"]) && isset($_REQUEST["gender"])){
                $gender=$_REQUEST["gender"];
                    
                whichGender($gender);
                echo "Eres ".$gender.".";
            } else {
        ?>
        <h2>Introduzca su sexo</h2>
        <form action="ejercicio2.2.php" method="post">
            <table>
                <tr>
                    <td>Hombre</td>
                    <td>
                        <input type="radio" name="gender" value="H" />
                    </td>
                </tr>
                <tr>
                    <td>Mujer</td>
                    <td>
                        <input type="radio" name="gender" value="M" />
                    </td>
                </tr>
            </table>
            <input type="submit" name="submit" value="Enviar" />
        </form>
        <?php } ?>
        <div id="error">
            <?php
                if(isset($_REQUEST["submit"]) && !isset($_REQUEST["gender"])){
                    echo "No has seleccionado ninguna opción.";
                }
            ?>
        </div>
    </body>
</html>