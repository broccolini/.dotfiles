dash () {
  open dash://$1
}

alias "apm-up"="apm --no-confirm upgrade && apm list --installed --bare | sed -e \"s/@[0-9]*.[0-9]*.[0-9]*$//g\" > ~/.atom/atom-packages"
