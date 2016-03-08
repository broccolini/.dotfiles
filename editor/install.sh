#!/bin/sh

if ! test -e /Applications/Atom.app/
then
  echo "Installing Atom text editor"
  curl -# -L -o /tmp/atom-mac.zip $(curl -s https://api.github.com/repos/atom/atom/releases/latest | grep "/atom-mac.zip" | sed -e "s/\"//g" | sed -e "s/browser_download_url: //g")

  # in case we have a download error
  if test -e /tmp/atom-mac.zip
  then
    unzip -o -q /tmp/atom-mac.zip -d /Applications
    rm /tmp/atom-mac.zip
  fi
fi

apm install -c --packages-file ~/.atom/atom-packages
