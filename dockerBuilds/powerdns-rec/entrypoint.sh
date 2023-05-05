#!/bin/bash
set -e

# Run pdns server
pdns_recursor "$@" &

wait
