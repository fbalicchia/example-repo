#!/usr/bin/env bash


DEST_NAME="org-"
generate () {
	for(( i=1; i<=$1; i++ ))
	do
		number_of_org=$(($base_of_orgs + $i))
		FULLNAME=$DEST_NAME$number_of_org
		cp -r template-org/ ./orgs/$FULLNAME
		find ./orgs/$FULLNAME -type f -exec sed -i '' -e 's/orgnumber/'"$FULLNAME"'/g' {} \;
	done
}


read -p "number_of_orgs: " number_of_orgs
read -p "base_of_orgs: " base_of_orgs

generate number_of_orgs base_of_orgs