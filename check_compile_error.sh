#!/bin/sh
MSG=$(cat compile-error)

if [ -n "$MSG" ];then
  echo "$MSG" > result
  echo "编译错误" >> result
  exit 1
fi
