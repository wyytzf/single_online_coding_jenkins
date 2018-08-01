#!/bin/sh
echo $test_data > test_data.json

COUNT=$(cat test_data.json| jq -r ".test | length")

for k in $( seq 1 $COUNT ); do
  idx=`expr $k - 1`
  PARAM=$(cat test_data.json| jq -r ".test[$idx].in")
  ACTUAL=$(sudo docker exec -it javadocker sh -c "cd /var/test_directory && java demo $PARAM")
  EXCEPT=$(cat test_data.json| jq -r ".test[$idx].out")

  echo "期望: $EXCEPT"
  echo "实际: $ACTUAL"
done

#sudo docker exec -i javadocker sh -c "cd /var/test_directory && java demo ThoughWorks"
