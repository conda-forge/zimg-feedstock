cd _msvc

set MSBuildEmitSolution=1

MSBuild.exe zimg.sln /t:dll /p:Configuration=Release /p:OutputPath="output\" & type zimg.sln.metaproj

type zimg.sln.metaproj
if %ERRORLEVEL% neq 0 exit 1

dir output\

exit 1
