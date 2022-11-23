#!/bin/bash
set -ex

./autogen.sh
./configure --prefix="$PREFIX" --enable-shared --disable-static
if [[ "$target_platform" == "win-64" ]]
then
  patch_libtool
fi
make -j${CPU_COUNT}
make install
