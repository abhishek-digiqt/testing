sudo docker stop $(sudo -S docker ps -q --filter ancestor=newman-script)
sudo docker build . -t newman-script
