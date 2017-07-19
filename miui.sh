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
PATCH_PREBUILT_FOLDER=$GIT_FOLDER/patches

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

function unzip_rom {
	echo
	echo "Распаковка $F в $MIUI_FOLDER"
	unzip -qq $F -d $MIUI_FOLDER
}

function remove_ui_sounds {
	echo "Удаление звуков UI"
	rm -rf $MIUI_SYSTEM/media/audio/ui
}

funtion copy_etc {
	echo "Копирование папки $GIT_FOLDER/system/etc в $MIUI_SYSTEM"
	echo
	cp -r $GIT_FOLDER/system/etc $MIUI_SYSTEM
}

function update_patches {

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
}

function apply_patches {

	$IS_PREBUILT_PATCH=$1
	if [$IS_PREBUILT_PATCH == 1]
	then 
		$PATCH_FOLDER=$PATCH_PREBUILT_FOLDER
	fi

	cd $PATCH_FOLDER
	COUNT_PATCHES="$(ls -1q | wc -l)"
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

	if [$IS_PREBUILT_PATCH == 1]
	then 
		$PATCH_FOLDER=$TEMP_RECOMPILE_FOLDER/patches
	fi
}

function zip_rom {
	echo "Запаковка в финальный архив"

	cd $MIUI_FOLDER

	PREFFIX_FOR_ZIP=$PREFFIX_FOR_ZIP$F

	echo "Архив $PREFFIX_FOR_ZIP"
	zip -rqq ../$PREFFIX_FOR_ZIP *
}

echo "0 - Распаковка архива"
echo "1 - Обновление патчей на разнице MOD/STOCK"
echo "2 - Применение патчей на разнице MOD/STOCK"
echo "3 - Применение патчей из папки patches"
echo "4 - Удаление звуков UI"
echo "5 - Копирование папки etc"
echo "6 - Запаковка архива"
echo "7 - 0 3 4 5 6"

while read -p "Выберите:" cchoice
do
case "$cchoice" in
	0 )
		unzip_rom
		echo		
		break
		;;
	1 )
		update_patches
		echo		
		break
		;;
	2 )	
		apply_patches 0
		echo
		break
		;;
	3 )	
		apply_patches 1
		echo
		break
		;;
	4 )	
		remove_ui_sounds
		echo
		break
		;;
	5 )	
		copy_etc
		echo
		break
		;;
	6 )	
		zip_rom
		echo
		break
		;;
	7 )	
		unzip_rom
		apply_patches 1
		remove_ui_sounds
		copy_etc
		zip_rom
		echo
		break
		;;
	* )
		echo
		echo "Что!то пошло не так"
		echo
		;;
esac
done

echo "Готово..."

DATE_END=$(date +"%s")
DIFF=$(($DATE_END - $DATE_START))
echo "Время: $(($DIFF / 60)) минут и $(($DIFF % 60)) секунд."

cd $GIT_FOLDER