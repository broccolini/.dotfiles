#!/bin/sh

set -e

# Update atom packages
apm --no-confirm upgrade
apm list --installed --bare | sed -e "s/@[0-9]*.[0-9]*.[0-9]*$//g" > ~/.atom/atom-packages
