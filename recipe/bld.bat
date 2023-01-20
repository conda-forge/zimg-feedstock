MSBuild.exe _msvc\zimg.sln /t:dll /p:Configuration=Release /p:OutputDir="build\"
if %ERRORLEVEL% neq 0 exit 1

copy build\z.dll %LIBRARY_BIN%\zimg.dll
copy build\z_imp.lib %LIBRARY_LIB%\zimg.lib
del build\z.lib
del build\z_imp.exp

rem Future releases might add targets and they should be properly handled
rmdir build
if %ERRORLEVEL% neq 0 exit 1

xcopy /E %SRC_DIR%\doc %LIBRARY_PREFIX%\share\doc\zimg

copy %SRC_DIR%\src\zimg\api\zimg.h %LIBRARY_INC%\zimg.h
copy %SRC_DIR%\src\zimg\api\zimg++.hpp %LIBRARY_INC%\zimg++.hpp

mkdir %LIBRARY_LIB%\pkgconfig
copy %SRC_DIR%\zimg.pc %LIBRARY_LIB%\pkgconfig
