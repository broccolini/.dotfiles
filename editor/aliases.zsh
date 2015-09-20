dash () {
  open dash://$1
}

alias "apm-up"="apm --no-confirm upgrade && apm list --installed --bare > ~/.atom/atom-packages"
