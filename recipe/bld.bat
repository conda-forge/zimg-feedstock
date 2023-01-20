cd _msvc

MSBuild.exe zimg.sln /t:dll:Build /p:Configuration=Release /p:OutputPath="output\"

type zimg.sln.metaproj
if %ERRORLEVEL% neq 0 exit 1

dir output\

exit 1
