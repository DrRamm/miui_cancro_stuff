#!/bin/bash

DATE_START=$(date +"%s")
clear
F=$1

PREFFIX_FOR_ZIP="drramm_"

MIUI_FOLDER=~/miui_unpacked
GIT_FOLDER=~/miui_cancro_stuff
TEMP_RECOMPILE_FOLDER=~/miui_recomp_temp

PATCH_FOLDER=$TEMP_RECOMPILE_FOLDER/patches
TEMP_PATCH_FOLDER=$TEMP_RECOMPILE_FOLDER/another_temp_folder

STOCK_FOLDER=$GIT_FOLDER/STOCK
MOD_FOLDER=$GIT_FOLDER/MOD

MIUI_SYSTEM=$MIUI_FOLDER/system
APP=$MIUI_SYSTEM/app
PRIV_APP=$MIUI_SYSTEM/priv-app

TEMP_SMALI_FOLDER=smali

GIT_ADD="git add ."
GIT_INIT="git init -q"
GIT_RESET="git reset --hard"

if [ ! -f $F ] || [ -z "$F" ]; then
        echo "Используйте $0 <file>"
        exit 1 
fi



echo "Очистка временных папок"
rm -rf $TEMP_RECOMPILE_FOLDER
rm -rf $MIUI_FOLDER

echo
echo "Распаковка $F в $MIUI_FOLDER"
unzip -qq $F -d $MIUI_FOLDER

echo "Удаление звуков UI"
rm -rf $MIUI_SYSTEM/media/audio/ui

echo "Копирование папки $GIT_FOLDER/system/etc в $MIUI_SYSTEM"
echo
cp -r $GIT_FOLDER/system/etc $MIUI_SYSTEM

echo "Получение папок для патчей"

cd $STOCK_FOLDER
COUNT_FOLDERS="$(ls -l | grep -c ^d)"

echo "Найдено папок: $COUNT_FOLDERS"

mkdir -p $TEMP_PATCH_FOLDER
cd $TEMP_PATCH_FOLDER

echo
echo "Обновление патчей на основе разницы STOCK и MOD"
mkdir -p $PATCH_FOLDER

for ((i=1; i <= $COUNT_FOLDERS; i ++))
	do	
		cd $STOCK_FOLDER
		CURRENT_FOLDER="$(ls | sort -n | head -n $i | tail -n 1)"
		echo $CURRENT_FOLDER		
		cp -r $STOCK_FOLDER/$CURRENT_FOLDER $TEMP_PATCH_FOLDER/
		cd $TEMP_PATCH_FOLDER/$CURRENT_FOLDER
		eval $GIT_INIT
		eval $GIT_ADD	

		cp -r $MOD_FOLDER/$CURRENT_FOLDER $TEMP_PATCH_FOLDER/		
		git diff > $PATCH_FOLDER/$CURRENT_FOLDER
		rm -rf *
		eval $GIT_ADD
		eval $GIT_RESET
	done

cd $PATCH_FOLDER
COUNT_PATCHES="$(ls -1q | wc -l)"

echo
echo "Создано патчей: $COUNT_PATCHES "

echo "Наложение патчей..."
for ((i=1; i <= $COUNT_PATCHES; i++))
	do
		CURRENT_PATCH="$(ls | sort -n | head -n $i | tail -n 1)"
		echo
		echo "Патч [$i/$COUNT_PATCHES]"
		if [ "${CURRENT_PATCH: -4}" == "_jar" ]
		then 

			CURRENT_PATH="$(find $MIUI_SYSTEM -name "${CURRENT_PATCH:: -4}.jar")"
			
			echo "Распаковка $CURRENT_PATCH.jar в $TEMP_RECOMPILE_FOLDER/$CURRENT_PATCH"
			mkdir -p $TEMP_RECOMPILE_FOLDER
			unzip -qq $CURRENT_PATH -d $TEMP_RECOMPILE_FOLDER/$CURRENT_PATCH

			cd $TEMP_RECOMPILE_FOLDER/$CURRENT_PATCH

			echo "Распаковка classes.dex"
			baksmali d classes.dex -o $TEMP_SMALI_FOLDER
			
			echo "Применение патча $CURRENT_PATCH из $PATCH_FOLDER"
			eval $GIT_INIT
			eval $GIT_ADD	
			git apply $PATCH_FOLDER/$CURRENT_PATCH

			echo "Запаковка classes.dex"
			smali a $TEMP_SMALI_FOLDER -o classes.dex			 

			rm -rf $TEMP_SMALI_FOLDER

			zip -rqq ../$CURRENT_PATCH.jar *

			cd ..

			echo "Копирование пропатченного файла $CURRENT_PATCH.jar в $CURRENT_PATH"
			cp $CURRENT_PATCH.jar $CURRENT_PATH
			cd $PATCH_FOLDER

			echo "Готово"

		else
			CURRENT_PATH="$(find $MIUI_SYSTEM -name "$CURRENT_PATCH.apk")"

			echo "Распаковка $CURRENT_PATCH.apk в $TEMP_RECOMPILE_FOLDER/$CURRENT_PATCH"
			mkdir -p $TEMP_RECOMPILE_FOLDER
			unzip -qq $CURRENT_PATH -d $TEMP_RECOMPILE_FOLDER/$CURRENT_PATCH

			cd $TEMP_RECOMPILE_FOLDER/$CURRENT_PATCH

			echo "Распаковка classes.dex"
			baksmali d classes.dex -o $TEMP_SMALI_FOLDER

			echo "Применение патча $CURRENT_PATCH из $PATCH_FOLDER"
			eval $GIT_INIT
			eval $GIT_ADD		
			git apply $PATCH_FOLDER/$CURRENT_PATCH

			echo "Запаковка classes.dex"
			smali a $TEMP_SMALI_FOLDER -o classes.dex			

			rm -rf $TEMP_SMALI_FOLDER

			zip -rqq ../$CURRENT_PATCH.apk *

			cd ..

			echo "Копирование пропатченного файла $CURRENT_PATCH.apk в $CURRENT_PATH"
			cp $CURRENT_PATCH.apk $CURRENT_PATH
			cd $PATCH_FOLDER

			echo "Готово"
		fi	
done

echo "Запаковка в финальный архив"

cd $MIUI_FOLDER

PREFFIX_FOR_ZIP=$PREFFIX_FOR_ZIP$F

echo "Архив $PREFFIX_FOR_ZIP"
zip -rqq ../$PREFFIX_FOR_ZIP *

echo "Готово..."

DATE_END=$(date +"%s")
DIFF=$(($DATE_END - $DATE_START))
echo "Время: $(($DIFF / 60)) минут и $(($DIFF % 60)) секунд."

cd $GIT_FOLDER