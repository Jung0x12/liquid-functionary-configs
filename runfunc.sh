#!/bin/bash -x
for i in 01 02;do
    elementsd -datadir=$PWD/$i/elements/
done
sleep 1
for i in 01 02;do
    ~/Project/liquid-functionary/target/debug/blocksigner $PWD/$i/blocksigner/ >$PWD/$i/blocksigner/debug.log 2>&1 &
done
