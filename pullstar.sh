#!/bin/sh

node scripts/starred_repos.js $1 | ./scripts/main.sh $2
