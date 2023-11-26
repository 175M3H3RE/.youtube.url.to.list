@echo off
echo.I AM A CHRISTIAN + + ++ + ++ +  ++  ++ + + + + ++ + +
RE S ME SEiNNE
mode 40,20
color 6f
title Youtube URL List Generator...
set /a timer=0
echo.Monitoring Clipboard URLs...
echo.[%temp_history%: Temp
echo.%MainHistory%: Main History]
set /a firsttime=0
set temp_history=temp_clip.txt
set MainHistory=URl.list.urLs.txt
set YoutubeURL=youtube.url.txt
del %temp_history%
goto continue
:re-punch
if %firsttime%==1 echo.Re-punching
if %firsttime%==0 set /a firsttime=1
for /f "tokens=*" %%i in ('date /t') do set dateis=%%i
for /f "tokens=*" %%i in ('time /t') do set timeis=%%i

if EXIST %temp_history% for /f "delims=" %%i in ('type %temp_history%') do powershell -c "$string='%%i';$string | select-string -pattern 'https://(www\.)?youtube\.com/watch\?v=([A-Za-z0-9_-])+' | ForEach-Object { $_.Matches.Groups[0].Value }" 1>>%youtubeurl% 2>NUL
for  %%i in (youtube.url.txt) do set /a utub=%%~zi
if %utub% NEQ 0 if EXIST %youtubeurl% Echo.WRITING URL
REM if %utub% NEQ 0 if EXIST %youtubeurl% echo.%dateis% %timeis%>>%MainHistory%
if %utub% NEQ 0 if EXIST %youtubeurl%  for /f "delims=" %%i in ('type %youtubeurl%') do echo %%i >>%mainhistory%
REM if %utub% NEQ 0 if EXIST %youtubeurl% echo.>>%MainHistory%
REM if %utub% NEQ 0 if EXIST %youtubeurl% echo...>>%MainHistory%
DEL %youtubeurl%

for /f "tokens=*" %%I in ('certutil -hashfile "%temp_history%" MD5 ^| find /i /v "md5"') do set "currentHash=%%I"&goto negst
:negst

set oldhash=%currenthash%

REM for /f "tokens=3 delims= " %%i in ('dir /s  %temp_history% ^| find "1 File(s)" ') do set filesize=%%i
REM set filesize=%filesize:,=%

REM set oldfilesize=%filesize%
set /a timer=0
:continue
set /a timer+=1
powershell -c "get-clipboard | Out-File -FilePath %temp_history%"



if %timer%==4 cls&echo.Monitoring Clipboard URLS...
for /f "tokens=*" %%I in ('certutil -hashfile "%temp_history%" MD5 ^| find /i /v "md5"') do set "currentHash=%%I"&goto nekst
:nekst


REM if EXIST %temp_history% for /f "tokens=3 delims= " %%i in ('dir /s  %temp_history% ^| find "1 File(s)" ') do REM set filesize=%%i
REM set filesize=%filesize:,=%

if "%oldhash%" NEQ "%currenthash%" goto re-punch
if "%oldhash%"=="%currenthash%" goto continue
REM if "%oldfilesize%" NEQ "%filesize%" goto re-punch
REM if "%oldfilesize%"=="%filesize%"  goto continue
