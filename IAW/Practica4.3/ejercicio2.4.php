<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            function esentero($numero) {
                if(is_numeric($numero)) {
                    if(floatval($numero)==intval($numero)) {
                        return true;
                    } else {
                        echo "Uno de los valores no es entero.";
                        return false;
                    }
                } else {
                    echo "Uno de los campos no es numérico";
                    return false;
                }
            }

            if(isset($_REQUEST["submit"])){
                if(isset($_REQUEST["dividendo"]) && isset($_REQUEST["divisor"])){
                    $divid=$_REQUEST["dividendo"];
                    $divis=$_REQUEST["divisor"];

                    if(esentero($divid) && esentero($divis)){
                        if($divis != 0){
                            $cociente=intval($divid / $divis);
                            $resto=intval($divid % $divis);
                            print "El cociente es ".$cociente."<br>";
                            if ($resto != 0) {
                                print "El resto es: ".$resto;
                            }
                        } else {
                            echo '<style>'
                            . 'body{'
                                . 'background-color: #36B0D0;'
                                . 'color: white'
                            . '}</style>';
                            echo '<span style="font-size:120%"><span style="font-size:500%;">:(</span> Gracias por destruir el Universo <br></span>';
                        }
                    }
                } else {
                    echo "Te falta algun campo";
                }
            } else {
                echo <<<EOF
<form action="ejercicio2.4.php" method="post">
    Dividendo: <input type="text" name="dividendo"/><br/>
    Divisor: <input type="text" name="divisor"/><br/>
    <input type="submit" name="submit" value="Enviar"/>
<form>
EOF;
            }
        ?>
    </body>
</html>
