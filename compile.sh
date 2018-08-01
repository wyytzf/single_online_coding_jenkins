#!/bin/sh

echo $user_answer_code >> demo.java
sudo docker exec -i javadocker sh -c "mkdir /var/test_directory/"
sudo docker cp demo.java javadocker:/var/test_directory/demo.java
sudo docker exec -i javadocker sh -c "cd /var/test_directory && javac -d demo.java"
