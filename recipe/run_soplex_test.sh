#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

export CXXFLAGS="${CXXFLAGS} -D_LIBCPP_DISABLE_AVAILABILITY"

echo "====FLAGS ARE $CXXFLAGS"

cat > CMakeLists.txt << 'EOF'
cmake_minimum_required(VERSION 3.0)
project(SoplexExample)
find_package(SOPLEX REQUIRED)
# Soplex needs papilo but does not add it
find_package(papilo REQUIRED)
add_executable(example scipoptsuite/soplex/src/example.cpp)
target_link_libraries(example PUBLIC libsoplex papilo)
EOF

cmake -B build -D CMAKE_BUILD_TYPE=Release ${CMAKE_ARGS}

echo "====CMAKECACHE is"
cat build/CMakeCache.txt
cmake --build build --parallel ${CPU_COUNT}
./build/example

soplex --version
