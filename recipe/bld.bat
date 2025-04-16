@echo on

cmake -G Ninja ^
      -B scipoptsuite-build ^
      -S "%SRC_DIR%\scipoptsuite" ^
      -D CMAKE_BUILD_TYPE=Release ^
      -D "CMAKE_PROJECT_TOP_LEVEL_INCLUDES=%RECIPE_DIR%\cmake-project-include.cmake" ^
      -D PARASCIP=ON ^
      -D PAPILO=ON ^
      -D SOPLEX=ON ^
      -D GCG=ON ^
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
      -D SYM=snauty ^
      -D CMAKE_POLICY_VERSION_MINIMUM=3.5 ^
      %CMAKE_ARGS%
if %ERRORLEVEL% neq 0 exit 1

cmake --build scipoptsuite-build
if %ERRORLEVEL% neq 0 exit 1

cmake --install scipoptsuite-build --prefix "%LIBRARY_PREFIX%"
if %ERRORLEVEL% neq 0 exit 1
