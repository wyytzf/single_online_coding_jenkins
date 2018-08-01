#!/bin/sh
echo $test_data
sudo docker exec -i javadocker sh -c "cd /var/test_directory && java demo ThoughtWorks"
