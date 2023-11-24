cmake -G"NMake Makefiles" ^
      -B scipoptsuite-build ^
      -S "%SRC_DIR%\scipoptsuite" ^
      -D CMAKE_BUILD_TYPE=Release ^
      -D "CMAKE_PROJECT_TOP_LEVEL_INCLUDES=%RECIPE_DIR%\cmake-project-include.cmake" ^
      -D PARASCIP=ON ^
      -D PAPILO=ON ^
      -D SOPLEX=ON ^
      -D GCG=OFF ^
      -D ZIMPL=ON ^
      -D GMP=ON ^
      -D BOOST=ON ^
      -D Boost_LIB_DIAGNOSTIC_DEFINITIONS=ON ^
      -D Boost_USE_STATIC_LIBS=OFF ^
      -D IPOPT=ON ^
      -D IPOPT_DIR="%LIBRARY_PREFIX%" ^
      -D ZLIB=ON ^
      -D READLINE=OFF ^
      -D EXPRINT=cppad ^
      -D SYM=bliss ^
      %CMAKE_ARGS%
if errorlevel 1 exit 1
cmake --build scipoptsuite-build --parallel "%CPU_COUNT%"
if errorlevel 1 exit 1
cmake --install scipoptsuite-build --prefix "%LIBRARY_PREFIX%"
if errorlevel 1 exit 1
