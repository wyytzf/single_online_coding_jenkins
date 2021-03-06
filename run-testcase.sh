#!/bin/sh
echo $test_data > test_data.json

COUNT=$(cat test_data.json| jq -r ". | length")
SUCCESS_COUNT=0
STARTTIME=`date +%s%N`
for k in $( seq 1 $COUNT );
  do
    idx=`expr $k - 1`
    PARAM=$(cat test_data.json| jq -r ".[$idx].input")
    ACTUAL=$(sudo docker exec -i javadocker sh -c "cd /var/test_directory && java demo $PARAM")
    EXCEPT=$(cat test_data.json| jq -r ".[$idx].expectedOutput")

    echo "期望: $EXCEPT" >> result
    echo "实际: $ACTUAL" >> result
    if [[ "$ACTUAL" == "$EXCEPT" ]];
    then
        let "SUCCESS_COUNT += 1"
    fi
done
ENDTIME=`date +%s%N`
COSTTIME=`expr $ENDTIME - $STARTTIME`
echo "SUCCESS_COUNT:$SUCCESS_COUNT" >> result
echo "TOTAL_COUNT:$COUNT" >> result
echo "运行时间:$COSTTIME" >> result
