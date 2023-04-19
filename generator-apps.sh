#!/usr/bin/env bash

generate () {
	NUMBER_OF_WAVES=$(($1/$3))
	CURRENT_WAVE=$((items_per_wave*-1))
	STEP=0
	CURRENT_ITEM_X_PAGE=1


	for(( i=0; i<$1; i++ ))
	do
		APP_NUMBER=$(($2 + $i))
		FULLNAME=nginx-application-$APP_NUMBER
		echo $FULLNAME
		if [ $CURRENT_ITEM_X_PAGE -gt $items_per_wave ]
		then
			CURRENT_ITEM_X_PAGE=1
			CURRENT_WAVE=$(($CURRENT_WAVE + 1))
		else
			CURRENT_ITEM_X_PAGE=$(($CURRENT_ITEM_X_PAGE + 1))
		fi
		cp ./template-apps/nginx-application-base.yaml ./org-distribution/templates/$FULLNAME.yaml
		find ./org-distribution/templates/$FULLNAME.yaml -type f -exec sed -i '' -e 's/appnumber/'"$APP_NUMBER"'/g' {} \;
		find ./org-distribution/templates/$FULLNAME.yaml -type f -exec sed -i '' -e 's/wavelevel/'"$CURRENT_WAVE"'/g' {} \;
	done
}


read -p "number_of_applications: " number_of_applications
read -p "base_of_applications: " base_of_applications
read -p "items_per_wave: " items_per_wave
generate number_of_applications base_of_applications items_per_wave