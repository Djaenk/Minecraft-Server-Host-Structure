#!/bin/sh

cd "$(dirname "$(readlink -f "$0")")/.."

VERSION=$(curl -s "https://papermc.io/api/v2/projects/waterfall" | jq -r ".versions[-1]")
BUILD=$(curl -s "https://papermc.io/api/v2/projects/waterfall/versions/$VERSION" | jq -r ".builds[-1]")

echo "Updating Waterfall Proxy..."
wget	-nv -O Waterfall/Waterfall.jar \
	https://papermc.io/api/v2/projects/waterfall/versions/$VERSION/builds/$BUILD/downloads/waterfall-$VERSION-$BUILD.jar
echo ""
