@ECHO off
:::#################################################################################################::
::: Modify these fields to set correct Avrdude path, config path, programmer type and flags

SET AVRDUDE_PATH=avrdude.exe
SET AVRDUDE_CONF_PATH=avrdude.conf
SET PROGRAMMER=avr109
SET EXTRA_FLAGS=-P COM12 -b57600

:: Target specific
SET TARGET=atmega32u4

:: File specific
SET FLASH_FILE=mEDBG_UPDI.hex
SET EEPROM_FILE=mEDBG_UPDI.eep

@ECHO on

%AVRDUDE_PATH% -C%AVRDUDE_CONF_PATH% -c%PROGRAMMER% %EXTRA_FLAGS% -p%TARGET% -Ueeprom:w:%EEPROM_FILE%:i -Uflash:w:%FLASH_FILE%:i

PAUSE

:end