<html>
    <head>
        <meta charset="UTF-8">
        <title>Ejercicio 2.2</title>
        <style>
            table{
                border-collapse: collapse;
                border: none;
            }
        </style>
    </head>
    <body>
        <h2>Introduzca su sexo</h2>
        <form action="ejercicio2.2.php" method="post">
            <table>
                <tr>
                    <td>Hombre</td>
                    <td>
                        <input type="radio" name="sexo" value="H" />
                    </td>
                </tr>
                <tr>
                    <td>Mujer</td>
                    <td>
                        <input type="radio" name="sexo" value="M" />
                    </td>
                </tr>
            </table>
            <input type="submit" name="submit" value="Enviar" />
        </form>
    </body>
</html>