@echo off
echo.I AM A CHRISTIAN + + ++ + ++ +  ++  ++ + + + + ++ + +
RE S ME SEiNNE
mode 40,20
color 6f
title Youtube URL Grabber...
set /a timer=0
echo.Monitoring Clipboard URLs...
echo.[%temp_history%: Temp
echo.%MainHistory%: Main History]
set /a firsttime=0
set temp_history=lastclip.txt
set MainHistory=Allthehistory.txt
set YoutubeURL=youtube.url.txt
del %temp_history%
goto continue
:re-punch
if %firsttime%==1 echo.Re-punching
if %firsttime%==0 set /a firsttime=1
for /f "tokens=*" %%i in ('date /t') do set dateis=%%i
for /f "tokens=*" %%i in ('time /t') do set timeis=%%i

if EXIST %temp_history% for /f "delims=" %%i in ('type %temp_history%') do powershell -c "$string='%%i';$string | select-string -pattern 'https://(www\.)?youtube\.com/watch\?v=([A-Za-z0-9])+' | ForEach-Object { $_.Matches.Groups[0].Value }" 1>>%youtubeurl% 2>NUL
for  %%i in (youtube.url.txt) do set /a utub=%%~zi
if %utub% NEQ 0 if EXIST %youtubeurl% Echo.WRITING URL
REM if %utub% NEQ 0 if EXIST %youtubeurl% echo.%dateis% %timeis%>>%MainHistory%
if %utub% NEQ 0 if EXIST %youtubeurl%  for /f "delims=" %%i in ('type %youtubeurl%') do echo %%i >>%mainhistory%
REM if %utub% NEQ 0 if EXIST %youtubeurl% echo.>>%MainHistory%
REM if %utub% NEQ 0 if EXIST %youtubeurl% echo...>>%MainHistory%
DEL %youtubeurl%
for /f "tokens=3 delims= " %%i in ('dir /s  %temp_history% ^| find "1 File(s)" ') do set filesize=%%i
set filesize=%filesize:,=%

set oldfilesize=%filesize%
set /a timer=0
:continue
set /a timer+=1
powershell -c "get-clipboard | Out-File -FilePath %temp_history%"



if %timer%==4 cls&echo.Monitoring Clipboard URLS...
if EXIST %temp_history% for /f "tokens=3 delims= " %%i in ('dir /s  %temp_history% ^| find "1 File(s)" ') do set filesize=%%i
set filesize=%filesize:,=%


if "%oldfilesize%" NEQ "%filesize%" goto re-punch
if "%oldfilesize%"=="%filesize%"  goto continue
