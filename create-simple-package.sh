#!/bin/bash
DIRNAME=$1

if [ -z "$DIRNAME" ]; then
  # GET INPUT DIRECTORY NAME
  read -p "Enter directory name: " DIRNAME
fi

mkdir "$DIRNAME"

# COPY PROJECT DIRECT
cp -r ./template/* "$DIRNAME"

# CHANGE PACKAGE NAME IN PACKAGE.JSON
sed -i '' "s/emiya-project/$DIRNAME/g" "$DIRNAME/package.json"
