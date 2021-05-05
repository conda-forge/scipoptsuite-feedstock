echo cmake_minimum_required(VERSION 3.0) >> CMakeLists.txt
echo.  >> CMakeLists.txt
echo find_package(SOPLEX REQUIRED) >> CMakeLists.txt
echo add_executable(example scipoptsuite/soplex/src/example.cpp) >> CMakeLists.txt
echo target_link_libraries(example PUBLIC libsoplex) >> CMakeLists.txt
if errorlevel 1 exit 1


cmake -G"NMake Makefiles" -B build -D CMAKE_BUILD_TYPE=Release
if errorlevel 1 exit 1
cmake --build build --parallel "%CPU_COUNT%"
if errorlevel 1 exit 1
.\build\example
if errorlevel 1 exit 1

rem Commented because soplex.exe not installed on Windows
rem soplex --version
rem if errorlevel 1 exit 1