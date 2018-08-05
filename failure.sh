#!/bin/sh
job_msg=$(cat online-coding-master/result)
# status 1-编译超时 2-编译错误 3-运行超时
# 这里有个问题，当运行超时时，job_msg不应该有内容
curl -X POST \
    -F "status=$STATUS" \
    -F "msg=$LOCAL_ERROR" \
    -F "job_msg=$job_msg" \
    $callback_url
