#!/bin/bash

program="connect.sh"

echo -n "USER: "
read user
echo

echo -n "ADDR: "
read addr
echo

echo -n "PORT: "
read port
echo

echo \
"#!/bin/bash

if [[ \"\$1\" = \"ssh\" ]]; then
	ssh $user@$addr -p $port
else
	echo \"Error: Wrong paramenter\"
	echo \"	ssh\"
fi" > $program

chmod +x $program
