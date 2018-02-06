#!/bin/bash

docker network create ejercicio1

docker create --name datacontainer -v /data:/var/www/html -v /data:/usr/share/nginx/html busybox



docker run -d -p 8011:80 --network ejercicio1 --volumes-from datacontainer --name nginx nginx


docker run -d -p 8030:80 --network ejercicio1 --volumes-from datacontainer --name apache nerffrenasix/centos-httpd-php
