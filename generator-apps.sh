#!/usr/bin/env bash

generate () {
	for(( i=0; i<$1; i++ ))
	do
		APP_NUMBER=$(($base_of_applications + $i))
		WAVE_LEVEL=$(($i - $base_of_applications))
		FULLNAME=nginx-application-$APP_NUMBER
		echo $FULLNAME
		cp ./template-apps/nginx-application-base.yaml ./org-distribution/templates/$FULLNAME.yaml
		find ./org-distribution/templates/$FULLNAME.yaml -type f -exec sed -i '' -e 's/appnumber/'"$FULLNAME"'/g' {} \;
		find ./org-distribution/templates/$FULLNAME.yaml -type f -exec sed -i '' -e 's/wavelevel/'"$WAVE_LEVEL"'/g' {} \;
	done
}


read -p "number_of_applications: " number_of_applications
read -p "base_of_applications: " base_of_applications
echo $number_of_applications
echo $base_of_applications
generate $number_of_applications $base_of_applications