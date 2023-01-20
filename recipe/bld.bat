MSBuild.exe _msvc\zimg.sln /t:dll /p:Configuration=Release
if %ERRORLEVEL% neq 0 exit 1

set OUTPUT_DIR=_msvc\x64\Release

rem The outputs are renamed to be the same as autotools output
mv %OUTPUT_DIR%\z.dll %LIBRARY_BIN%\zimg.dll
mv %OUTPUT_DIR%\z_imp.lib %LIBRARY_LIB%\zimg.lib
del %OUTPUT_DIR%\z.lib
del %OUTPUT_DIR%\z_imp.exp

rem Future releases might add targets and they should be properly handled
rmdir %OUTPUT_DIR%
if %ERRORLEVEL% neq 0 exit 1

copy %SRC_DIR%\src\zimg\api\zimg.h %LIBRARY_INC%\zimg.h
copy %SRC_DIR%\src\zimg\api\zimg++.hpp %LIBRARY_INC%\zimg++.hpp

mkdir %LIBRARY_LIB%\pkgconfig
copy %SRC_DIR%\zimg.pc %LIBRARY_LIB%\pkgconfig
