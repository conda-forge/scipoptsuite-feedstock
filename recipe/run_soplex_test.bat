echo cmake_minimum_required(VERSION 3.0) >> CMakeLists.txt
echo.  >> CMakeLists.txt
echo find_package(SOPLEX REQUIRED) >> CMakeLists.txt
echo add_executable(example scipoptsuite/soplex/src/example.cpp) >> CMakeLists.txt
echo target_link_libraries(example PUBLIC libsoplex) >> CMakeLists.txt
if errorlevel 1 exit 1


cmake -G"NMake Makefiles" -B build
if errorlevel 1 exit 1
cmake --build build --parallel
if errorlevel 1 exit 1
.\build\example
if errorlevel 1 exit 1

soplex --version
if errorlevel 1 exit 1