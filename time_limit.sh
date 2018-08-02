#!/bin/sh
seconds_left=10
while [ $seconds_left -gt 0 ];do
  sleep 1
  seconds_left=$(($seconds_left - 1))
  count=`ps -ef | grep $1 | grep -v "grep" | wc -l`
  echo $count
  if [ "$(ps ef|grep $1)" == "" ];
  then
    echo "成功"
    exit 0
  fi
done
# 查看进程 compile.sh是否存在，若存在，则超时
pidarr=$(ps ef|grep "$1"|awk '{print $1}')
for pid in $pidarr
do
  kill -9 $pid
done
exit 1
