#!/bin/bash -x

# --- CLI functions ---
cli() {
  local idx=$1
  shift
  elements-cli -datadir="$PWD/0${idx}/elements" "$@"
}

# --- Start elementsd nodes ---
for i in 01 02;do
    elementsd -datadir=$PWD/$i/elements/
done
sleep 1

# --- Start blocksigner ---
for i in 01 02;do
    ~/Project/liquid-functionary/target/release/blocksigner $PWD/$i/blocksigner/ >$PWD/$i/blocksigner/debug.log 2>&1 &
done
sleep 1

# --- Create wallets and get addresses ---
for i in 1 2; do
  cli $i createwallet "" false false "" false false
  sleep 1
  cli $i rescanblockchain
  eval "addr$i=\$(cli $i getnewaddress)"
done
sleep 1

# --- Send coins ---
cli 1 sendtoaddress "${addr1}" 21000000 "" "" true
cli 1 sendtoaddress "${addr2}" 1 "" "" false