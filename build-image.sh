#!/bin/sh
sudo docker run --tty --name $language --detach $image /bin/sh
sudo docker ps -a
sudo docker exec -i $language sh -c "mkdir /var/test_directory/"
# sudo docker cp ./answer testdocker:/var/test_directory
# sudo docker exec -i testdocker /bin/sh -c "ls /var/test_directory"
