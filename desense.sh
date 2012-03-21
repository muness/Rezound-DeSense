#!/usr/bin/bash

ADB="./adb.exe"

remount() {
  $ADB remount
  $ADB shell busybox mount -o rw,remount /system
}

wait_for_adb() {
  $ADB wait-for-device
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

echo 'Before running this script:
 * Make a Nandroid backup
 * Install the Sense ROM of your choice (I jump around between BAMF, CleanROM and RezROM)
 * Install a launcher of your choice (I like Nova)
 * Connect the device to USB
If you have not done any of these steps, Ctrl-c, do them and re-execute the script

The script will:
* move HTC and Verizon apks to /system/app/backup
* install AOSP APKs for Browser, Calendar, Calculator, Email
* Reboot

Do NOT expect:
* Stock status bar
* Stock dialogs
* Stock dialer or Phone or People app
* Much of anything.
'

read -n 1 -p "Press any key to start de-sensing..."

wait_for_adb
remount
remove_sense_apks
install_aosp_apks
reboot
