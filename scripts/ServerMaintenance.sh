#!/bin/sh

BASE_DIR="/home/mcft/Minecraft_Servers"
LOG_DIR="logs"
DATE=$(date +"%F")

start_time=`date +%s`

touch $BASE_DIR/$LOG_DIR/$DATE.log
$BASE_DIR/scripts/StopServers.sh &> $BASE_DIR/$LOG_DIR/maintenance_$DATE.log
$BASE_DIR/scripts/BackupServers.sh &>> $BASE_DIR/$LOG_DIR/maintenance_$DATE.log
$BASE_DIR/scripts/UpdatePaper.sh &>> $BASE_DIR/$LOG_DIR/maintenance_$DATE.log
$BASE_DIR/scripts/UpdateProxy.sh &>> $BASE_DIR/$LOG_DIR/maintenance_$DATE.log

end_time=`date +%s`
runtime=`expr $end_time - $start_time`
echo $runtime second maintenance runtime >> $BASE_DIR/$LOG_DIR/$DATE.log
echo 'Maintenance logged to $BASE_DIR/$LOG_DIR/$DATE.log'
