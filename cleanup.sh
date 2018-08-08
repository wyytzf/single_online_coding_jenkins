#!/bin/sh
echo clear
sudo rm -rf *
sudo docker exec -i $language /bin/sh -c "rm -rf /var/test_directory"
sudo docker stop $language
sudo docker rm $language
