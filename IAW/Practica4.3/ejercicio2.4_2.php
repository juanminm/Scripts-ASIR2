<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
    </head>
    <body>
        <?php
            if(isset($_REQUEST["dividendo"]) && isset($_REQUEST["divisor"])){
                $divid=$_REQUEST["dividendo"];
                $divis=$_REQUEST["divisor"];

                if(is_numeric($divid) && is_numeric($divis)){
                    $divid=$divid-0;
                    $divis=$divis-0;
                    if(is_int($divid) && is_int($divis)){
                        if($divis != 0){
                            $cociente=intval($divid / $divis);
                            $resto=intval($divid % $divis);
                            print "El cociente es ".$cociente."<br>";

                            if ($resto != 0){
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
                    } else {
                        echo "Uno de los valores no es entero.";
                    }
                } else {
                    echo "Uno de los campos no es numérico";
                }
            } else {
                echo "Te falta algun campo";
            }
        ?>
    </body>
</html>
