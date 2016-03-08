#!/bin/sh

# yes N | rbenv install $(cat ~/.ruby-version)
# rbenv global $(cat ~/.ruby-version)

pips=(
  proselint
)

for i in "${pips[@]}"
do
  pip install $i
done
