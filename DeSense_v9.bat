@:start
@title DeSense and Cleanup(for ICS)- script by danutzz
@ECHO OFF
REM.-- Prepare the Command Processor
SETLOCAL ENABLEEXTENSIONS
SETLOCAL ENABLEDELAYEDEXPANSION


cls
echo.
:menuLOOP
cls
echo.
echo.   DaNutzz, DeSense and Cleanup script for perm root
echo.  _____________________________________________________________
echo.  Disclaimer:
echo.   Nandroid backup your current rom/settings
echo.   I am not responsible for anything that might happen to your phone.
echo.   Script and all other files are for information puroses only!
echo. 
for /f "tokens=1,2,* delims=_ " %%A in ('"findstr /b /c:":menu_" "%~f0""') do echo.  %%B  %%C
set choice=
echo.&set /p choice=Make a choice or hit ENTER to quit: ||GOTO:EOF
echo.&call:menu_%choice%
GOTO:menuLOOP

:menu_1  Remove Rosie (Install another launcher first)
cls
echo.
echo.
echo.  Removing Rosie. You should have a launcher aleady installed
echo.  "...waiting for phone"
adb wait-for-device >NUL
adb remount >NUL
adb shell busybox mount -o rw,remount /system > NUL
adb shell mkdir /system/app/bkup >NUL
adb shell mv /system/app/Rosie.apk /system/app/bkup/ >NUL
echo.
GOTO:PAUSE


:menu_2  Bluetooth Fix for ICS roms(thx to JoelZ)
cls
echo.  "...waiting for phone"
adb wait-for-device >NUL
adb remount >NUL
adb shell busybox mount -o rw,remount /system > NUL
echo. Pushing files to phone
adb push joelz_btfix\* /system/ > NUL
GOTO:PAUSE

