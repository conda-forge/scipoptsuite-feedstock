cmake -G"NMake Makefiles"  ^
      -B bliss-build ^
      -S "%SRC_DIR%\bliss" ^
      -D CMAKE_BUILD_TYPE=Release ^
      -D BUILD_SHARED_LIBS=OFF
if errorlevel 1 exit 1
cmake --build bliss-build --parallel "%CPU_COUNT%"
if errorlevel 1 exit 1
cmake --install bliss-build --prefix "bliss-install"
if errorlevel 1 exit 1

set IPOPT_DIR="%LIBRARY_PREFIX%"  REM Only read from environment variable on Windows
cmake -G"NMake Makefiles" ^
      -B scipoptsuite-build ^
      -S "%SRC_DIR%\scipoptsuite" ^
      -D CMAKE_BUILD_TYPE=Release ^
      -D PARASCIP=ON ^
      -D PAPILO=ON ^
      -D SOPLEX=ON ^
      -D GCG=OFF ^
      -D ZIMPL=ON ^
      -D BOOST=ON ^
      -D IPOPT=ON ^
      -D ZLIB=ON ^
      -D SYM=bliss ^
      -D BLISS_DIR="bliss-install" ^
      -D EXPRINT=cppad
if errorlevel 1 exit 1
cmake --build scipoptsuite-build --parallel "%CPU_COUNT%"
if errorlevel 1 exit 1
cmake --install scipoptsuite-build --prefix "%LIBRARY_PREFIX%"
if errorlevel 1 exit 1
