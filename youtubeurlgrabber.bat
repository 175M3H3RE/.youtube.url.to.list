@echo off
echo.I AM A CHRISTIAN + + ++ + ++ +  ++  ++ + + + + ++ + +
RE S ME SEiNNE
mode 40,20
color 6f
title Clipboard Monitor Running..
set /a timer=0
echo.Monitoring Clipboard URLs...
echo.[LastClip.txt: Temp
echo. Allthehistory.txt: Main History]
set /a firsttime=0
set history_file=lastclip.txt
set MainHistory=Allthehistory.txt
set YoutubeURL=youtube.url.txt
del %history_file%
goto continue
:re-punch
if %firsttime%==1 echo.Re-punching
if %firsttime%==0 set /a firsttime=1
for /f "tokens=*" %%i in ('date /t') do set dateis=%%i
for /f "tokens=*" %%i in ('time /t') do set timeis=%%i

if EXIST %history_file% for /f "delims=" %%i in ('type %history_file%') do powershell -c "$string='%%i';$string | select-string -pattern 'https://(www\.)?youtube\.com/watch\?v=([A-Za-z0-9])+' | ForEach-Object { $_.Matches.Groups[0].Value }" 1>>%youtubeurl% 2>NUL
for  %%i in (youtube.url.txt) do set /a utub=%%~zi
if %utub% NEQ 0 if EXIST %youtubeurl% Echo.WRITING URL&echo.>>%MainHistory%
if %utub% NEQ 0 if EXIST %youtubeurl% echo.%dateis% %timeis%>>%MainHistory%
if %utub% NEQ 0 if EXIST %youtubeurl%  for /f "delims=" %%i in ('type %youtubeurl%') do echo %%i >>%mainhistory%
if %utub% NEQ 0 if EXIST %youtubeurl% echo.>>%MainHistory%
if %utub% NEQ 0 if EXIST %youtubeurl% echo...>>%MainHistory%
DEL %youtubeurl%
for /f "tokens=3 delims= " %%i in ('dir /s  %history_file% ^| find "1 File(s)" ') do set filesize=%%i
set filesize=%filesize:,=%

set oldfilesize=%filesize%
set /a timer=0
:continue
set /a timer+=1
powershell -c "get-clipboard | Out-File -FilePath %history_file%"



if %timer%==4 cls&echo.Monitoring Clipboard URLS...
if EXIST %history_file% for /f "tokens=3 delims= " %%i in ('dir /s  %history_file% ^| find "1 File(s)" ') do set filesize=%%i
set filesize=%filesize:,=%


if "%oldfilesize%" NEQ "%filesize%" goto re-punch
if "%oldfilesize%"=="%filesize%"  goto continue
