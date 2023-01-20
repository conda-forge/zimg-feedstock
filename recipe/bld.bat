msbuild _msvc\dll\dll.vcxproj -targets

msbuild _msvc\zimg.sln -targets

MSBuild.exe _msvc\zimg.sln /t:dll\dll:Build /p:Configuration=Release /p:OutputPath="output\"
if %ERRORLEVEL% neq 0 exit 1

dir output\
