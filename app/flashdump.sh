#!/usr/bin/bash
python /c/dev/esp/esp-idf/components/esptool_py/esptool/esptool.py --chip esp32 --port COM4 --baud 921600 --before default_reset --after hard_reset write_flash -z --flash_mode dio --flash_freq 40m --flash_size detect 0x1000 /c/dev/paddle/app/build/bootloader/bootloader.bin 0x10000 /c/dev/paddle/app/build/paddle.bin 0x8000 /c/dev/paddle/app/build/partitions_singleapp_coredump.bin
