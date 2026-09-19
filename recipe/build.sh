#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset
set -x

# we need librt
if [[ "${target_platform}" == linux-* ]] ; then
    export LDFLAGS="-lrt -lm ${LDFLAGS}"
    # find_library(libm m) links with absolute path, generating wrong cmake traget
    # files, while likely unneeded in the public interface
    export CMAKE_ARGS="${CMAKE_ARGS} -Dlibm=NOTFOUND"
fi

if [[ $PKG_NAME == *papilo* ]]; then

  # Two step build, we only add papilo executable dependencies later on to
  # break the circular dependency between papilo and scip.
  if [[ $PKG_NAME == "libpapilo-static" ]]; then
    export CMAKE_ARGS="${CMAKE_ARGS} -D PAPILO_NO_BINARIES=ON -D SCIP=OFF"
  else
    export CMAKE_ARGS="${CMAKE_ARGS} -D PAPILO_NO_BINARIES=OFF -D SCIP=ON -D HIGHS=ON"
  fi

  cmake -B build/ -S "${SRC_DIR}/scipoptsuite/papilo" -G Ninja \
    ${CMAKE_ARGS} \
    -D TBB=ON \
    -D TBB_DOWNLOAD=OFF \
    -D INSTALL_TBB=OFF \
    -D GMP=ON \
    -D QUADMATH=ON \
    -D LUSOL=ON \
    -D SOPLEX=OFF \
    -D BUILD_TESTING=OFF
  cmake --build build/ --parallel ${CPU_COUNT}

  if [[ $PKG_NAME == "libpapilo-static" ]]; then
    cmake --install build/ --prefix "${PREFIX}"
  else
    cmake --install build/ --prefix local/
    mkdir -p "${PREFIX}/bin/"
    cp local/bin/* "${PREFIX}/bin/"
  fi

elif [[ $PKG_NAME == "soplex" ]]; then

  cmake -B build/ -S "${SRC_DIR}/scipoptsuite/soplex" -G Ninja \
    ${CMAKE_ARGS} \
    -D ZLIB=ON \
    -D GMP=ON \
    -D STATIC_GMP=OFF \
    -D BOOST=ON \
    -D QUADMATH=ON \
    -D MPFR=ON \
    -D PAPILO=ON \
    -D PAPILO_DIR="${PREFIX}" \
    -D LTO=ON \
    -D BUILD_TESTING=OFF
  cmake --build build/ --parallel ${CPU_COUNT}
  cmake --install build/ --prefix "${PREFIX}"

elif [[ $PKG_NAME == "zimpl" ]]; then

  cmake -B build/ -S "${SRC_DIR}/scipoptsuite/zimpl" -G Ninja \
    ${CMAKE_ARGS} \
    -D ZLIB=ON \
    -D BUILD_TESTING=OFF
  cmake --build build/ --parallel ${CPU_COUNT}
  cmake --install build/ --prefix "${PREFIX}"

elif [[ $PKG_NAME == "scip" ]]; then

  # TODO: other options to investigate are
  #   - a LPS build matrix including HIGHS
  # We disable readline to ensure no copyleft issues
  # LAPACK is only useful for IPOPT=OFF.
  # SYM="snauty" is currently considered to be best on average.
  cmake -B build/ -S "${SRC_DIR}/scipoptsuite/scip" -G Ninja \
    ${CMAKE_ARGS} \
    -D ZLIB=ON \
    -D GMP=ON \
    -D READLINE=OFF \
    -D STATIC_GMP=OFF \
    -D ZIMPL=ON \
    -D ZIMPL_DIR="${PREFIX}" \
    -D PAPILO=ON \
    -D PAPILO_DIR="${PREFIX}" \
    -D LPS="spx" \
    -D SOPLEX_DIR="${PREFIX}" \
    -D SYM="snauty" \
    -D IPOPT=ON \
    -D AMPL=ON \
    -D THREADSAFE=ON \
    -D LTO=ON \
    -D BUILD_TESTING=OFF
  cmake --build build/ --parallel ${CPU_COUNT}
  cmake --install build/ --prefix "${PREFIX}"


elif [[ $PKG_NAME == "gcg" ]]; then
  # Default symetry is snauty, which is vendored by scip.
  # To use it without the monolithic build we need to point it to scip vendored version.
  # TODO: use the conda-forge `nauty` package, but we need to add a FindNauty.cmake.
  export CXXFLAGS="${CXXFLAGS} -isystem ${PWD}/scipoptsuite/scip/src/"
  export CMAKE_ARGS="${CMAKE_ARGS} -D SCIPOptSuite_SOURCE_DIR=${SRC_DIR}/scipoptsuite"

  # SYM="snauty" is currently considered to be best on average.
  # We disable GSL and HMetis to ensure no copyleft issues
  cmake -B build/ -S "${SRC_DIR}/scipoptsuite/gcg" -G Ninja \
    ${CMAKE_ARGS} \
    -D SCIP_DIR="${PREFIX}" \
    -D PAPILO_DIR="${PREFIX}" \
    -D GMP=ON \
    -D OPENMP=ON \
    -D STATIC_GMP=OFF \
    -D CLIQUER=ON \
    -D JANSSON=ON \
    -D HIGHS=ON\
    -D SYM="snauty" \
    -D LTO=ON \
    -D BUILD_TESTING=OFF

  cmake --build build/ --parallel ${CPU_COUNT}
  cmake --install build/ --prefix "${PREFIX}"

fi
