@echo off
title Rotina de backups automatico
set hora=%time:~0,2%
if %hora%== 0 set hora=00
if %hora%== 1 set hora=01
if %hora%== 2 set hora=02
if %hora%== 3 set hora=03
if %hora%== 4 set hora=04
if %hora%== 5 set hora=05
if %hora%== 6 set hora=06
if %hora%== 7 set hora=07
if %hora%== 8 set hora=08
if %hora%== 9 set hora=09
set data=%date:~0,2%
if %data%== 0 set data=00
if %data%== 1 set data=01
if %data%== 2 set data=02
if %data%== 3 set data=03
if %data%== 4 set data=04
if %data%== 5 set data=05
if %data%== 6 set data=06
if %data%== 7 set data=07
if %data%== 8 set data=08
if %data%== 9 set data=09
set file=SIP_%data:~0,2%%date:~3,2%%date:~6,4%_%hora:~0,2%%time:~3,2%%time:~6,2%
set locationbackup=C:\
set locationfile=%locationbackup%%file%.FBK
echo [BACKUP] INICIANDO BACKUP AUTOMATICO...
echo [BACKUP] REALIZANDO BACKUP, POR FAVOR, AGUARDE...
caminho-para-gbek.exe -t -user usuario -password passaword ipbanco:banco %locationfile%
cd %locationbackup%
Rar a %file%.rar %file%.FBK
del %file%.FBK
echo [BACKUP] BACKUP FINALIZADO
echo [BACKUP] LOCALIZACAO DO BACKUP -^> %locationbackup%%file%.rar