#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

cmake -G Ninja -B build -S scipoptsuite/scip/examples/Queens ${CMAKE_ARGS}
cmake --build build --parallel ${CPU_COUNT}
./build/queens 5

scip --version

# Verifies that dependencies are properly linked
scip --version | grep -iE 'CppAD\s+[0-9]+'
scip --version | grep -iE 'ZLIB\s+[0-9]+\.[0-9]+\.[0-9]+'
scip --version | grep -iE 'GMP\s+[0-9]+\.[0-9]+\.[0-9]+'
scip --version | grep -iE 'nauty\s+[0-9]+\.[0-9]+\.[0-9]+'
scip --version | grep -iE 'Ipopt\s+[0-9]+\.[0-9]+\.[0-9]+'
