@echo off
setlocal EnableExtensions
set "SCRIPT_DIR=%~dp0"
for /f "tokens=1,* delims==" %%A in ('findstr /b "distributionUrl=" "%SCRIPT_DIR%.mvn\wrapper\maven-wrapper.properties"') do set "DIST_URL=%%B"
for /f "tokens=1,* delims==" %%A in ('findstr /b "distributionSha256Sum=" "%SCRIPT_DIR%.mvn\wrapper\maven-wrapper.properties"') do set "DIST_SHA=%%B"
if not defined DIST_URL (echo Missing distributionUrl & exit /b 1)
powershell -NoProfile -ExecutionPolicy Bypass -Command "$ErrorActionPreference='Stop'; $url=$env:DIST_URL; $sha=$env:DIST_SHA; $m2=if($env:MAVEN_USER_HOME){$env:MAVEN_USER_HOME}else{Join-Path $HOME '.m2'}; $archive=Split-Path $url -Leaf; $name=$archive -replace '-bin\.zip$',''; $bytes=[Text.Encoding]::UTF8.GetBytes($url); $hash=[BitConverter]::ToString([Security.Cryptography.SHA256]::Create().ComputeHash($bytes)).Replace('-','').ToLower(); $home=Join-Path $m2 ('wrapper\dists\'+$name+'\'+$hash); $mvn=Join-Path $home 'bin\mvn.cmd'; if(!(Test-Path $mvn)){ $tmp=Join-Path ([IO.Path]::GetTempPath()) ('mvnw-'+[Guid]::NewGuid()); New-Item -ItemType Directory -Path $tmp|Out-Null; $zip=Join-Path $tmp $archive; (New-Object Net.WebClient).DownloadFile($url,$zip); if($sha){$actual=(Get-FileHash $zip -Algorithm SHA256).Hash.ToLower(); if($actual -ne $sha.ToLower()){throw 'Maven distribution checksum mismatch'}}; Expand-Archive $zip $tmp; New-Item -ItemType Directory -Force -Path (Split-Path $home)|Out-Null; Move-Item (Join-Path $tmp $name) $home; Remove-Item $tmp -Recurse -Force }; & $mvn @args; exit $LASTEXITCODE" -- %*
exit /b %ERRORLEVEL%
