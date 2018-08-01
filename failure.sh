#!/bin/sh
curl -X POST \
    -F "status=5" \
    -F "msg=error" \
    $callback_url
