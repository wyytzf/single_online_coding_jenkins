#!/bin/sh
#starttime=`date +%s%N`
#endtime=`expr $starttime + 10000000000`
#执行程序
#for i in $(seq 1 $endtime);
#do
#  if [ -f "result-compile" ];then
#     exit 1
#  fi
#done
seconds_left=10
while [ $seconds_left -gt 0 ];do
  sleep 1
  seconds_left=$(($seconds_left - 1))
done
# 查看进程 compile.sh是否存在，若存在，则超时
pidarr=$(ps ef|grep "run_background.sh"|awk '{print $1}')
for pid in $pidarr
do
  kill -9 $pid
done
