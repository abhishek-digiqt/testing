sudo docker run -p 4044:4044 -d --name newman-script --restart=on-failure:5 --network=host newman-script
