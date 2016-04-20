echo "-------> reboot bootloader"
adb reboot-bootloader

echo "-------> preparando imagen"
cd FactoryImage
  rm -fr update
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
fastboot reboot-bootloader
sleep 5
fastboot flash bootloader FactoryImage/update/bootloader-hammerhead-*.img
fastboot reboot-bootloader
sleep 5
fastboot flash radio FactoryImage/update/radio-hammerhead-*.img
fastboot reboot-bootloader
sleep 5
fastboot flash boot FactoryImage/update/boot.img
fastboot reboot-bootloader
sleep 5
fastboot flash cache FactoryImage/update/cache.img
fastboot reboot-bootloader
sleep 5
fastboot flash system FactoryImage/update/system.img
fastboot reboot-bootloader
sleep 5
fastboot flash recovery multirom/TWRP_multirom_hammerhead_*.img
fastboot reboot-bootloader

echo "-------> borrando archivos temporales"
rm -fr FactoryImage/update
