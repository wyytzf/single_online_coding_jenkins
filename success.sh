#!/bin/sh
curl -X POST \
    -F "status=4" \
    -F "msg=success" \
    $callback_url
