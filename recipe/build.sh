#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

# we need librt
if [[ "${target_platform}" == linux-* ]] ; then
    export LDFLAGS="-lrt ${LDFLAGS}"
fi

cmake -B scipoptsuite-build -S "${SRC_DIR}/scipoptsuite" \
      -D CMAKE_BUILD_TYPE=Release \
      -D PARASCIP=ON \
      -D PAPILO=ON \
      -D SOPLEX=ON \
      -D GCG=ON \
      -D ZIMPL=ON \
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
      ${CMAKE_ARGS}
cmake --build scipoptsuite-build --parallel ${CPU_COUNT}
cmake --install scipoptsuite-build --prefix "${PREFIX}"
