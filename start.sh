#!/bin/bash

git pull

FILE=allready_start
if [ -f "$FILE" ]; then
    echo "Server allready_start"
else 
    echo "$FILE does not exist."
    echo "true" > allready_start
    git add allready_start
    git commit -m "auto_add"
    git push
    java -Xmx4G -jar server.jar
    rm -f allready_start
    git add *
    git add allready_start
    git commit -m "auto_save"
    git push
fi