# switch-to for netctl
switch-to() {
  if [[ -n $1 ]]; then
    `sudo netctl switch-to $1`
  else
    print 'Usage: switch-to <netctl profile>'
    exit 1
  fi
}
