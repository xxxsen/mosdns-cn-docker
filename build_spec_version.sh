#!/bin/bash

repo="xxxsen/mosdns-cn"

if [ "$#" == "0" ]; then
	echo "need version, exp: $0 v1.2.1"
	exit 1
fi
isLatest=false
if [ "$#" == 2 ]; then 
	if [ "$2" == "true" ]; then
		isLatest=true
	fi	
fi
version=$1
extra=""
if [ "$isLatest" == "true" ]; then
	extra=" -t $repo:latest"
fi

echo "build version:$version, is latest:$isLatest"

docker buildx build --platform linux/amd64 --build-arg BUILD_TAG=$version -t $repo:$version $extra . --push
