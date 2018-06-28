#!/usr/bin/env bash

set -o errexit
set -o pipefail
# set -x
BIN_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

err() {
  printf " - ERROR : [$(date +'%Y-%m-%dT%H:%M:%S%z')]: ERROR: ===> %s \\n " "$*" >&2
  exit 1
}

show_help() {
cat << EOF
Usage: ${0##*/}
Description

    -h, --help
        Display this help and exit
EOF

}

main() {
  if [[ -z "$1" ]]; then
    show_help
    exit 1
  fi

  while :; do
    case $1 in
      -h|-\?|--help)
        show_help    # Display a usage synopsis.
        exit
        ;;
      -?*)z
        err "Unknown option: $1"
        ;;
      *)               # Default case: No more options, so break out of the loop.
        err "Unknown option: $1"
    esac
    shift
  done
}
main "$@"
