#!/bin/bash

DATE_START=$(date +"%s")
clear
F=$1

PREFFIX_FOR_ZIP="drramm_"

MIUI_FOLDER=$PWD/../miui_unpacked
GIT_FOLDER=$PWD
TEMP_RECOMPILE_FOLDER=$PWD/../miui_recomp_temp

PATCH_FOLDER=$TEMP_RECOMPILE_FOLDER/patches
TEMP_PATCH_FOLDER=$TEMP_RECOMPILE_FOLDER/another_temp_folder
PATCH_PREBUILT_FOLDER=$GIT_FOLDER/patches
PREBUILT_FLAG=yes

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

clean_all () {
	echo "Очистка временных папок"
	rm -rf $TEMP_RECOMPILE_FOLDER
	rm -rf $MIUI_FOLDER
}

unzip_rom () {
	FILE=$1
	echo
	echo "Распаковка $FILE в $MIUI_FOLDER"
	unzip -qq $FILE -d $MIUI_FOLDER
}

zip_rom () {
	FILE=$1
	echo
	echo "Запаковка в финальный архив"

	cd $MIUI_FOLDER

	PREFFIX_FOR_ZIP=$PREFFIX_FOR_ZIP$FILE

	echo "Архив $PREFFIX_FOR_ZIP"
	zip -rqq ../$PREFFIX_FOR_ZIP *
}

remove_ui_sounds () {
	echo "Удаление звуков UI"
	rm -rf $MIUI_SYSTEM/media/audio/ui
}

copy_etc () {
	echo "Копирование папки $GIT_FOLDER/system/etc в $MIUI_SYSTEM"
	echo
	cp -r $GIT_FOLDER/system/etc $MIUI_SYSTEM
}

update_patches () {

	echo "Получение папок для патчей"

	cd $STOCK_FOLDER
	COUNT_FOLDERS="$(ls -l | grep -c ^d)"

	echo "Найдено папок: $COUNT_FOLDERS"

	mkdir -p $TEMP_PATCH_FOLDER
	cd $TEMP_PATCH_FOLDER

	echo
	echo "Обновление патчей на основе разницы STOCK и MOD"
	mkdir -p $PATCH_FOLDER

	i=1
	while [ "$i" -le "$COUNT_FOLDERS" ]; do
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
			sleep 10
			i=$(( i + 1 ))
		done

	cd $PATCH_FOLDER
	COUNT_PATCHES="$(ls -1q | wc -l)"

	echo
	echo "Создано патчей: $COUNT_PATCHES "
}

apply_patches () {

	IS_PREBUILT_PATCH=$1
	echo $IS_PREBUILT_PATCH
	if [ "$IS_PREBUILT_PATCH" == "$PREBUILT_FLAG" ]
	then 
		PATCH_FOLDER=$PATCH_PREBUILT_FOLDER
	fi

	cd $PATCH_FOLDER
	COUNT_PATCHES="$(ls -1q | wc -l)"
	echo "Наложение патчей..."
	i=1
	while [ "$i" -le "$COUNT_PATCHES" ]; do
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

			sleep 10
			i=$(( i + 1 ))	
	done

	if [ "$IS_PREBUILT_PATCH" == "$PREBUILT_FLAG" ]
	then 
		PATCH_FOLDER=$TEMP_RECOMPILE_FOLDER/patches
	fi
}

while true
do	
	echo
	echo
	echo "0 - Очистка временных папок"
	echo "1 - Распаковка архива"
	echo "2 - Обновление патчей на разнице MOD/STOCK"
	echo "3 - Применение патчей на разнице MOD/STOCK"
	echo "4 - Применение патчей из папки patches"
	echo "5 - Удаление звуков UI"
	echo "6 - Копирование папки etc"
	echo "7 - Запаковка архива"
	echo "8 - 0 1 4 5 6 7"
	echo
	echo "9 - выход"
	while read -p "Выберите:" cchoice
	do
	case "$cchoice" in
		0 )
			clean_all
			echo		
			break
			;;

		1 )
			unzip_rom $F
			echo		
			break
			;;
		2 )
			update_patches
			echo		
			break
			;;
		3 )	
			apply_patches no
			echo
			break
			;;
		4 )	
			apply_patches yes
			echo
			break
			;;
		5 )	
			remove_ui_sounds
			echo
			break
			;;
		6 )	
			copy_etc
			echo
			break
			;;
		7 )	
			zip_rom $F
			echo
			break
			;;
		8 )	
			unzip_rom $F
			apply_patches yes
			remove_ui_sounds
			copy_etc
			zip_rom $F
			echo
			break
			;;
		9 )	
			exit
			break
			;;
		* )
			echo
			echo "Что-то пошло не так"
			echo
			;;
	esac
	done

	echo "Готово..."

	DATE_END=$(date +"%s")
	DIFF=$(($DATE_END - $DATE_START))
	echo "Время: $(($DIFF / 60)) минут и $(($DIFF % 60)) секунд."

	cd $GIT_FOLDER
done


