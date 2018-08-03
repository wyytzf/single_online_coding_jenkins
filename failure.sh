#!/bin/sh
job_msg=$(cat online-coding-master/result)
curl -X POST \
    -F "status=5" \
    -F "msg=$LOCAL_ERROR" \
    -F "job_msg=$job_msg" \
    $callback_url
