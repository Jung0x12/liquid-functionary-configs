target_addr=$1

echo "Sending native tokens to: $target_addr"

# --- Send coins ---
elements-cli -datadir="$PWD/01/elements" sendtoaddress $target_addr 1 "" "" true


