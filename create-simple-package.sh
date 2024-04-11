#!/bin/bash
PROJECT_NAME=''

if [ -z "$PROJECT_NAME" ]; then
  # GET INPUT DIRECTORY NAME
  read -p "Enter package name: " PROJECT_NAME
fi

if [ -e "$PROJECT_NAME" ]; then
  echo "Directory already exists, you want continue? (y/n)"
  read -p "Enter your choice: " CHOICE
  if [ "$CHOICE" != "y" ]; then
    exit 1
  fi
else
  mkdir "$PROJECT_NAME"
fi

P0="$0"

CURRENT_PATH=${P0//.bin\//}

# COPY PROJECT DIRECT
cp -r -n $CURRENT_PATH/template "$PROJECT_NAME"

# CHANGE PACKAGE NAME IN PACKAGE.JSON
sed -i '' "s/project-name/$PROJECT_NAME/g" "$PROJECT_NAME/package.json"
