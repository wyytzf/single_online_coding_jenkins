#!/bin/sh

echo $user_answer_code >> demo.java
sudo docker cp demo.java javadocker:/var/test_directory/demo.java
sudo docker exec -i javadocker sh -c "cd /var/test_directory && javac -d demo.java"
