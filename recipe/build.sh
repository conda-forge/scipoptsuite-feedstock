#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset
set -x

# we need librt
if [[ "${target_platform}" == linux-* ]] ; then
    export LDFLAGS="-lrt ${LDFLAGS}"
fi

cmake -B scipoptsuite-build -S "${SRC_DIR}/scipoptsuite" \
      -G Ninja \
      -D CMAKE_BUILD_TYPE=Release \
      -D LTO=ON \
      -D PAPILO=ON \
      -D SOPLEX=ON \
      -D GCG=ON \
      -D ZIMPL=ON \
      -D UG=OFF \
      -D BOOST=ON \
      -D GMP=ON \
      -D HIGHS=ON \
      -D QUADMATH=ON \
      -D IPOPT=ON \
      -D IPOPT_DIR="${PREFIX}" \
      -D ZLIB=ON \
      -D READLINE=OFF \
      -D CLIQUER=ON \
      -D OPENMP=ON \
      ${CMAKE_ARGS}
cmake --build scipoptsuite-build --parallel ${CPU_COUNT}
cmake --install scipoptsuite-build --prefix "${PREFIX}"
