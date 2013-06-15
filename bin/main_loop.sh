#!/bin/sh

while read p; do 
	echo $p
	./get_update_repo.sh $p
done