#!/bin/bash

version=$(curl -L https://github.com/IrineSistiana/mosdns-cn/releases 2>&1 |grep "IrineSistiana/mosdns-cn/releases/download" | head -n 1 | awk -F "/" '{print $6}' |grep -i -e "v[[:digit:]]\+\.[[:digit:]]\+\.[[:digit:]]\+")

if [ "$version" == "" ]; then
	echo "invalid version..."
	exit 1
fi

bash build_spec_version.sh $version true
