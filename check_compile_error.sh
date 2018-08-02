!#/bin/sh

MSG=$(cat compile-error)
echo $MSG
if [ -z "$MSG" ];then
  exit 1
fi
