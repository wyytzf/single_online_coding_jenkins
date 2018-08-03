#!/bin/sh
job_msg="$env.LOCAL_ERROR"
curl -X POST \
    -F "status=5" \
    -F "msg=error" \
    -F "job_msg=$LOCAL_ERROR" \
    $callback_url
