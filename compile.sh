#!/bin/sh
echo "${user_answer_code}" > demo
sudo docker exec -i javadocker sh -c "mkdir /var/test_directory/"
sudo docker cp demo javadocker:/var/test_directory/demo
STARTTIME=`date +%s%N`
sudo docker exec -i javadocker sh -c "cd /var/test_directory && javac demo" 1>compile-success 2>compile-error
ENDTIME=`date +%s%N`
COSTTIME=`expr $ENDTIME - $STARTTIME`
echo "编译时间:$COSTTIME" > result
exit 0
