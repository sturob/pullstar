#!/bin/sh

if [ ! $3 ]; then
	echo Specify a directory to pull repos to
fi

TARGET="$3/github.com"

user=$(echo $1 | cut -f1 -d\/)
project=$(echo $1 | cut -f2 -d\/)

if [ ! -d "$TARGET/$user" ]; then
	mkdir $TARGET/$user
	echo mkdir $TARGET/$user
fi

cd $TARGET/$user

if [ ! -d "$TARGET/$user/$project" ]; then
	git clone $2
else
	cd $project
	git pull
fi