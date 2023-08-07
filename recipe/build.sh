#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

# we need librt
if [[ "${target_platform}" == linux-* ]] ; then
    export LDFLAGS="-lrt ${LDFLAGS}"
fi

if [[ $target_platform == "osx-arm64" ]]; then
    ZIMPL_SET=OFF
else
    ZIMPL_SET=ON
fi

cmake -B scipoptsuite-build -S "${SRC_DIR}/scipoptsuite" \
      -D CMAKE_BUILD_TYPE=Release \
      -D PARASCIP=ON \
      -D PAPILO=ON \
      -D SOPLEX=ON \
      -D GCG=ON \
      -D ZIMPL=$ZIMPL_SET \
      -D BOOST=ON \
      -D GMP=ON \
      -D QUADMATH=ON \
      -D IPOPT=ON \
      -D IPOPT_DIR="${PREFIX}" \
      -D ZLIB=ON \
      -D READLINE=OFF \
      -D SYM=bliss \
      -D EXPRINT=cppad \
      -D CLIQUER=ON \
      -D CMAKE_INSTALL_LIBDIR=$PREFIX/lib
cmake --build scipoptsuite-build --parallel ${CPU_COUNT}
cmake --install scipoptsuite-build --prefix "${PREFIX}"
