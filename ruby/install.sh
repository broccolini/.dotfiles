#!/bin/sh

gems=(
  jekyll
  rubocop
  scss_lint
)

for i in "${gems[@]}"
do
	gem install $i
done
