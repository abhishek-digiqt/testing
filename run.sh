sudo docker run -d -p 4044:4044 --name newman-script --restart=on-failure:5 --network=host --hostname 0.0.0.0 newman-script
