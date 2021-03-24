echo cmake_minimum_required(VERSION 3.0) \n >> CMakeLists.txt
if errorlevel 1 exit 1
echo . >> CMakeLists.txt
if errorlevel 1 exit 1
echo find_package(SOPLEX REQUIRED) >> CMakeLists.txt
if errorlevel 1 exit 1
echo target_link_libraries(example PUBLIC libsoplex) >> CMakeLists.txt
if errorlevel 1 exit 1

cmake -G"NMake Makefiles" -B build
if errorlevel 1 exit 1
cmake --build build --parallel ${CPU_COUNT}
if errorlevel 1 exit 1
.\build\example
if errorlevel 1 exit 1

soplex --version
if errorlevel 1 exit 1