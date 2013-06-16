#!/bin/sh

if [ ! -d "$1/github.com" ]; then
	mkdir $1/github.com
fi

while read p; do 
	echo $p
	./scripts/get_update_repo.sh $p $1
done