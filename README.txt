= Thanks to

* The awesome developers who provide the Sense ROMs that we can run this against.
* Scott Crosler who provided me a list of apps to remove.
* Quantumrabbit who maintains a list of APKs that are safe to remove at http://forum.xda-developers.com/showthread.php?t=1532366

= What this does

* Removes bloat, especially from HTC and Verizon
* Install AOSP APKs for Browser, Calendar, Calculator, Email (see stock_aps directory)
* Reboots the phone before FCs kick in

= Before running this script

* Make a Nandroid backup
* Install the Sense ROM of your choice (I jump around between BAMF, CleanROM and RezROM)
* Install a launcher and keyboard of your choice (I like Nova and SwiftKey X)
* Connect the device to USB

If you have not done any of these steps do not use this script!

= Using this script

== Windows

* download the .zip file https://github.com/muness/Rezound-DeSense/zipball/master
* expand it
* Run desense.bat

== Mac/Linux

* Get adb working on your machine.  If you need help, see http://wiki.cyanogenmod.com/wiki/Howto:_Install_the_Android_SDK.
* Download the .zip file https://github.com/muness/Rezound-DeSense/zipball/master
* Expand it
* Run ./desense.sh

= Known issues

* You don't get AOSP status bar
* You don't get AOSP dialogs
* You don't get AOSP dialer or Phone or People app
* You need to wipe data from the Google Play Store app
* There's still some HTC Sense stuff here.  e.g. Camera, Gallery, Personalize setting.

= Ideas

* Add HQ ICS Camera: http://forum.xda-developers.com/showthread.php?t=1533238
* Replace Dialer, Phone and People with stock APKs
* Make this script work on .zip files instead of a running phone
** Probably won't work because first time setup files will be missing.
** Would also require adding a launcher.

 