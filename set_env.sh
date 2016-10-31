#!/bin/bash

var1="MACHINE"
i=0
echo -ne '' > .env
for agent in $(docker info | grep swarm-agent | cut -d: -f1) 
do
    machine="$var1$i"
    echo "$machine"=$agent >> .env
    (( i += 1 ))
done
