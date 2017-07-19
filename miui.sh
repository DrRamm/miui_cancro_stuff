#!/bin/bash

F=$1

MIUI_FOLDER=~/miui_unpacked
GIT_FOLDER=~/miui_cancro_stuff
TEMP_RECOMPILE_FOLDER=~/miui_recomp_temp

PATCH_FOLDER=$GIT_FOLDER/patches
TEMP_PATCH_FOLDER=$TEMP_RECOMPILE_FOLDER/shit

STOCK_FOLDER=$GIT_FOLDER/STOCK
MOD_FOLDER=$GIT_FOLDER/MOD

MIUI_SYSTEM=$MIUI_FOLDER/system
APP=$MIUI_SYSTEM/app
PRIV_APP=$MIUI_SYSTEM/priv-app

TEMP_SMALI_FOLDER=smali

GIT_ADD="git add ."
GIT_INIT="git init"
GIT_RESET="git reset --hard"

if [ ! -f $F ] || [ -z "$F" ]; then
        echo "Используйте $0 <file>"
        exit 1 
fi
echo "Очистка $TEMP_RECOMPILE_FOLDER"
rm -rf $TEMP_RECOMPILE_FOLDER/*
echo "Получение папок для патчей"

cd $STOCK_FOLDER
COUNT_FOLDERS="$(ls -l | grep -c ^d)"

echo "Найдено папок: $COUNT_FOLDERS"

mkdir -p $TEMP_PATCH_FOLDER
cd $TEMP_PATCH_FOLDER

eval $GIT_INIT

echo "Обновление патчей"
rm -rf $PATCH_FOLDER/*

for ((i=1; i <= $COUNT_FOLDERS; i ++))
	do	
		cd $STOCK_FOLDER
		CURRENT_FOLDER="$(ls | sort -n | head -n $i | tail -n 1)"
		echo $CURRENT_FOLDER
		echo $TEMP_PATCH_FOLDER
		cp -r $STOCK_FOLDER/$CURRENT_FOLDER $TEMP_PATCH_FOLDER/
		eval $GIT_ADD

		cp -r $MOD_FOLDER/$CURRENT_FOLDER $TEMP_PATCH_FOLDER/ 
		cd $TEMP_PATCH_FOLDER
		git diff > $PATCH_FOLDER/$CURRENT_FOLDER
		rm -rf *
		eval $GIT_ADD
		eval $GIT_RESET
	done

cd $GIT_FOLDER

echo "Распаковка miui в $MIUI_FOLDER"
#unzip $F -d $MIUI_FOLDER

echo "Удаление звуков UI"
rm -rf $MIUI_SYSTEM/media/audio/ui

echo "Копирование папки $GIT_FOLDER/system/etc в $MIUI_SYSTEM"
cp -r $GIT_FOLDER/system/etc $MIUI_SYSTEM

cd $PATCH_FOLDER
COUNT_PATCHES="$(ls -1q | wc -l)"
echo "Найдено патчей: $COUNT_PATCHES "

echo "Накладывание патчей"
for ((i=1; i <= $COUNT_PATCHES; i++))
	do
		CURRENT_PATCH="$(ls | sort -n | head -n $i | tail -n 1)"
		
		if [ "${CURRENT_PATCH: -4}" == "_jar" ]
		then 

			CURRENT_PATH="$(find $MIUI_SYSTEM -name "${CURRENT_PATCH:: -4}.jar")"
			echo $CURRENT_PATH

		else
			CURRENT_PATH="$(find $MIUI_SYSTEM -name "$CURRENT_PATCH.apk")"
			echo $CURRENT_PATH

			echo "Распаковка $CURRENT_PATCH.apk в $TEMP_RECOMPILE_FOLDER/$CURRENT_PATCH"
			mkdir -p $TEMP_RECOMPILE_FOLDER

			unzip $CURRENT_PATH -d $TEMP_RECOMPILE_FOLDER/$CURRENT_PATCH

			cd $TEMP_RECOMPILE_FOLDER/$CURRENT_PATCH

			echo "Распаковка classes.dex"
			baksmali d classes.dex -o $TEMP_SMALI_FOLDER

			echo "Запаковка classes.dex"
			smali a $TEMP_SMALI_FOLDER -o classes.dex
			
			echo "Применение патча $CURRENT_PATCH с $PATCH_FOLDER"
			patch -pi $CURRENT_PATCH 

			rm -rf $TEMP_SMALI_FOLDER

			zip -r ../$CURRENT_PATCH.apk *

			cd ..

			echo "Копирование пропатченного файла $CURRENT_PATCH.apk в $CURRENT_PATH"
			cp $CURRENT_PATCH.apk $CURRENT_PATH
			cd $PATCH_FOLDER

			echo "Готово"
		fi

done





echo "Готово..."