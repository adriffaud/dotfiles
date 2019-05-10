#!/bin/bash

apt=$(sudo apt update 2> /dev/null)


updates=$(("$updates_arch"))

if [ "$updates" -gt 0 ]; then
    echo " $updates"
else
    echo "0"
fi
