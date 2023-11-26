#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

cat > CMakeLists.txt << 'EOF'
cmake_minimum_required(VERSION 3.0)
project(SoplexExample)
find_package(SOPLEX REQUIRED)
# Soplex needs papilo but does not add it
find_package(papilo REQUIRED)
add_executable(example scipoptsuite/soplex/src/example.cpp)
target_link_libraries(example PUBLIC libsoplex papilo)
EOF

cmake -G Ninja -B build -D CMAKE_BUILD_TYPE=Release ${CMAKE_ARGS}

cmake --build build --parallel ${CPU_COUNT} --verbose
./build/example

soplex --version
