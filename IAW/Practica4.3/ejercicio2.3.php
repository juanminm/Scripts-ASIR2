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
                    <td><strong>Metros</strong></td>
                    <td>
                        <input type="text" name="metres" readonly="readonly" value="" />
                    </td>
                </tr>
            </table>
            <input type="sumbit" name="submit" value="Enviar" />
        </form>
    </body>
</html>
