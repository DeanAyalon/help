#!/bin/bash

docker run -p 3000:3000 qlaffont/livechatccb \
    -e DISCORD_TOKEN='xxxxxxxxxxxxx' \ 
    -e DISCORD_CLIENT_ID='xxxxxxxxxxx' \ 
    -e DEFAULT_DURATION='5' \ 
    -e HIDE_COMMANDS_DISABLED='false' \ 
    -e API_URL='htpp://localhost'