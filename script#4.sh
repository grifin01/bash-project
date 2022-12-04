hosts=(173.194.222.113 192.168.0.1 87.250.250.242)
timeout=4
status=0
while (($status == 0))
do
    for i in ${hosts[@]}
    do
	curl -s --connect-timeout $timeout $i:80 >/dev/null
	status=$?
	if (($status != 0))
	then
	    echo "Failed on the address" $i status=$status >> error.log
	    exit
	fi
    done
done
