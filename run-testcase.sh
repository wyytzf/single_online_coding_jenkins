#!/bin/sh
echo $test_data > test_data.json

COUNT=$(cat test_data.json| jq -r ".[] | length")
echo "COUNT: $COUNT"
for k in $( seq 1 $COUNT );
do
  idx=`expr $k-1`
  echo "times:$idx"
  PARAM=$(cat test_data.json| jq -r ".[$idx].input")
  ACTUAL=$(sudo docker exec -i javadocker sh -c "cd /var/test_directory && java demo $PARAM")
  EXCEPT=$(cat test_data.json| jq -r ".[$idx].expectedOutput")

  echo "期望: $EXCEPT"
  echo "实际: $ACTUAL"
done

#sudo docker exec -i javadocker sh -c "cd /var/test_directory && java demo ThoughWorks"
