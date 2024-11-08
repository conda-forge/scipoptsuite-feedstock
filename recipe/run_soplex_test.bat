echo cmake_minimum_required(VERSION 3.0) >> CMakeLists.txt
echo project(SoplexExample) >> CMakeLists.txt
echo find_package(SOPLEX REQUIRED) >> CMakeLists.txt
echo # Soplex needs papilo but does not add it >> CMakeLists.txt
echo find_package(papilo REQUIRED) >> CMakeLists.txt
echo set(CMAKE_CXX_STANDARD 14) >> CMakeLists.txt
echo add_executable(example scipoptsuite/soplex/src/example.cpp) >> CMakeLists.txt
echo target_link_libraries(example PUBLIC libsoplex papilo) >> CMakeLists.txt
echo target_link_libraries(example PUBLIC libsoplex) >> CMakeLists.txt
if errorlevel 1 exit 1

cmake -G Ninja -B build -D CMAKE_BUILD_TYPE=Release %CMAKE_ARGS%
if errorlevel 1 exit 1
cmake --build build --parallel "%CPU_COUNT%"
if errorlevel 1 exit 1
.\build\example
if errorlevel 1 exit 1

soplex --version
if errorlevel 1 exit 1
