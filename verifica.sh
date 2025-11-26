if [ -z "$1" ]; then
	echo "Usage: $0 <hosts-files>"
	exit 1
fi
if [ ! -f "$1" ]; then
	echo "Error: file '$1' does not exist"
	exit 1
fi
while read  IP NAME; do
	REAL=$(nslookup "$NAME" 2>/dev/null | grep "Address:" | tail -1 | cut -d' ' -f2)
	if [ "$REAL" != "$IP" ]; then
		echo "$NAME in $1!"
	fi
done < "$1"
echo "Modificare facuta de Robert"
