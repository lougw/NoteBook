#!/bin/bash
echo '查询进程占用文件句柄数'
set `adb shell ps |grep com.chehejia.car.music.v3 `
pidnum=$2
#pidnum=4014
index=0
while true
do
index=$[index+1]
echo "\n#######################\n"
echo '第'$index'次查询'  
#echo '句柄列表'
#adb shell ls -l /proc/$pidnum/fd   >>1.txt
adb shell ls -l /proc/$pidnum/fd 
#echo "totalfdnum 总句柄数 : "`adb shell ls -l /proc/$pidnum/fd |wc -l` >>videofd.txt
#echo "socketfdnum 句柄数 : "`adb shell ls -l /proc/$pidnum/fd |grep "socket" -c` >>videofd.txt
adb shell ls -l /proc/$pidnum/fd |grep "" -c 
adb shell ls -l /proc/$pidnum/fd |grep "socket" -c 
adb shell ls -l /proc/$pidnum/fd |grep "anon_inode" -c
adb shell ls -l /proc/$pidnum/fd |grep "/dev/ashmem" -c
#echo '##################'
sleep 2
done
