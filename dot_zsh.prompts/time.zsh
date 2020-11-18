function preexec() {
  timer=${timer:-$SECONDS}
}

function precmd() {
  if [ $timer ]; then
    timer_show=$(($SECONDS - $timer))
    ZSH_EXEC_TIME=$(($SECONDS - $timer))
    unset timer
  else
    ZSH_EXEC_TIME=0
  fi
}
