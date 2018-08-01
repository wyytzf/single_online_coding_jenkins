    #!/bin/sh
    echo $test_data > test_data.json

    COUNT=$(cat test_data.json| jq -r ". | length")
    SUCCESS_COUNT=0
    for k in $( seq 1 $COUNT );
    do
      idx=`expr $k - 1`
      PARAM=$(cat test_data.json| jq -r ".[$idx].input")
      ACTUAL=$(sudo docker exec -i javadocker sh -c "cd /var/test_directory && java demo $PARAM")
      EXCEPT=$(cat test_data.json| jq -r ".[$idx].expectedOutput")

      echo "期望: $EXCEPT"
      echo "实际: $ACTUAL"
      if [[ $ACTUAL == $EXPORT ]]; then
          let "SUCCESS_COUNT+=1"
      else
          let "SUCCESS_COUNT+=2"
        fi
    done
    echo "SUCCESS_COUNT:$SUCCESS_COUNT"

    #sudo docker exec -i javadocker sh -c "cd /var/test_directory && java demo ThoughWorks"
