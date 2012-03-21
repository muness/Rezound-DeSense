#!/usr/bin/bash

${ADB:="adb"}

wait_for_adb() {
  $ADB wait-for-device
}

remount() {
  $ADB remount
  $ADB shell busybox mount -o rw,remount /system
}

remove_sense_apks() {
  apks_to_remove=( $( cat apks_to_remove.txt ) )
  for i in $(seq 0 $((${#apks_to_remove[@]} - 1)))
  do
    $ADB shell rm /system/app/${apks_to_remove[$i]}
  done
}

install_aosp_apks() {
  apks_to_install=( $( ls stock_apks/*.apk ) )
  for i in $(seq 0 $((${#apks_to_install[@]} - 1)))
  do
    $ADB push ${apks_to_install[$i]} /system/app/
  done 
}

reboot() {
  $ADB reboot
}

wait_for_adb
remount
remove_sense_apks
install_aosp_apks
reboot
