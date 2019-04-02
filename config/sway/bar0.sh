echo '{ "version": 1 }'
echo "["
echo "[]"
while :;
do
	echo ",["
	echo "{\"name\":\"ipaddress\",\"full_text\":\"$(hostname --ip-addresses)\"}"
	echo ",{\"name\":\"time\",\"full_text\":\"$(date +'%Y-%m-%d %H:%M:%S %p')\"}"
	echo "]"
	sleep 1
done
