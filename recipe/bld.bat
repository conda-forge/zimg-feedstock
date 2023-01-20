MSBuild.exe _msvc\zimg.sln /t:dll /p:Configuration=Release
if %ERRORLEVEL% neq 0 exit 1

set OUTPUT_DIR=x64\Release

mkdir %LIBRARY_BIN%
mkdir %LIBRARY_INC%
mkdir %LIBRARY_LIB%\pkgconfig

rem The outputs are renamed to be the same as autotools output
copy %OUTPUT_DIR%\z.dll %LIBRARY_BIN%\zimg.dll
copy %OUTPUT_DIR%\z_imp.lib %LIBRARY_LIB%\zimg.lib
del %OUTPUT_DIR%\z.lib
del %OUTPUT_DIR%\z_imp.exp

rem Future releases might add targets and they should be properly handled
rmdir %OUTPUT_DIR%
if %ERRORLEVEL% neq 0 exit 1

xcopy /E %SRC_DIR%\doc %LIBRARY_PREFIX%\share\doc\zimg

copy %SRC_DIR%\src\zimg\api\zimg.h %LIBRARY_INC%\zimg.h
copy %SRC_DIR%\src\zimg\api\zimg++.hpp %LIBRARY_INC%\zimg++.hpp

copy %SRC_DIR%\zimg.pc %LIBRARY_LIB%\pkgconfig
