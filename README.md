# DOCKER-practica3-ej1


Script: 

#!/bin/bash


docker network create ejercicio1 /*Aqui creamos una red en la que se conectaran los siguiientes contenedores de docker que vamos a montar (docker ya crea una por defecto pero en este caso la usaremos ara ver como funciona)*/
/*DATACONTAINER*/

docker create --name datacontainer -v /data:/var/www/html -v /data:/usr/share/nginx/html busybox /*Aqui crearemos el datacontainer a artir de una imagen de busybox, con la sentencia -v estamos indicando que directorios del contenedor queremos mapear en nuestra maquiona huesped */


/*NGINX*/
docker run -d -p 8011:80 --network ejercicio1 --volumes-from datacontainer --name nginx nginx/*Aqui crearemos la maquin en modo de ejecucion y mapearemos el puerto 8011 de nuestro huesped con el 80 del contenedor le asignaremos la red que hemos creado al principio y cogeremos los volumenes creados en el datacontainer, finalmente le pondremos el nombre */




/*APACHE*/

docker run -d -p 8030:80 --network ejercicio1 --volumes-from datacontainer --name apache nerffren/centos-httpd-php/* Aqui crearemos la maquin en modo de ejecucion y mapearemos el puerto 8030 de nuestro huesped con el 80 del contenedor le asignaremos la red que hemos creado al principio y cogeremos los volumenes creados en el datacontainer, finalmente le pondremos el nombre */

