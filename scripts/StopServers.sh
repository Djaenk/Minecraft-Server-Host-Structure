#!/bin/sh

stop_server(){
	SERVER_DIR=$1

	echo "Stopping $SERVER_DIR ..."
	screen -S $SERVER_DIR -X stuff "stop^M"
	if [ $# -gt 1 ]
	then
		sleep 10s
		echo "Additional input to $SERVER_DIR: $2"
		screen -S $SERVER_DIR -X stuff $2
	fi
}

stop_proxy(){
	PROXY_DIR=$1

	echo "Stopping $PROXY_DIR ..."
	screen -S $PROXY_DIR -X stuff "end^M"
}

echo "Stopping Servers..."
stop_server	Hub
stop_server	Survival
stop_server	Creative
stop_server	Skyblock
stop_server 	MiniGames
stop_server	ATM3 ^C
stop_proxy	Waterfall

sleep 10s
screen -list
echo ""
