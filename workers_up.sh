fps="fps"
image="rqworkers"
latest=":latest"

WORKER_TYPE=$1
case $WORKER_TYPE in
    1) echo 'fingerprinter4db'
	for i in {1..70};
	do
		tmp=$((i%7))
	    	container_name="$fps$i "
		image_name="$image$tmp$latest"
		if (docker ps | grep $container_name); then
		        docker rm -f $container_name
		else
		        echo "no docker named $container_name"
		fi
	        docker run -d --net mongodb_default  --name $container_name $image_name fingerprinter4db 1 
	done ;;
    2) echo 'amazon'
         amz="amz"
	 for i in {1..112};
	 do
	     container_name="$amz$i"
	     tmp=$((i%7))
	     image_name="$image$tmp$latest"
 	     if (docker ps | grep $container_name); then
	         docker rm -f $container_name
	     else
	         echo "no docker named $container_name"
	     fi
	     docker run -d --net mongodb_default  --name $container_name $image_name amazon_worker 25
	 done ;;
    3) echo 'recruit'
	 recruit="recruit"
	 for i in {1..7};
	 do
    	 	container_name="$recruit$i"
    		tmp=$((i%7))
    		image_name="$image$tmp$latest"
    		if (docker ps | grep $container_name); then
        		docker rm -f $container_name
    		else
        		echo "no docker named $container_name"
    		fi
    		docker run -d --net mongodb_default  --name $container_name $image_name recruit_worker 2
	 done ;;
esac

