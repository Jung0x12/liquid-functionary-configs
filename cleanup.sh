#!/bin/bash

killall blocksigner

sleep 1

node="$1"

rm -rf "$PWD/$node/blocksigner/debug.log"
