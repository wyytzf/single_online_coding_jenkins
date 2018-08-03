#!/bin/sh
job_msg=$(cat online-coding-master/result)
curl -X POST \
    -F "status=$status" \
    -F "msg=$LOCAL_ERROR" \
    -F "job_msg=$job_msg" \
    $callback_url
