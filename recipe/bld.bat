cd _msvc

MSBuild.exe zimg.sln /t:dll /p:Configuration=Release /p:OutputDir="output\"
if %ERRORLEVEL% neq 0 exit 1

dir output\
dir x64\Release\

exit 1
