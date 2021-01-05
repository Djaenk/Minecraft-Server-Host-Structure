#!/bin/sh

BASE_DIR="$(dirname "$(readlink -f "$0")")/.."

update_paper_server(){
	if [ ! -d $BASE_DIR/Servers/$SERVER_DIR ]
	then
		echo "Error: $SERVER_DIR directory does not exist."
		return
	fi

	SERVER_DIR=$1
	MAJOR_VER=$2
	VERSION=$(curl -s "https://papermc.io/api/v2/projects/paper/version_group/$MAJOR_VER/builds" \
		| jq -r ".versions[-1]")
	BUILD=$(curl -s "https://papermc.io/api/v2/projects/paper/version_group/$MAJOR_VER/builds" \
		| jq -r ".builds[-1].build")
	
	echo "Updating $SERVER_DIR/paper.jar:"
	wget -nv -O $BASE_DIR/Servers/$SERVER_DIR/paper.jar \
		https://papermc.io/api/v2/projects/paper/versions/$VERSION/builds/$BUILD/downloads/paper-$VERSION-$BUILD.jar
	echo ""
}

echo "Updating Paper Servers..."
echo ""
update_paper_server Hub		1.16
update_paper_server Survival	1.16
update_paper_server Creative	1.16
update_paper_server Skyblock	1.16
update_paper_server MiniGames	1.16
echo ""
