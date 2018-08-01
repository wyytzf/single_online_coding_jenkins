#!/bin/sh
sudo docker run --tty --name testdocker --detach $image
sudo docker ps -a
# sudo docker cp ./answer testdocker:/var/test_directory
# sudo docker exec -i testdocker /bin/sh -c "ls /var/test_directory"
