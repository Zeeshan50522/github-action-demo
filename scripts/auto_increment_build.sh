#!/bin/bash

SERVICE=$1
UPDATE=$2

if [ -z "${UPDATE}" ]; then
  echo "Not defined whether to increment BUILD or PATCH version. Please try again..";
  exit 1;
fi

OLD_VERSION_V=`cat tracker/$SERVICE.version`
VERSION_SPLIT=(${OLD_VERSION_V//;/ })

MAIN_VERSION="${VERSION_SPLIT[0]}"
PRE_RELEASE_VERSION="${VERSION_SPLIT[1]}"
BUILD_VERSION="${VERSION_SPLIT[2]}" 

BUILD_SPLIT=(${BUILD_VERSION//./ })
BUILD_OLD_VERSION="${BUILD_SPLIT[1]}"
BUILD_NEW_VERSION=`expr $BUILD_OLD_VERSION + 1`

NEW_VERSION="${MAIN_VERSION};${PRE_RELEASE_VERSION};build.${BUILD_NEW_VERSION}"
sed -i "s/.*/$NEW_VERSION/" tracker/$SERVICE.version
