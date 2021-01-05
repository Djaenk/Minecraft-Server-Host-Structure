#!/bin/sh

backup_server(){
	SERVER_DIR=$1
	BACKUP_DIR=$2
	DATE=$(date +"%F")

	if [ ! -d $BACKUP_DIR ]
	then
		echo "Error: $BACKUP_DIR directory does not exist"
	elif [ ! -d "$BACKUP_DIR/$SERVER_DIR" ]
	then
		mkdir $BACKUP_DIR/$SERVER_DIR
	elif [ `ls -1 $BACKUP_DIR/$SERVER_DIR | wc -l` -gt 2 ]
	then
		cd $BACKUP_DIR/$SERVER_DIR
		`ls -1t | tail -n 1 | xargs rm -f`
	fi

	cd "$(dirname "$(readlink -f "$0")")/../Servers"

	echo "Zipping $SERVER_DIR server backups ..."
	zip	-vr $BACKUP_DIR/$SERVER_DIR/${SERVER_DIR}_${DATE}.zip \
		$SERVER_DIR \
		-x $SERVER_DIR/*world*/**\*
	echo ""
}

backup_world(){
	SERVER_DIR=$1
	BACKUP_DIR=$2
	DATE=$(date +"%F")
	
	if [ ! -d $BACKUP_DIR ]
	then
		echo "Error: $BACKUP_DIR directory does not exist"
	elif [ ! -d "$BACKUP_DIR/$SERVER_DIR" ]
	then
		mkdir $BACKUP_DIR/$SERVER_DIR
	elif [ `ls -1 $BACKUP_DIR/$SERVER_DIR | wc -l` -gt 2 ]
	then
		cd $BACKUP_DIR/$SERVER_DIR
		`ls -1t | tail -n 1 | xargs rm -f`
	fi

	cd "$(dirname "$(readlink -f "$0")")/../Servers"

	echo "Zipping $SERVER_DIR world backups ..."
	zip	-vr $BACKUP_DIR/$SERVER_DIR/${SERVER_DIR}_${DATE}.zip \
		$SERVER_DIR/*world*
	echo ""
}

backup_proxy(){
	PROXY_DIR=$1
	BACKUP_DIR=$2
	DATE=$(date +"%F")

	cd "$(dirname "$(readlink -f "$0")")/.."
	
	if [ ! -d $BACKUP_DIR ]
	then
		echo "Error: $BACKUP_DIR directory does not exist"
	elif [ `ls -1 $BACKUP_DIR | wc -l` -gt 2 ]
	then
		`ls -1t $BACKUP_DIR | tail -n 1 | xargs rm -f`
	fi

	echo "Zipping $PROXY_DIR proxy backups ..."
	zip	-vr $BACKUP_DIR/${PROXY_DIR}_${DATE}.zip \
		$PROXY_DIR
	echo ""
}

backup_world	Hub		$HOME/Minecraft_Servers/Backups/world_backups
backup_world	Survival	$HOME/Minecraft_Servers/Backups/world_backups
backup_world	Creative	$HOME/Minecraft_Servers/Backups/world_backups
backup_world	Skyblock	$HOME/Minecraft_Servers/Backups/world_backups
backup_world	MiniGames	$HOME/Minecraft_Servers/Backups/world_backups
backup_world	ATM3		$HOME/Minecraft_Servers/Backups/world_backups

backup_server	Hub		$HOME/Minecraft_Servers/Backups/server_backups
backup_server	Survival	$HOME/Minecraft_Servers/Backups/server_backups
backup_server	Creative	$HOME/Minecraft_Servers/Backups/server_backups
backup_server	Skyblock	$HOME/Minecraft_Servers/Backups/server_backups
backup_server	MiniGames	$HOME/Minecraft_Servers/Backups/server_backups
backup_server	ATM3		$HOME/Minecraft_Servers/Backups/server_backups

backup_proxy	Waterfall	$HOME/Minecraft_Servers/Backups/proxy_backups
