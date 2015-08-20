#!/bin/sh

node_modules=(
  bower
  coffee-script
  csscomb
  grunt-cli
  htmlhint
  jshint
  uglify-js
)

for i in "${node_modules[@]}"
do
	npm install -g $i
done
