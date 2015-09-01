#!/bin/sh

yes N | rbenv install $(cat ~/.ruby-version)
rbenv global $(cat ~/.ruby-version)

gems=(
  jekyll
  rubocop
  scss_lint
)

for i in "${gems[@]}"
do
	gem install $i
done
