#!/bin/sh
echo $test_data > test_data.json

COUNT=$(cat test_data.json| jq -r ".[] | length")
echo "COUNT: $COUNT"
for k in $( seq 0 $COUNT ); do
  #idx=`expr $k`
  echo "times:$k"
  PARAM=$(cat test_data.json| jq -r ".[$k].input")
  ACTUAL=$(sudo docker exec -i javadocker sh -c "cd /var/test_directory && java demo $PARAM")
  EXCEPT=$(cat test_data.json| jq -r ".[$k].expectedOutput")

  echo "期望: $EXCEPT"
  echo "实际: $ACTUAL"
done

#sudo docker exec -i javadocker sh -c "cd /var/test_directory && java demo ThoughWorks"
