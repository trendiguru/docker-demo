sum=0
rqworkers="rqworkers"
for machine in \
    swarm-agent-6F91B96A000000 \
    swarm-agent-6F91B96A000002 \
    swarm-agent-6F91B96A00000A \
    swarm-agent-6F91B96A00000C \
    swarm-agent-6F91B96A00000D \
    swarm-agent-6F91B96A00000E \
    swarm-agent-6F91B96A00000F
do
    (( sum += 1 ))
    tmp_name="$rqworkers$sum"
    echo ${tmp_name}
    docker build --build-arg constraint:node==$machine -t $tmp_name docker-demo/
done

