#!/bin/sh

while read p; do 
	echo $p
	./scripts/get_update_repo.sh $p
done