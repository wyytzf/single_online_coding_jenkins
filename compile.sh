#!/bin/sh

echo $user_answer_code > demo.java
sudo docker exec -i javadocker sh -c "mkdir /var/test_directory/"
sudo docker cp demo.java javadocker:/var/test_directory/demo.java
STARTTIME=`date +%s%N`
sudo docker exec -i javadocker sh -c "cd /var/test_directory && javac -verbose demo.java" 1>result-compile 2>&1
ENDTIME=`date +%s%N`
COSTTIME=`expr $ENDTIME - $STARTTIME`
echo "编译时间:$COSTTIME" >> result
echo "错误测试" > &2
