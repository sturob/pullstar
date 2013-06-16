#!/bin/sh

USAGE="usage: pullstar.sh <username> <code_directory>"

if [ ! $1 ]; then
	echo $USAGE
	exit
fi

if [ ! $2 ]; then
	echo "specify a directory"
	echo $USAGE
	exit
fi

if [ ! -d $2 ]; then
	echo "directory '$2' does not exist"
	echo $USAGE
	exit
fi

echo Fetching repo list...
node scripts/starred_repos.js $1 | ./scripts/main.sh $2