:menu_3  Restore everything
cls
echo. Restoring all apks you have removed with this util
echo.  "...waiting for phone"
adb wait-for-device >NUL
adb remount >NUL
adb shell busybox mount -o rw,remount /system > NUL
adb shell mv /system/app/bkup/* /system/app/ >NUL
GOTO:PAUSE


:menu_4 Install Apps/Launcher
cls
echo.
echo. E - ES File Explorer
echo. W - Wifi Tether
echo. S - Swype
echo. T - Titanium Backup
echo.
echo. N - Nova Launcher (ICS Only)
echo.
echo.  Or Press C to cancel
echo.
@CHOICE /N /C:EWSTNC /M "Choose a ROM option"
IF ERRORLEVEL 6 GOTO EOF
IF ERRORLEVEL 5 GOTO NOVA
IF ERRORLEVEL 4 GOTO TIBU
IF ERRORLEVEL 3 GOTO SWYPE
IF ERRORLEVEL 2 GOTO WIFI
IF ERRORLEVEL 1 GOTO ESFILE


adb push wireless_tether_2_0_7.apk /data/app/ >NUL
GOTO:PAUSE


:menu_5  Remove more HTC,Verizon and google extras
cls
echo.  Removing more junk...
echo.  "...waiting for phone"
adb wait-for-device >NUL
adb remount >NUL
adb shell busybox mount -o rw,remount /system > NUL
adb shell mkdir /system/app/bkup >NUL
adb shell mv /system/app/*idget* /system/app/bkup/ >NUL
adb shell mv /system/app/*eather* /system/app/bkup/ >NUL
adb shell mv /system/app/ba-syncservice* /system/app/bkup/ >NUL
adb shell mv /system/app/AdobeReader.apk /system/app/bkup/ >NUL
adb shell mv /system/app/Blockbuster.apk /system/app/bkup/ >NUL
adb shell mv /system/app/BlueSky.apk /system/app/bkup/ >NUL
adb shell mv /system/app/BooksTablet.apk /system/app/bkup/ >NUL
adb shell mv /system/app/Burgundy.apk /system/app/bkup/ >NUL
adb shell mv /system/app/com.mobitv.client.nfl2010.apk /system/app/bkup/ >NUL
adb shell mv /system/app/DFPI.apk /system/app/bkup/ >NUL
adb shell mv /system/app/DockMode.apk /system/app/bkup/ >NUL
adb shell mv /system/app/DrmProvider.apk /system/app/bkup/ >NUL
adb shell mv /system/app/EPST.apk /system/app/bkup/ >NUL
adb shell mv /system/app/FieldTrial.apk /system/app/bkup/ >NUL
adb shell mv /system/app/FlashLitePlugin.apk /system/app/bkup/ >NUL
adb shell mv /system/app/Flickr.apk /system/app/bkup/ >NUL
adb shell mv /system/app/FriendStream.apk /system/app/bkup/ >NUL
adb shell mv /system/app/GSD.apk /system/app/bkup/ >NUL
adb shell mv /system/app/HTC_Diopen.apk /system/app/bkup/ >NUL
adb shell mv /system/app/htc_vmm_hux.apk /system/app/bkup/ >NUL
adb shell mv /system/app/HtcCarPanel.apk /system/app/bkup/ >NUL
adb shell mv /system/app/HtcCOTAClient.apk /system/app/bkup/ >NUL
adb shell mv /system/app/HtcDm.apk /system/app/bkup/ >NUL
adb shell mv /system/app/HtcCompressViewer.apk /system/app/bkup/ >NUL
adb shell mv /system/app/HtcFacebook.apk /system/app/bkup/ >NUL
adb shell mv /system/app/HtcFacebookChat.apk /system/app/bkup/ >NUL
adb shell mv /system/app/HtcFeedback.apk /system/app/bkup/ >NUL
adb shell mv /system/app/HtcFootprints.apk /system/app/bkup/ >NUL
adb shell mv /system/app/HtcGreader.apk /system/app/bkup/ >NUL
adb shell mv /system/app/HtcImageWallpaper.apk /system/app/bkup/ >NUL
adb shell mv /system/app/HTCLivewallpaperStreak.apk /system/app/bkup/ >NUL
adb shell mv /system/app/HTCLivewallpaperStreak.apk /system/app/bkup/ >NUL
adb shell mv /system/app/HtcMIM.apk /system/app/bkup/ >NUL
adb shell mv /system/app/HtcResetNotify.apk /system/app/bkup/ >NUL
adb shell mv /system/app/HtcRingtoneTrimmer.apk /system/app/bkup/ >NUL
adb shell mv /system/app/HtcTwitter.apk /system/app/bkup/ >NUL
adb shell mv /system/app/HTCSetupWizard.apk /system/app/bkup/ >NUL
adb shell mv /system/app/HtcStore.apk /system/app/bkup/ >NUL
adb shell mv /system/app/HtcStreamPlayer.apk /system/app/bkup/ >NUL
adb shell mv /system/app/HtcTwitter.apk /system/app/bkup/ >NUL
adb shell mv /system/app/HtcVideoPlayer.apk /system/app/bkup/ >NUL
adb shell mv /system/app/JETCET_PRINT_Resources.apk /system/app/bkup/ >NUL
adb shell mv /system/app/JETCET_PRINT.apk /system/app/bkup/ >NUL
adb shell mv /system/app/KeyChain.apk /system/app/bkup/ >NUL
adb shell mv /system/app/Kindle.apk /system/app/bkup/ >NUL
adb shell mv /system/app/LMW.apk /system/app/bkup/ >NUL
adb shell mv /system/app/Mode10Wallpapers.apk /system/app/bkup/ >NUL
adb shell mv /system/app/MyReportAgent.apk /system/app/bkup/ >NUL
adb shell mv /system/app/MagicSmokeWallpapers.apk /system/app/bkup/ >NUL
adb shell mv /system/app/MovieEditor.apk /system/app/bkup/ >NUL
adb shell mv /system/app/MyHTC.apk /system/app/bkup/ >NUL
adb shell mv /system/app/MyHTCCSEngine.apk /system/app/bkup/ >NUL
adb shell mv /system/app/MyTask.apk /system/app/bkup/ >NUL
adb shell mv /system/app/MyVerizon.apk /system/app/bkup/ >NUL
adb shell mv /system/app/NewBayService-market.apk /system/app/bkup/ >NUL
adb shell mv /system/app/nfshp-signed-1.0.13.apk /system/app/bkup/ >NUL
adb shell mv /system/app/NoiseField.apk /system/app/bkup/ >NUL
adb shell mv /system/app/OnLivePlayer.apk /system/app/bkup/ >NUL
adb shell mv /system/app/PhaseBeam.apk /system/app/bkup/ >NUL
adb shell mv /system/app/picasapryramid.apk /system/app/bkup/ >NUL
adb shell mv /system/app/PlusOne.apk /system/app/bkup/ >NUL
adb shell mv /system/app/PolarisOffice.apk /system/app/bkup/ >NUL
adb shell mv /system/app/Protips.apk /system/app/bkup/ >NUL
adb shell mv /system/app/slackerradio.apk /system/app/bkup/ >NUL
adb shell mv /system/app/Stock.apk /system/app/bkup/ >NUL
adb shell mv /system/app/Talk.apk /system/app/bkup/ >NUL
adb shell mv /system/app/talkback.apk /system/app/bkup/ >NUL
adb shell mv /system/app/TetheringGuard.apk /system/app/bkup/ >NUL
adb shell mv /system/app/TrimIt.apk /system/app/bkup/ >NUL
adb shell mv /system/app/VerizonSSOEngine.apk /system/app/bkup/ >NUL
adb shell mv /system/app/verizonWave.apk /system/app/bkup/ >NUL
adb shell mv /system/app/VideoEditorGoogle.apk /system/app/bkup/ >NUL
adb shell mv /system/app/VVM.apk /system/app/bkup/ >NUL
adb shell mv /system/app/VzNav.apk /system/app/bkup/ >NUL
adb shell mv /system/app/VzwLBSPerm.apk /system/app/bkup/ >NUL
adb shell mv /system/app/WatchApp.apk /system/app/bkup/ >NUL
adb shell mv /system/app/vzw_LocAgent_Preload.apk /system/app/bkup/ >NUL
adb shell mv /system/app/VzWBAClient.apk /system/app/bkup/ >NUL
adb shell mv /system/app/VZWInstaller.apk /system/app/bkup/ >NUL
adb shell mv /system/app/WifiRouter.apk /system/app/bkup/ >NUL
GOTO:PAUSE

:menu_6  Change MainVer to universal (thx to drellisdee)
cls
echo.
echo.  "...waiting for phone"
adb wait-for-device > NUL
adb remount > NUL
adb shell busybox mount -o rw,remount /  > NUL
adb push misctool /tmp/misctool  > NUL
adb push misctool.c /tmp/misctool.c  > NUL
adb shell "su -c 'chmod 0777 /tmp/misctool'"  > NUL
adb shell "su -c '/tmp/misctool w 1.00.000.0'"  > NUL
echo.
echo.  _____________________________________________________________
echo.
echo. If you see any error messages, MainVer has not changed
echo.   please post any error messages on XDA
echo. 
echo. If you don't see errors then your MainVer has been updated!
echo.
pause
GOTO:PAUSE


:menu_7  Remove HTC LockScreen
cls
echo.  "...waiting for phone"
adb wait-for-device > NUL
adb remount > NUL
adb shell busybox mount -o rw,remount /system > NUL
adb shell mv /system/app/HtcLockScreen.apk /system/app/bkup/ >NUL
adb shell mv /system/app/Idlescreen_Base.apk /system/app/bkup/ >NUL
adb shell mv /system/app/idlescreen_shortcut.apk /system/app/bkup/ >NUL
adb shell mv /system/app/com.htc.idlescreen_SN.apk /system/app/bkup/ > NUL
adb shell mv /system/app/idlescreen_photo.apk /system/app/bkup/ > NUL
GOTO:PAUSE

:menu_8 Install ICS Notification and Settings (ICS Only)
cls
echo.  "...waiting for phone"
adb wait-for-device >NUL
adb remount >NUL
adb shell busybox mount -o rw,remount /system > NUL
echo. 
echo. Press A, if your ICS ROM is 4.0.1
echo. Press B, if your ICS ROM is 4.0.3 (2.10.xx build only)
echo.   Cannot use this for new 4.0.3 roms based off
echo.   then 2.11.xx build
echo.
echo.  Or Press C to cancel
echo.
@CHOICE /N /C:ACB /M "Choose a ROM option"
IF ERRORLEVEL 3 GOTO ICS403
IF ERRORLEVEL 2 GOTO EOF
IF ERRORLEVEL 1 GOTO ICS401

:menu_9 Install ad-block hosts file
cls
echo.  "...waiting for phone"
adb wait-for-device >NUL
adb remount >NUL
adb shell busybox mount -o rw,remount /system > NUL
adb push hosts /system/etc/ >NUL
GOTO:PAUSE

:menu_0  Reboot phone (more options)
cls
echo. 
echo. Available Options:
echo. 
echo. L - Reboot to Bootloader
echo. R - Reboot to Recovery
echo. N - Reboot normallly
echo.
echo.  Or Press C to cancel
echo.
@CHOICE /N /C:NCRL /M "Choose a reboot option"
IF ERRORLEVEL 4 GOTO REBOOTLOADER
IF ERRORLEVEL 3 GOTO REBOOTREC
IF ERRORLEVEL 2 GOTO EOF
IF ERRORLEVEL 1 GOTO REBOOTNORM

:ICS401
cls
adb remount >NUL
adb shell busybox mount -o rw,remount /system > NUL
echo. Backing up old Settings and installing new...
adb shell mv /system/app/SystemUI.apk /system/app/bkup/ >NUL
adb shell mv /system/app/Settings.apk.apk /system/app/bkup/ >NUL
adb push SystemUI_401.apk /system/app/SystemUI.apk >NUL
adb push Settings.apk /system/app/ >NUL
GOTO:PAUSE

:ICS403
cls
adb remount >NUL
adb shell busybox mount -o rw,remount /system > NUL
echo. Backing up old Settings and installing new...
adb shell mv /system/app/SystemUI.apk /system/app/bkup/ >NUL
adb shell mv /system/app/Settings.apk.apk /system/app/bkup/ >NUL
adb push SystemUI_403.apk /system/app/SystemUI.apk >NUL
adb push Settings.apk /system/app/ >NUL
GOTO:PAUSE

:REBOOTNORM
cls
adb reboot > NUL
echo. "Do not touch your phone until it finishes rebooting!!!"
echo. 
echo. After your phone has rebooted, Press any key to continue.
pause > NUL
GOTO:EOF

:REBOOTREC
cls
adb reboot recovery > NUL
echo. "Do not touch your phone until it finishes rebooting!!!"
echo. 
echo. After your phone has rebooted, Press any key to continue.
pause > NUL
GOTO:EOF

:REBOOTLOADER
cls
adb reboot bootloader > NUL
echo. "Do not touch your phone until it finishes rebooting!!!"
echo. 
echo. After your phone has rebooted, Press any key to continue.
pause > NUL
GOTO:EOF

:PAUSE
cls
echo. 
echo. Reboot recommended!!! Phone may not function until reboot!
echo.
echo. Press any key to continue to return to menu
echo.
echo.   (You may use option 0 in main menu to reboot)
pause > NUL
GOTO:EOF

:ESFILE
cls
echo.  "...waiting for phone"
adb wait-for-device >NUL
adb install com.estrongs.android.pop.cupcake-1.apk >NUL
GOTO:PAUSE

:TIBU
cls
echo.  "...waiting for phone"
adb wait-for-device >NUL
adb install com.keramidas.TitaniumBackup-1.apk >NUL
GOTO:PAUSE

:NOVA
cls
echo.  "...waiting for phone"
adb wait-for-device >NUL
adb remount >NUL
adb shell busybox mount -o rw,remount /system > NUL
adb push com.teslacoilsw.launcher-1.apk /system/app/ >NUL
GOTO:PAUSE

:WIFI
cls
echo.  "...waiting for phone"
adb wait-for-device >NUL
adb install wifi_tether_v3_1-beta11.apk >NUL
GOTO:PAUSE

:SWYPE
cls
echo.  "...waiting for phone"
adb wait-for-device >NUL
adb install Swype_3.26.92.37604.apk >NUL
GOTO:PAUSE