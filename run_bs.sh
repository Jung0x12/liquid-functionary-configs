node="$1"

~/liquid-functionary/target/release/blocksigner "$PWD/$node/blocksigner/" "key-$node" \
  >"$PWD/$node/blocksigner/debug.log" 2>&1 &