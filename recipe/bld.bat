SET LDFLAGS="%LDFLAGS% %LIBRARY_PREFIX%\lib\mpir.lib"

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

cmake -G"NMake Makefiles" ^
      -B scipoptsuite-build ^
      -S "%SRC_DIR%\scipoptsuite" ^
      -D CMAKE_BUILD_TYPE=Release ^
      -D PARASCIP=ON ^
      -D PAPILO=ON ^
      -D SOPLEX=ON ^
      -D GCG=OFF ^
      -D ZIMPL=OFF ^
      -D GMP=ON ^
      -D BOOST=ON ^
      -D IPOPT=ON ^
      -D IPOPT_DIR="%LIBRARY_PREFIX%" ^
      -D ZLIB=ON ^
      -D READLINE=OFF ^
      -D EXPRINT=cppad
      REM  Bliss not found properly on Windows, see #10
      REM  -D SYM=bliss ^
      REM  -D BLISS_DIR="bliss-install" ^
if errorlevel 1 exit 1
cmake --build scipoptsuite-build --parallel "%CPU_COUNT%"
if errorlevel 1 exit 1
cmake --install scipoptsuite-build --prefix "%LIBRARY_PREFIX%"
if errorlevel 1 exit 1
