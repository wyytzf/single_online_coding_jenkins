#!/bin/sh
echo "${test_data}" > test_data.json
echo 1
COUNT=$(cat test_data.json| jq -r ". | length")
#SUCCESS_COUNT=0
STARTTIME=`date +%s%N`
echo 2
for k in $( seq 1 $COUNT );
  do
    echo 4
    idx=`expr $k - 1`
    echo 5
    PARAM=$(cat test_data.json| jq -r ".[$idx].input")
    echo 6
    ACTUAL=$(sudo docker exec -i $language sh -c "cd /var/test_directory && ${execute} demo${executePostfix} $PARAM")
    echo 7
    EXCEPT=$(cat test_data.json| jq -r ".[$idx].expectedOutput")

  #  echo "期望: $EXCEPT" >> result
  #  echo "实际: $ACTUAL" >> result
    if [[ "$ACTUAL" != "$EXCEPT" ]];
    then
        echo -e "期望:\n $EXCEPT" > result
        echo -e "实际:\n $ACTUAL" >> result
        exit 1
        #let "SUCCESS_COUNT += 1"
    fi
done
ENDTIME=`date +%s%N`
COSTTIME=`expr $ENDTIME - $STARTTIME`
#echo "SUCCESS_COUNT:$SUCCESS_COUNT" >> result
#echo "TOTAL_COUNT:$COUNT" >> result
echo "运行时间:$COSTTIME" >> result
