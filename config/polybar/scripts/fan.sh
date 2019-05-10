#!/bin/bash

fan_speed=$(sensors | grep "Processor Fan" | cut -d " " -f 3-)

echo $fan_speed