#!/bin/bash

# this file is the main entry point for creating a swift container

if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
  echo "usage: $0 [image-name] [release|debug]" >&2
  exit
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}" )" && pwd)"
exec buildah unshare "${SCRIPT_DIR}/swift-build" $@
