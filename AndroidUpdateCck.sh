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


echo "-------> instalando actualización"

adb reboot bootloader
sleep 5
fastboot flash FactoryImage/update/bootloader bootloader-hammerhead-*.img
fastboot reboot-bootloader
sleep 5
fastboot flash FactoryImage/update/radio radio-hammerhead-*.img
fastboot reboot-bootloader
sleep 5
fastboot flash FactoryImage/update/boot boot.img
sleep 5
fastboot flash FactoryImage/update/cache cache.img
sleep 5
fastboot flash FactoryImage/update/system system.img
sleep 5
fastboot reboot-bootloader
sleep 5
fastboot flash recovery multirom/TWRP_multirom_hammerhead_*.img
sleep 5
fastboot reboot-bootloader



echo "-------> borrando archivos temporales"
rm -fr FactoryImage/update
sleep 5
