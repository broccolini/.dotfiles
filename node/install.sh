#!/bin/sh

node_modules=(
  bower
  coffee-script
  csscomb
  generator-hubot
  grunt-cli
  htmlhint
  jshint
  uglify-js
  yo
)

for i in "${node_modules[@]}"
do
	npm install -g $i
done
