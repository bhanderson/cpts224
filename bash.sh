#echo -n "Enter the file > "
#read text
echo "Read Write Execute Plain Dir Filename"
for f in "$@"; do
	if [ ! -e "$f" ]
	then
		echo " ---  ---    ---    ---  ---   $f"
		break;
	fi
	if [ -r "$f" ]
	then
		echo -n "  Y"
	else
		echo -n "  N"
	fi
	if [ -w "$f" ]
	then
		echo -n "    Y "
	else
		echo -n "    N "
	fi
	if [ -x "$f" ]
	then
		echo -n "     Y "
	else
		echo -n "     N "
	fi
	if [ -f "$f" ]
	then
		echo -n "     Y "
	else
		echo -n "     N "
	fi
	if [ -d "$f" ]
	then
		echo -n "   Y    "
	else
		echo -n "   N    "
	fi
	echo "$f"
done;
