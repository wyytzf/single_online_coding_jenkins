!#/bin/sh
MSG=$(cat compile-error)
echo $MSG
if [ -n "$MSG" ];then
  #JOBS=$(jobs|grep check_compile_error.sh|awk '{print $1}')
  #NUM=${JOBS:1:1}
  #fg %$NUM
  echo "编译错误"
  exit 1
fi
