#!/bin/bash

# cpu
cat /proc/cpuinfo | grep processor | sort | uniq | wc -l | awk '{printf "cpu core: "}{print $1}'
cat /proc/cpuinfo | grep -i "physical id" | sort | uniq | wc -l | awk '{printf "number of cpu: "}{print $1}'

# memory
cat /proc/meminfo | grep -i memtotal | awk '{printf "Total memory: "} {printf $2*0.000001} {print " GB"}'
free -h

