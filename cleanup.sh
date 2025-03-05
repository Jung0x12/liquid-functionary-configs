#!/bin/bash

for i in 01 02;do
    elements-cli -datadir=$PWD/$i/elements/ stop
done
sleep 1

killall elementsd
killall blocksigner

sleep 1

for i in 01 02;do
    rm -rf $PWD/$i/elements/liquidregtest
    rm -rf $PWD/$i/blocksigner/debug.log
done
