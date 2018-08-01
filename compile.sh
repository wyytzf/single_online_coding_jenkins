#!/bin/sh

echo $user_answer_code >> demo.java
sudo docker cp demo.java testdocker:/var/test_directory
sudo docker exec -i testdocker sh -c "cd /var/test_directory && javac -d demo.java"
