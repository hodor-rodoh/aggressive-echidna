#!/usr/bin/env bash

set -o errexit
set -o pipefail
# set -x
BIN_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

command_switch() {
  # if [[ -z "$1" ]]; then
  #   show_help
  #   exit 1
  # fi

  while :; do
    case $1 in
      azure|az)
        export KUBECONFIG=~/.kube/azure # exporting my configs where they are stored for me
        kubectl config get-contexts # shows which context you are on so you dont have the confused
        ;;
      config1|c1)
        export KUBECONFIG=~/.kube/config
        kubectl config get-contexts
        ;;
      config2|c2)
        export KUBECONFIG=~/.kube/config2
        kubectl config get-contexts
        ;;
    esac
    shift
  done
}

command_unset() {
unset KUBECONFIG
exit
}

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
      -unset|-un)
        command_unset
        ;;
      -use|-u)
        command_switch $2 # uses your command to switch contexts
        shift
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
