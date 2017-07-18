#!/bin/bash
F=$1
MIUI_FOLDER=~/miui_unpacked
GIT_FOLDER=~/miui_cancro_stuff

SYSTEM=$MIUI_FOLDER/system
ETC=$SYSTEM/etc

#
if [ ! -f $F ] || [ -z "$F" ]; then
        echo "Используйте $0 <file>"
        exit 1 
fi
echo "Распаковка miui в $MIUI_FOLDER"
echo "Распаковка miui в $GIT_FOLDER"
#unzip $F -d $MIUI_FOLDER

echo "Удаление звуков UI"
rm -rf $SYSTEM/media/audio/ui
echo "Копирование папки $GIT_FOLDER/system/etc"
cp -r $GIT_FOLDER/system/etc $SYSTEM

echo "Готово..."