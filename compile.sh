#!/bin/sh
echo "dads"
echo "${user_answer_code}" > demo${sourcePostfix}
sudo docker cp demo${sourcePostfix} $language:/var/test_directory/demo${sourcePostfix}
STARTTIME=`date +%s%N`
sudo docker exec -i $language sh -c "cd /var/test_directory && ${compile} demo${sourcePostfix}" 1>compile-success 2>compile-error
ENDTIME=`date +%s%N`
COSTTIME=`expr $ENDTIME - $STARTTIME`
echo "编译时间:$COSTTIME" > result
exit 0
