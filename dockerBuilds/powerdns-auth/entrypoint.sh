#!/bin/bash
set -e

# Run pdns server
trap "pdns_control quit" SIGHUP SIGINT SIGTERM

pdns_server "$@" &

wait
