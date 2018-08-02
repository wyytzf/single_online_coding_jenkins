#!/bin/sh

echo $user_answer_code > demo.java
sudo docker exec -i javadocker sh -c "mkdir /var/test_directory/"
sudo docker cp demo.java javadocker:/var/test_directory/demo.java
STARTTIME=`date +%s%N`
sudo docker exec -i javadocker sh -c "cd /var/test_directory && javac -verbose demo.java" 1>compile-success 2>compile-error
ENDTIME=`date +%s%N`
COSTTIME=`expr $ENDTIME - $STARTTIME`
echo "编译时间:$COSTTIME" >> result
