#!/bin/bash

command=$1

send_command()
{
    screen -S mc-getoffmylawn_v2 -p 0 -X stuff "$command^M"
    # echo "attempted to send command to server"
}

# echo $command

send_command $command
