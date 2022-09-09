sudo docker run -d --name newman-script --restart=on-failure:5 --network=host --hostname 0.0.0.0 newman-script
