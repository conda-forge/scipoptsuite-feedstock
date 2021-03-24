"%PYTHON%" setup.py install
if errorlevel 1 exit 1

set -o errexit
if errorlevel 1 exit 1
set -o pipefail
if errorlevel 1 exit 1
set -o nounset
if errorlevel 1 exit 1

cmake -B bliss-build -S "%SRC_DIR%\bliss" -D CMAKE_BUILD_TYPE=Release -D BUILD_SHARED_LIBS=OFF
if errorlevel 1 exit 1
cmake --build bliss-build --parallel %CPU_COUNT%
if errorlevel 1 exit 1
cmake --install bliss-build --prefix "%PWD%\bliss-install"
if errorlevel 1 exit 1

cmake -B scipoptsuite-build -S "%SRC_DIR%\scipoptsuite" ^
      -D CMAKE_BUILD_TYPE=Release ^
      -D PARASCIP=ON ^
      -D PAPILO=ON ^
      -D SOPLEX=ON ^
      -D GCG=ON ^
      -D ZIMPL=ON ^
      -D BOOST=ON ^
      -D GMP=ON ^
      -D QUADMATH=ON ^
      -D IPOPT=ON ^
      -D ZLIB=ON ^
      -D READLINE=ON ^
      -D SYM=bliss ^
      -D BLISS_DIR="%PWD%\bliss-install" ^
      -D EXPRINT=cppad ^
      -D GSL=ON ^
      -D CLIQUER=ON
if errorlevel 1 exit 1
cmake --build scipoptsuite-build --parallel %CPU_COUNT%
if errorlevel 1 exit 1
cmake --install scipoptsuite-build --prefix "%PREFIX%"
if errorlevel 1 exit 1