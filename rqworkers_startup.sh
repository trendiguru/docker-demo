#!/bin/bash
workername=$1
while [ "$workername" == "" ]; do
    response=
    echo "No worker name was specified!!!"
    read response
    workername=$response
done
echo $workername

workersnum=$2
while [ "$workersnum" == "" ]; do
    response=
    echo "Number of workers not specified!!!"
    read response
    workersnum=$response
done
echo $workersnum
echo 'workername = ' $workername
echo 'workernum = ' $workersnum

for i in $(seq 1 $workersnum); do
    echo $i 
    exec rqworker -u $REDIS_URL $workername &
done
wait $!
