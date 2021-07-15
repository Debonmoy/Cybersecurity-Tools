#!/usr/bin/bash

#Welcome Screen function
welcomeScreen(){
echo "================================================="
echo "    PING SCANNER BY DEBONMOY"
echo "================================================="
}

#help function
help(){
welcomeScreen
echo "HELP MENU:~"
echo "How to run or use the script:"
echo "./<script_name>.sh -<option> <as directed below>"
echo "-h:       help menu       ./<script_name>.sh -h"
echo "-i:       ip address      ./<script_name>.sh -i <ip address/website name>"
echo "-t:       text file       ./<script_name>.sh -t <text file>"

}

#Options
case "$1" in
-h) help
shift;;
-i) echo -n "[*] Enter the number of packets to send: "
read pac
ping $2 -c$pac | grep -e "transmitted"
shift;;
-t) echo -n "[*] Enter the number of packets to send: "
read pack
file=$2
all_lines=`cat $file`
for line in $all_lines;
	do
	echo "------------------------------------------"
	echo "Scan results for $line:"
	echo
	ping $line -c$pack | grep -e "transmitted"
	echo "------------------------------------------"
done;
shift;;
*)
esac

if [ -z $1 ]; then
help
fi
