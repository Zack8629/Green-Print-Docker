#!/bin/bash

read -p "Enter PORT GreenPrint server: " gp_serv_port

name_img="gp_docker_img"
name_cont="gp_docker_cont"
name_dir="gp_docker"

tar xzf "$name_dir".tgz
cd "$name_dir"

# Команда сборки Docker образа
docker build --build-arg GP_SERV_PORT="$gp_serv_port" -t "$name_img" .

# Команда запуска контейнера
docker run -p 80:80 -p "$gp_serv_port":"$gp_serv_port" --name "$name_cont" --restart always -d "$name_img"

# Команда для подключения к запущенному контейнеру
# docker exec -it "$name_cont" bash

cd ..
rm -r "$name_dir"

echo "!END BUILD_AND_RUN!"
