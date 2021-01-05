#!/bin/sh

BASE_DIR="$(dirname "$(readlink -f "$0")")/.."

start_server(){
	SERVER_DIR=$1

	echo "Starting $SERVER_DIR ..."
	screen -d -m -S $SERVER_DIR $BASE_DIR/Servers/$SERVER_DIR/start.sh
}

start_proxy(){
	PROXY_DIR=$1

	echo "Starting $PROXY_DIR ..."
	screen -d -m -S $PROXY_DIR $BASE_DIR/$PROXY_DIR/start.sh
}

echo "Starting Servers..."
sleep 5s
start_server Hub
sleep 20s
start_server Survival
sleep 20s
start_server Creative
sleep 20s
start_server Skyblock
sleep 20s
# start_server MiniGames
# sleep 20s
start_proxy Waterfall
sleep 60s
start_server ATM3

screen -list
echo ""
