#!/bin/sh
echo clear
sudo rm -rf *
sudo docker exec -i javadocker /bin/sh -c "rm -rf /var/test_directory"
sudo docker stop javadocker
sudo docker rm javadocker
