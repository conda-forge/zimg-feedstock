#!/bin/bash
set -ex

./autogen.sh
./configure --prefix="$PREFIX" --enable-shared --disable-static
if [[ "$target_platform" == "win-64" ]]
then
  patch_libtool
  cat libtool
  sed -i "s/-c -m 644/-m 644/g"
fi
make -j${CPU_COUNT}
make install
