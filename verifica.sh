

while read  IP NAME; do
	REAL=$(nslookup "$NAME" 2>/dev/null | grep "Address:" | tail -1 | cut -d' ' -f2)
	if [ "$REAL" != "$IP" ]; then
		echo "$NAME in \$HOME/etc/hosts !"
	fi
done < "$HOME/etc/hosts"
