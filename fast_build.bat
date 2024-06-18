@echo off
del /s /q bin >nul
cd .\ToF_Fishing_Bot
dotnet build -c release

xcopy /E /I "%~dp0ToF_Fishing_Bot\bin\Release\net9.0-windows" "%~dp0\bin" >nul

for %%a in (
    "%~dp0ToF_Fishing_Bot\bin"
    "%~dp0ToF_Fishing_Bot\obj"
    "%~dp0WindowsInput\bin"
    "%~dp0WindowsInput\obj"
) do (
    if exist "%%~a" (
        if exist "%%~a\*" (
            rd /s /q "%%~a"
        ) else (
            del "%%~a"
        )
    )
)

pause
taskkill /F /IM dotnet.exe >nul
exit