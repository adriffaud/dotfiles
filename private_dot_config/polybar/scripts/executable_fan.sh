#!/bin/bash

fan_speed=$(sensors | grep "fan1" | cut -d " " -f 3-)

echo $fan_speed
