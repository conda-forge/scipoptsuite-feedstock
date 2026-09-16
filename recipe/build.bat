@echo on

rem Common cmake-project-include for winflexbison and GMP DLL decorations
set "CMAKE_ARGS=%CMAKE_ARGS% -DCMAKE_PROJECT_TOP_LEVEL_INCLUDES=%RECIPE_DIR%\cmake-project-include.cmake"

if "%PKG_NAME%" == "libpapilo-static" goto libpapilo-static
if "%PKG_NAME%" == "papilo" goto papilo
if "%PKG_NAME%" == "soplex" goto soplex
if "%PKG_NAME%" == "zimpl" goto zimpl
if "%PKG_NAME%" == "scip" goto scip
if "%PKG_NAME%" == "gcg" goto gcg

echo Unknown package: %PKG_NAME%
exit 1


:libpapilo-static
rem Two step build: library only, no executables (breaks circular dep with scip)
cmake -B build -S "%SRC_DIR%\scipoptsuite\papilo" -G Ninja ^
    %CMAKE_ARGS% ^
    -D PAPILO_NO_BINARIES=ON ^
    -D SCIP=OFF ^
    -D TBB=ON ^
    -D TBB_DOWNLOAD=OFF ^
    -D INSTALL_TBB=OFF ^
    -D GMP=ON ^
    -D QUADMATH=OFF ^
    -D LUSOL=OFF ^
    -D SOPLEX=OFF ^
    -D BUILD_TESTING=OFF
if %ERRORLEVEL% neq 0 exit 1

cmake --build build --parallel %CPU_COUNT%
if %ERRORLEVEL% neq 0 exit 1

cmake --install build --prefix "%LIBRARY_PREFIX%"
if %ERRORLEVEL% neq 0 exit 1
goto :EOF


:papilo
rem Papilo executable, built after scip is available
cmake -B build -S "%SRC_DIR%\scipoptsuite\papilo" -G Ninja ^
    %CMAKE_ARGS% ^
    -D PAPILO_NO_BINARIES=OFF ^
    -D SCIP=ON ^
    -D HIGHS=ON ^
    -D TBB=ON ^
    -D TBB_DOWNLOAD=OFF ^
    -D INSTALL_TBB=OFF ^
    -D GMP=ON ^
    -D QUADMATH=OFF ^
    -D LUSOL=OFF ^
    -D SOPLEX=OFF ^
    -D BUILD_TESTING=OFF
if %ERRORLEVEL% neq 0 exit 1

cmake --build build --parallel %CPU_COUNT%
if %ERRORLEVEL% neq 0 exit 1

rem Only install the executable, not the library
cmake --install build --prefix local
if %ERRORLEVEL% neq 0 exit 1
mkdir "%LIBRARY_PREFIX%\bin"
copy local\bin\* "%LIBRARY_PREFIX%\bin\"
if %ERRORLEVEL% neq 0 exit 1
goto :EOF


:soplex
cmake -B build -S "%SRC_DIR%\scipoptsuite\soplex" -G Ninja ^
    %CMAKE_ARGS% ^
    -D ZLIB=ON ^
    -D GMP=ON ^
    -D STATIC_GMP=OFF ^
    -D BOOST=ON ^
    -D Boost_USE_STATIC_LIBS=OFF ^
    -D QUADMATH=OFF ^
    -D MPFR=ON ^
    -D PAPILO=ON ^
    -D PAPILO_DIR="%LIBRARY_PREFIX%" ^
    -D LTO=ON ^
    -D BUILD_TESTING=OFF
if %ERRORLEVEL% neq 0 exit 1

cmake --build build --parallel %CPU_COUNT%
if %ERRORLEVEL% neq 0 exit 1

cmake --install build --prefix "%LIBRARY_PREFIX%"
if %ERRORLEVEL% neq 0 exit 1
goto :EOF


:zimpl
cmake -B build -S "%SRC_DIR%\scipoptsuite\zimpl" -G Ninja ^
    %CMAKE_ARGS% ^
    -D ZLIB=ON ^
    -D BUILD_TESTING=OFF
if %ERRORLEVEL% neq 0 exit 1

cmake --build build --parallel %CPU_COUNT%
if %ERRORLEVEL% neq 0 exit 1

cmake --install build --prefix "%LIBRARY_PREFIX%"
if %ERRORLEVEL% neq 0 exit 1

goto :EOF


:scip

cmake -B build -S "%SRC_DIR%\scipoptsuite\scip" -G Ninja ^
    %CMAKE_ARGS% ^
    -D ZLIB=ON ^
    -D GMP=ON ^
    -D READLINE=OFF ^
    -D STATIC_GMP=OFF ^
    -D ZIMPL=ON ^
    -D ZIMPL_DIR="%LIBRARY_PREFIX%" ^
    -D PAPILO=ON ^
    -D PAPILO_DIR="%LIBRARY_PREFIX%" ^
    -D LPS=spx ^
    -D soplex_DIR="%LIBRARY_PREFIX%" ^
    -D SYM=snauty ^
    -D THREADSAFE=ON ^
    -D LTO=ON ^
    -D BUILD_TESTING=OFF
if %ERRORLEVEL% neq 0 exit 1

cmake --build build --parallel %CPU_COUNT%
if %ERRORLEVEL% neq 0 exit 1

cmake --install build --prefix "%LIBRARY_PREFIX%"
if %ERRORLEVEL% neq 0 exit 1
goto :EOF


:gcg
rem snauty is vendored by scip; point to scip's source for headers
rem -openmp:llvm is required for atomic read/update pragmas used by gcg
set "CXXFLAGS=%CXXFLAGS% /I%CD%\scipoptsuite\scip\src -openmp:llvm"
set "CFLAGS=%CFLAGS% -openmp:llvm"
set "CMAKE_ARGS=%CMAKE_ARGS% -DSCIPOptSuite_SOURCE_DIR=%SRC_DIR%\scipoptsuite"

cmake -B build -S "%SRC_DIR%\scipoptsuite\gcg" -G Ninja ^
    %CMAKE_ARGS% ^
    -D SCIP_DIR="%LIBRARY_PREFIX%" ^
    -D PAPILO_DIR="%LIBRARY_PREFIX%" ^
    -D GMP=ON ^
    -D OPENMP=ON ^
    -D STATIC_GMP=OFF ^
    -D CLIQUER=OFF ^
    -D JANSSON=ON ^
    -D STATIC_JANSSON=ON ^
    -D HIGHS=ON ^
    -D SYM=snauty ^
    -D LTO=ON ^
    -D BUILD_TESTING=OFF
if %ERRORLEVEL% neq 0 exit 1

cmake --build build --parallel %CPU_COUNT%
if %ERRORLEVEL% neq 0 exit 1

cmake --install build --prefix "%LIBRARY_PREFIX%"
if %ERRORLEVEL% neq 0 exit 1
goto :EOF
