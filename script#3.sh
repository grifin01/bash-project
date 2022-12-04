hosts=(192.168.0.1 173.194.222.113 87.250.250.242)
timeout=4
for (( i=1; i <= 5; i++ ))
do
echo "Step" $i
date >> hosts_status.log
	for j in ${hosts[@]}
	do
		curl -s --connect-timeout $timeout $j:80 > /dev/null
		echo "Checking" $j status=$? >> hosts_status.log
	done
done
echo "Done"
