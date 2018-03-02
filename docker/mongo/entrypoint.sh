#!/bin/bash

function _help {
  echo "$SERVER_INFO
Commands in interactive mode (examples):
  shell : mongo shell
"
}

function _setup {
  [[ -f .setup ]] && return

  touch .setup
}

function _start {
  _setup
  java -Dfile.encoding=UTF-8 -server -jar restheart.jar --fork
  exec mongod 
}

export -f _help _setup _start

case $1 in
  --help)  _help;;
  --start) _start;;
  shell)   exec mongo --host mongo;;
  *)       exec $@;;
esac

