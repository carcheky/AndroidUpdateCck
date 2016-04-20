echo "-------> reboot bootloader"
adb reboot-bootloader
echo "-------> preparando imagen"
cd FactoryImage
  mkdir update
  tar -xvf hammerhead*.tgz -C update
  cd update
    mv hammerhead*/* .
    rm -fr hammerhead*
    unzip image-hammerhead-*.zip
    rm image-hammerhead-*.zip
  cd ..
cd ..
echo "-------> instalando actualizacion"
adb reboot bootloader
sleep 5
fastboot flash bootloader FactoryImage/update/bootloader-hammerhead-*.img
fastboot reboot-bootloader
sleep 5
fastboot flash radio FactoryImage/update/radio-hammerhead-*.img
fastboot reboot-bootloader
sleep 5
fastboot flash boot FactoryImage/update/boot.img
sleep 5
fastboot flash cache FactoryImage/update/cache.img
sleep 5
fastboot flash system FactoryImage/update/system.img
sleep 5
fastboot reboot-bootloader
sleep 5
fastboot flash recovery multirom/TWRP_multirom_hammerhead_*.img
sleep 5
fastboot reboot-bootloader
echo "-------> borrando archivos temporales"
rm -fr FactoryImage/update
sleep 5
