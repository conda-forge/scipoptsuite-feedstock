cmake -G"NMake Makefiles" -B build -S scipoptsuite/scip/examples/Queens -D CMAKE_BUILD_TYPE=Release
if errorlevel 1 exit 1

cmake --build build --parallel "%CPU_COUNT%"
if errorlevel 1 exit 1

.\build\queens 5
if errorlevel 1 exit 1
scip --version
if errorlevel 1 exit 1
scip --version | Select-String -Pattern 'Ipopt\s+[0-9]+\.[0-9]+\.[0-9]+' -CaseSensitive
if errorlevel 1 exit 1
