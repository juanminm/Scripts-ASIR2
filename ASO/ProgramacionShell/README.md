#Scripts de Curso Basico de Programación de Shell

####programa1.sh
```
./programa1.sh ARCHIVO
```
Imprime por pantalla los permisos del archivo.

####programa2.sh
```
./programa2.sh ARCHIVO [, ARCHIVO2 ...]
```
Mostrará los lugares donde se encuentran los nombres de archivo introducidos.

####programa3.sh
```
./programa3.sh DIRECTORIO
```
Mostrará todos los directorios y subdirectorios dentro de DIRECTORIO en formato de pagina.

####seaejec.sh
```
./seaejec.sh ARCHIVO
```
Añadirá el permiso de ejecución para el usuario y grupo al ARCHIVO.

####copiabin.sh
```
./copiabin.sh 
```
Creará un directorio 'bin', si no existe, dentro del home del usuario. Y moverá todos archivos ejecutables dentro del directorio bin. Mostrará por pantalla los archivos movidos y el número de ellos.

####usuarios.sh
```
./usuarios.sh
```
Listará todos los usuarios en una tabla con los campos de nombre de usuario, carpeta personal e interprete.

####grupo1.sh
```
./grupo1.sh
```
Listará todos los grupos, mostrando los campos del nombre, el GID y los usuarios.

####grupo2.sh
```
./grupo2.sh
```
Listará todos los grupos, mostrando los campos del nombre, el GID y los usuarios, ordenados por el campo del GID.

####grupo3.sh
```
./grupo3.sh
```
Ejecutará los scripts anteriores y mostrará el nombre de host y la fecha actual.

####usugrup.sh
```
./usugrup.sh USUARIO
```
Mostrará el nombre completo del usuario, su UID, su grupo principal y sus grupos secundarios, si tiene.

####grupusu.sh
```
./grupusu.sh GRUPO
```
Mostrará el nombre del grupo, su GID y los usuarios que pertenecen al grupo.

####ligass.sh
```
./ligass DIRECTORIO
```
Mostrará una lista con todos los archivos que con enlaces simbólicos dentro de DIRECTORIO.

####ligash.sh
```
./ligash DIRECTORIO
```
Mostrará una lista con todos los archivos que tienen enlaces duros dentro de DIRECTORIO.

####saludo.sh
```
./saludo.sh USUARIO
```
Mostrará un saludo dependiendo de la hora al usuario por su nombre completo.

####total.cinta.sh
```
./total.cinta.sh
```
Para un archivo log que contenga las lineas "Total bytes written BYTES", mostrará el total de datos respaldados en bytes, Mebibytes (MiB) y Gibibytes (GiB)