@REM Building the project option on for compile executable variable and generate for unix 
cmake -S . ^
-B build ^
-DCOMPILE_EXECUTABLE=ON ^
-DCMAKE_BUILD_TYPE=Debug ^
-G "Visual Studio 17 2022" ^
-A x64

@REM  Compiling the project
cmake --build ./build --config Debug

@REM  Change directory to build directory
cd build/app/Debug

@REM  Running the executable
Executable.exe

@REM Pause to keep the command prompt window open
pause