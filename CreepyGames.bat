::    CreepyGames Batch: ZbiÛr gier i programÛw spo≥ecznoúci
::    Copyright (C) 2012-2015  by CreepyNinja_
::
::    Niniejszy program jest wolnym oprogramowaniem; moøesz go
::    rozprowadzaÊ dalej i/lub modyfikowaÊ na warunkach Powszechnej
::    Licencji Publicznej GNU, wydanej przez FundacjÍ Wolnego
::    Oprogramowania - wed≥ug wersji 3 tej Licencji lub (wed≥ug twojego
::    wyboru) ktÛrejú z pÛüniejszych wersji.
::
::    Niniejszy program rozpowszechniany jest z nadziejπ, iø bÍdzie on
::    uøyteczny - jednak BEZ JAKIEJKOLWIEK GWARANCJI, nawet domyúlnej
::    gwarancji PRZYDATNOåCI HANDLOWEJ albo PRZYDATNOåCI DO OKREåLONYCH
::    ZASTOSOWA—. W celu uzyskania bliøszych informacji siÍgnij do
::    Powszechnej Licencji Publicznej GNU.
::
::    Z pewnoúciπ wraz z niniejszym programem otrzyma≥eú teø egzemplarz
::    Powszechnej Licencji Publicznej GNU (GNU General Public License);
::    jeúli nie - zobacz <http://www.gnu.org/licenses/>.

@echo off
@setlocal enabledelayedexpansion enableextensions
@chcp 852>nul
@set MDIR=%~dp0
@goto MenuChangelogCreepyGamesEnd

::     DISCLAIMER:
::
::     Program CreepyGames(TM) oraz wszystkie jej gry i programy podlegajπ
::     prawom autorskim odpowiednim dla kaødego z tych programÛw (o ile posiadajπ).
::
::     Moøna dowolnie modyfikowaÊ oraz rozprowadzaÊ ten program oraz podprogramy
::     na warunkach licencji GNU GPL (jak napisano powyøej).
::     Touch/Hybrid Menu (mojego autorstwa) oraz wiele z obecnych tu programÛw
::     zosta≥y w 100% zrobione przeze mnie :)
::
::     Jestem rÛwnieø otwarty na nowe programy i gry do dodania do programu.
::     Mam nadziejÍ, øe uda mi siÍ dodaÊ jak najwiÍcej gier i programÛw :)
::     Warunkiem jest oczywiúcie zgoda na udostÍpnienie tego programu
::     na warunkach licencji GNU GPL.
::
::     DziÍkujÍ za przeczytanie, ~~CreepyNinja

:MenuChangelogCreepyGames
cls & mode con cols=80 lines=62 & (for %%a in (%__ChangeLog%) do echo. %%~a) & echo. & pause & goto :EOF
:MenuChangelogCreepyGamesEnd

:: Sprawdzanie Shortcut'Ûw ::
	@set __CGlanguage=
	@if /i exist Settings.ini for /f "tokens=*" %%a in (Settings.ini) do set %%a
	@set notouch=NO
	@if defined DefaultMenu if /i "%DefaultMenu%"=="Hybrid" set notouch=YES
	@if defined staticanim (set /a wait=0,wait1=0) else (set /a wait=10,wait1=25)
	@set Version=v1.4.3
	set next=
	set launch=
	set return=
	set ANSIcon_Enabled=


@set .=
@for /f %%A in ('echo Windows-8.1-Check') do set .=%%A
@if "%.%"=="" goto MenuWindows81Error
@set .=


pushd "%MDIR%"
	if /i not exist Core\ansicon.exe (
	1>&2 echo ERROR: ANSICON.exe not found.
	1>&2 echo.
	1>&2 echo Please reinstall program to repair.
	exit /b 1
	)
	if not "%~1"=="--ansicon_on" (
	if "%~x0"=="" (set "EXT=.bat") else set EXT=
	Core\ansicon.exe "%~nx0!EXT!" --ansicon_on %*
	exit /b
	)
popd

if "%~1"=="/?" call :MenuShortcutUsage & exit /b
for %%a in (%*) do (
	if defined next (
		call :MenuShortcutLaunch "%%a" || exit /b 1
		set next=
	) else (
		if "%%~a"=="--launch" (set next=%%~a) else (
		if "%%~a"=="-l" (set next=%%~a) else (
		if "%%~a"=="--notouch" (set notouch=YES) else (
		if "%%~a"=="-n" (set notouch=YES) else (
		if "%%~a"=="--touch" (set notouch=NO) else (
		if "%%~a"=="-t" (set notouch=NO) else (
		if "%%~a"=="--return" (set return=YES) else (
		if "%%~a"=="-r" (set return=YES) else (
		if "%%~a"=="--ansicon_on" (set ANSIcon_Enabled=YES) else (
			1>&2 echo ERROR: Invalid parameter "%%~a".
			1>&2 echo.
			1>&2 call :MenuShortcutUsage
			exit /b 1
		)))))))))
	)
)

if defined next (
	1>&2 echo ERROR: Missing parameter.
	1>&2 echo.
	1>&2 call :MenuShortcutUsage
	exit /b 1
)
:: Koniec sprawdzania Shortcut'Ûw ::

set LangChange=
title CreepyGames
@set BX=batbox.exe
@set Fn=Fn.dll
@set Path=%MDIR%\Core;C:\Windows\System32;C:\Windows;C:\Windows\System32\Wbem
if /i "%__CGLanguage%"=="Polski" echo [0;1;40;33mPoczekaj chwil©, àaduj© ustawienia j©zyka...[0;1;40;37m&call :LanguageSet_pl
if /i "%__CGLanguage%"=="English" echo [0;1;40;36mWait a moment, applying language settings...[0;1;40;37m&call :LanguageSet_en
if /i not "%__CGLanguage%"=="Polski" (
if /i not "%__CGLanguage%"=="English" (
call :Language))



:: Strefa zmiennych ::
call :Var
cls
%Fn% Font 9
@mode con cols=80 lines=30
if defined launch (
	%launch%
	set launch=
	if defined return goto MenuInit
	goto :Exit
)
goto MenuIntro

:Var
	@title %__Title% (%Version%)
	@set Path=%MDIR%\Core;C:\Windows\System32;C:\Windows;C:\Windows\System32\Wbem
	@set BX=batbox.exe
	@set Fn=Fn.dll
	@set wget=wget.exe
	@if /i not "%NoLoadAnim%"=="Y" (set Macro_Loading=cls^&%BX% /h 0 /o 0 0 /w 150 /d "------------------------------------------------------------------" /w 50 /g 0 0 /d "                                                                  " /g 0 1 /d "------------------------------------------------------------------" /w 50 /g 0 1 /d "                                                                  " /g 1 1 /d "%__MacroLoading%" /g 0 2 /d "------------------------------------------------------------------" /w 50 /g 0 2 /d "                                                                  " /g 0 3 "------------------------------------------------------------------" /w 50 /g 0 3 /d "[                                                                ]" /g 0 4 /d "==================================================================" /g 1 3 /c 0x04 /d "#####################" /c 0x06 /d "######################" /c 0x02 /d "#####################" /w 150 /c 0x0C /g 1 3 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /c 0x0E /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /c 0x0E /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /c 0x0A /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /c 0x0A /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 300 /c 0x0F /g 0 4 /d "                                                                  " /g 0 3 /d "------------------------------------------------------------------" /w 50 /g 0 3 /d "                                                                  " /g 0 2 /d "------------------------------------------------------------------" /w 50 /g 0 2 /d "                                                                  " /g 0 1 /d "------------------------------------------------------------------" /w 50 /g 0 1 /d "                                                                  " /g 0 0 /d "------------------------------------------------------------------" /w 50 /g 0 0 /d "                                                                  " /w 150 /h 1 /c 0x07^&cls) else (set Macro_Loading=)
goto :EOF

:MenuIntro Logo
if not exist Core\%BX% call :BatBox&goto MenuIntro
cls
if /i "%NoIntro%"=="Y" goto MenuInit
%BX% /h 0 /o 1 1 /c 0x0C /g 0 3 /d "/" /g 0 4 /d \ /w %wait% /g 1 2 /d "/" /g 1 4 /d "_" /w %wait% /g 2 1 /d "/" /g 2 3 /d "/" /g 2 4 /d "_" /w %wait% /g 3 0 /d "_" /g 3 2 /d "/" /g 3 3 /d "_" /g 3 4 /d "_" /w %wait% /g 4 0 /d "_" /g 4 1 /d "_" /g 4 3 /d "_" /g 4 4 /d "_" /w %wait% /g 5 0 /d "_" /g 5 1 /d "_" /g 5 3 /d "_" /g 5 4 /d "/" /w %wait% /g 6 0 /d "_" /g 6 1 /d "_" /g 6 4 /d "/" /w %wait% /g 7 0 /d "_" /g 7 1 /d "_" /g 7 3 /d "/" /g 7 4 /d "_" /w %wait% /g 8 0 /d "_" /g 8 1 /d "/" /g 8 2 /d "/" /g 8 4 /d "/" /w %wait% /g 9 1 /d "_" /g 9 3 /d "/" /w %wait% /g 10 1 /d "_" /g 10 2 /d "_" /w %wait% /g 11 1 /d "_" /g 11 2 /d "_" /w %wait% /g 12 1 /d "_" /g 12 2 /d "_" /w %wait% /g 13 1 /d "_" /g 13 2 /d "/" /g 13 3 /d "/" /g 13 4 /d \ /w %wait% /g 14 2 /d "/" /g 14 4 /d "_" /w %wait% /g 15 1 /d "_" /g 15 4 /d "_" /w %wait% /g 16 1 /d "_" /g 16 2 /d "_" /g 16 3 /d "_" /g 16 4 /d "_" /w %wait% /g 17 1 /d "_" /g 17 3 /d "_" /g 17 4 /d "/" /w %wait% /g 18 2 /d \ /g 18 3 /d "/" /w %wait% /g 19 3 /d "/" /g 19 4 /d \ /w %wait% /g 20 2 /d "/" /g 20 4 /d "_" /w %wait% /g 21 1 /d "_" /g 21 4 /d "_" /w %wait% /g 22 1 /d "_" /g 22 2 /d "_" /g 22 3 /d "_" /g 22 4 /d "_" /w %wait% /g 23 1 /d "_" /g 23 3 /d "_" /g 23 4 /d "/" /g 23 5 /d "/" /w %wait% /g 24 2 /d \ /g 24 3 /d "/" /g 24 4 /d "/" /g 24 5 /d "_" /w %wait% /g 25 3 /d "/" /g 25 5 /d "/" /w %wait% /g 26 2 /d "/" /g 26 4 /d "." /w %wait% /g 27 1 /d "_" /g 27 3 /d "/" /g 27 4 /d "_" /w %wait% /g 28 1 /d "_" /g 28 2 /d "_" /g 28 3 /d "_" /g 28 4 /d "_" /w %wait% /g 29 1 /d "_" /g 29 2 /d "_" /g 29 3 /d "/" /g 29 4 /d "_" /w %wait% /g 30 1 /d "_" /g 30 4 /d "/" /w %wait% /g 31 2 /d \ /g 31 3 /d "/" /g 31 5 /d "/" /w %wait% /g 32 3 /d "/" /g 32 4 /d \ /g 32 5 /d "_" /w %wait% /g 33 2 /d "/" /g 33 4 /d "_" /g 33 5 /d "_" /w %wait% /g 34 1 /d "_" /g 34 3 /d "/" /g 34 4 /d "_" /g 34 5 /d "_" /w %wait% /g 35 1 /d "_" /g 35 2 /d "/" /g 35 3 /d "_" /g 35 4 /d "," /g 35 5 /d "_" /w %wait% /g 36 3 /d "/" /g 36 5 /d "/" /w %wait% /g 37 2 /d "/" /g 37 4 /d "/" /w %wait% /g 38 1 /d "_" /g 38 3 /d "/" /w %wait% /g 39 1 /d "_" /g 39 2 /d "/" /g 39 3 /d "/" /g 39 4 /d \ /w %wait% /g 40 2 /d "/" /g 40 4 /d "_" /w %wait% /g 41 1 /d "/" /g 41 3 /d "/" /g 41 4 /d "_" /w %wait% /g 42 0 /d "_" /g 42 2 /d "/" /g 42 3 /d "_" /g 42 4 /d "_" /w %wait% /g 43 0 /d "_" /g 43 1 /d "_" /g 43 3 /d "/" /g 43 4 /d "_" /w %wait% /g 44 0 /d "_" /g 44 1 /d "_" /g 44 2 /d "_" /g 44 4 /d "/" /w %wait% /g 45 0 /d "_" /g 45 1 /d "_" /g 45 2 /d "_" /g 45 3 /d "/" /w %wait% /g 46 0 /d "_" /g 46 1 /d "_" /g 46 3 /d "/" /g 46 4 /d \ /w %wait% /g 47 0 /d "_" /g 47 1 /d "/" /g 47 2 /d "/" /g 47 4 /d "_" /w %wait% /g 48 1 /d "_" /g 48 3 /d "/" /g 48 4 /d "_" /w %wait% /g 49 1 /d "_" /g 49 2 /d "_" /g 49 3 /d "_" /g 49 4 /d "," /w %wait% /g 50 1 /d "_" /g 50 2 /d "_" /g 50 3 /d "/" /g 50 4 /d "_" /w %wait% /g 51 1 /d "_" /g 51 2 /d \ /g 51 4 /d "/" /w %wait% /g 52 2 /d "`" /g 52 3 /d "/" /g 52 4 /d "/" /w %wait% /g 53 1 /d "_" /g 53 2 /d "/" /g 53 3 /d "/" /g 53 4 /d "_" /w %wait% /g 54 2 /d "/" /g 54 4 /d "/" /w %wait% /g 55 1 /d "_" /g 55 3 /d "/" /w %wait% /g 56 1 /d "_" /g 56 2 /d "_" /g 56 4 /d "/" /w %wait% /g 57 1 /d "_" /g 57 2 /d "_" /g 57 3 /d "/" /g 57 4 /d "_" /w %wait% /g 58 1 /d "_" /g 58 2 /d \ /g 58 4 /d "/" /w %wait% /g 59 2 /d "`" /g 59 3 /d "/" /w %wait% /g 60 1 /d "_" /g 60 2 /d "_" /g 60 4 /d "/" /w %wait% /g 61 1 /d "_" /g 61 2 /d "_" /g 61 3 /d "/" /g 61 4 /d "_" /w %wait% /g 62 1 /d "_" /g 62 4 /d "/" /w %wait% /g 63 2 /d \ /g 63 3 /d "/" /w %wait% /g 64 3 /d "/" /g 64 4 /d \ /w %wait% /g 65 2 /d "/" /g 65 4 /d "_" /w %wait% /g 66 1 /d "_" /g 66 4 /d "_" /w %wait% /g 67 1 /d "_" /g 67 2 /d "_" /g 67 3 /d "_" /g 67 4 /d "_" /w %wait% /g 68 1 /d "_" /g 68 3 /d "_" /g 68 4 /d "/" /w %wait% /g 69 2 /d \ /g 69 3 /d "/" /g 69 4 /d "/" /w %wait% /g 70 3 /d "(" /g 70 4 /d "_" /w %wait% /g 71 2 /d "/" /g 71 3 /d "_" /g 71 4 /d "_" /w %wait% /g 72 1 /d "_" /g 72 3 /d "_" /g 72 4 /d "_" /w %wait% /g 73 1 /d "_" /g 73 2 /d "_" /g 73 4 /d "_" /w %wait% /g 74 1 /d "_" /g 74 2 /d "_" /g 74 4 /d "/" /w %wait% /g 75 1 /d "_" /g 75 2 /d "_" /g 75 3 /d ")" /w %wait% /g 76 1 /d "_" /g 76 2 /d "/" /g 18 8 /c 0x02 /d "%__IntroMessage%" /h 1 /c 0x0F /w 2000 /h 1

:MenuInit

	
:MenuConfig1
set CfgID=1
setlocal
set "WelcomeText=%__WelcomeText1%"

set Col1=30
set Col2=31

set MenuEntityCount=6
set Menu1Count=6
set Menu2Count=4
set Menu3Count=3
set Menu4Count=4
set Menu5Count=0
set Menu6Count=0

set Menu1Name=%__Menu1Name_1%
set Menu2Name=%__Menu2Name_1%
set Menu3Name=%__Menu3Name_1%
set Menu4Name=%__Menu4Name_1%
set Menu5Name=%__Menu5Name_1%
set Menu6Name=%__Menu6Name_1%

set "Menu5Do0=call :MenuUpdateCreepyGames"
set "Menu6Do0=goto MenuExit"

set Menu1Name1=%__Menu1Name1_1%
set Menu1Name2=%__Menu1Name2_1%
set Menu1Name3=%__Menu1Name3_1%
set Menu1Name4=%__Menu1Name4_1%
set Menu1Name5=%__Menu1Name5_1%
set Menu1Name6=%__Menu1Name6_1% (by Suchar)
set Menu1Do1=call :MS_Init
set Menu1Do2=call :WS_Init
set Menu1Do3=call :XX_BatCraft
set Menu1Do4=call :KK_Init
set Menu1Do5=call :CB_Init
set Menu1Do6=call :CB2_Init

set Menu2Name1=%__Menu2Name1_1%
set Menu2Name2=%__Menu2Name2_1%
set Menu2Name3=%__Menu2Name3_1%
set Menu2Name4=%__Menu2Name4_1%
set Menu2Do1=call :CC_Init
set Menu2Do2=call :AT_Init
set Menu2Do3=call :DB_Init
set Menu2Do4=call :PE_Init

set Menu3Name1=%__Menu3Name1_1%
set Menu3Name2=%__Menu3Name2_1% (Halted)
set Menu3Name3=%__Menu3Name3_1%
set Menu3Do1=call :PI_BatchOfPi
set Menu3Do2=
set Menu3Do3=call :SZ_Init

set Menu4Name1=%__Menu4Name1_1%
set Menu4Name2=%__Menu4Name2_1%
set Menu4Name3=%__Menu4Name3_1%
set Menu4Name4=%__Menu4Name4_1%
set Menu4Do1=call :MenuSettings
set Menu4Do2=call :MenuAboutCreepyGames
set Menu4Do3=call :MenuCreditsCreepyGames
set Menu4Do4=call :MenuConfig3

goto MenuAutoConfig

:MenuConfig3
set CfgID=3
setlocal
set "WelcomeText=%__WelcomeText3%"

set Col1=62
set Col2=0

set MenuEntityCount=3
set Menu1Count=0
set Menu2Count=0
set Menu3Count=0

set Menu1Name=%__Menu1Name_3%
set Menu2Name=%__Menu2Name_3%
set Menu3Name=%__Menu3Name_3%

set Menu1Do0=call :MenuStatsCreepyGames
set Menu2Do0=call :MenuChangelogCreepyGames
set Menu3Do0=goto :EOF


goto MenuAutoConfig

::: Poczπtek skryptu Touch/Hybrid Menu :::

:: Konfiguracja Menu ::
:MenuAutoConfig
cls
%Fn% Cursor 0
chcp 852>nul
set /a MenuEntityCount=MenuEntityCount+0
if %MenuEntityCount% LEQ 0 (
	1>&2 echo ERROR: Var 'MenuEntityCount' ^<=0
	1>&2 echo.
	1>&2 echo Program will be closed immediately.
	exit /b 1
)
if not defined color set color=0F
color %color%
cd /d "%MDIR%"
if %Col1% GTR 100 set Col1=100
if %Col2% GTR 100 set Col2=100
set /a Cols=Col1+Col2+5
if %Cols% LSS 32 set Cols=32
title %__Title% (%Version%)
set "B=                                                                                                    "
set MenuActive=0
if /i "%notouch%"=="YES" goto MenuHybridAutoConfig

set /a Lines=MenuEntityCount*4 +4
set x=0
set Menu0Get=2
for /l %%a in (1,1,%MenuEntityCount%) do set /a "a=4+4*(!Menu%%aCount!+%%a-1)"&(if !a! GTR !Lines! (set /a "y=4+4*!Menu%%aCount!"&set /a "z=4+4*%%a"&if !y! LEQ !z! (set Menu%%aReverse=Y) else set Lines=!a!))&set /a x+=4&set /a Menu%%aGet=!x!+2
set z=

set /a TextLines=Lines-3
for /l %%a in (0,1,%TextLines%) do set "Line%%a= "
set /a ColGet1=Col1+2
set /a ColGet2=Col2+ColGet1+1
set /a C=Cols/2 -14
set TitleText=-= CreepyNinja_ Touch Menu =-
set "A=ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕ"
mode con cols=%Cols% lines=%Lines%
goto Menu

:MenuHybridAutoConfig
set /a C=Cols/2 -14
set TitleText=-= CreepyNinja_ Hybrid Menu =-
set "Letters=0ABCDEFGHIJKLMNOPQRSTUVWXYZ"
set /a Lines=6+2*MenuEntityCount
for /l %%a in (1,1,%MenuEntityCount%) do set /a a=(!Menu%%aCount!)*2+6&(if !a! GTR !Lines! set Lines=!a!)
set /a TextLines=(Lines-6)/2
set /a Lines+=4
set "Line0=ƒ"
for /l %%a in (1,1,%TextLines%) do set "Line%%a= "
if !Col2! LSS 1 set Col2=1&set /a Cols=Col1+Col2+5&if !Cols! LSS 32 set Cols=32
set "A=ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ"
mode con cols=%Cols% lines=%Lines%
goto MenuHybrid
:: Koniec konfiguracji Menu ::

::: Touch Menu :::
:Menu
cls
echo.[0;1;40;32m[0;%C%H%TitleText%
echo.[0;1;40;33m%WelcomeText%[0;1;40;36m
echo  …!A:~0,%Col1%!ª%Line1:~1%
set x=1
for /l %%a in (1,1,%MenuEntityCount%) do (
	call :Menu1 %%a
)
set /a x+=1
for /l %%a in (%x%,1,%TextLines%) do echo. !B:~0,%Col1%! !Line%%a!
<nul set /p "=[0;1;40;37m"
:MenuGetInput
set Z=
for /f "tokens=1,2,3 delims= " %%a in ('%Fn% mouse') do (
	set Y=%%a
	set X=%%b
	set Z=%%c
)
if %Z% NEQ 1 if %Z% NEQ 3 goto MenuGetInput
if %X% GTR 1 (if %X% LSS %ColGet1% (
	for /l %%a in (1,1,%MenuEntityCount%) do (
		call :Menu2 %%a || (set Result=!Menu%%aDo0!&if not "!Result!"=="" goto MenuLaunch)
		if "!ok!"=="1" goto Menu
	)
) else (if !MenuActive! GTR 0 (if %X% GTR %ColGet1% (if %X% LSS %ColGet2% (
	for /l %%a in (1,1,!Menu%MenuActive%Count!) do (
		call :Menu3 %%a || (set Result=!Menu%MenuActive%Do%%a!&if not "!Result!"=="" goto MenuLaunch)
	)
)))))
goto MenuGetInput

:Menu1
set "Line= !Menu%1Name!!B:~0,%Col1%!"
set /a x+=1
echo  ∫!B:~0,%Col1%!∫!Line%x%:~1!
set /a x+=1
if !Menu%1Count! EQU 0 (if "!Menu%1Do0!"=="" (set y=) else (set y=1;)) else set y=1;
set "Line=∫[0;%Y%40;37m!Line:~0,%Col1%!"
if "%MenuActive%"=="%1" set "Line=%Line:~0,-2%[0;40;36m-^>"
echo  %Line%[0;1;40;36m∫!Line%x%:~1!
set /a x+=1
echo  ∫!B:~0,%Col1%!∫!Line%x%:~1!
set /a x+=1
if "%1"=="%MenuEntityCount%" (echo  »!A:~0,%Col1%!º!Line%x%:~1!) else (echo  Ã!A:~0,%Col1%!π!Line%x%:~1!)
goto :EOF
:Menu2
set ok=0
set /a d=%1-1
if %Y% GTR !Menu%d%Get! (if %Y% LSS !Menu%1Get! (if !Menu%1Count! LSS 1 (exit /b 1) else (
	set ok=1
	for /l %%a in (1,1,%TextLines%) do set "Line%%a= "
	if "%MenuActive%"=="%1" set MenuActive=0&goto :EOF
	if defined Menu%1Reverse (set /a "X=4*(%1-!Menu%1Count!) +1") else set /a "X=4*(%1-1) +1"
	set line!X!=…!A:~0,%Col2%!ª
	for /l %%a in (1,1,!Menu%1Count!) do (
		set /a D=%%a-1
		set "Line= !Menu%1Name%%a!                                                 "
		set /a x+=1
		set Menu%1Get!D!=!X!
		set Line!x!=∫!B:~0,%Col2%!∫
		set /a x+=1
		if "!Menu%1Do%%a!"=="" (set y=) else (set y=1;)
		set Line!x!=∫[0;!Y!40;37m!Line:~0,%Col2%![0;1;40;36m∫
		set /a x+=1
		set Line!x!=∫!B:~0,%Col2%!∫
		set /a x+=1
		if "%%a"=="!Menu%1Count!" (set Line!x!=»!A:~0,%Col2%!º) else (set Line!x!=Ã!A:~0,%Col2%!π)
		set /a Menu%1Get%%a=!x!+1
	)
	set MenuActive=%1
)))
exit /b 0
:Menu3
set /a d=%1-1
if %Y% GTR !Menu%MenuActive%Get%d%! (if %Y% LSS !Menu%MenuActive%Get%1! exit /b 1)
exit /b 0
::: Touch Menu :::

::: Hybrid Menu :::
:MenuHybrid
cls
echo.[0;1;40;32m[0;%C%H%TitleText%
echo.[0;1;40;33m%WelcomeText%
echo.
set x=!Line0:~0,%col2%!!A:~0,%col2%!
echo  [0;1;40;36mƒ!A:~0,%col1%!¬ƒ!x:~0,%col2%!
for /l %%a in (1,1,%MenuEntityCount%) do (
	echo  !B:~0,%col1%![0;1;40;36m ≥
	if !Menu%%aCount! EQU 0 (if "!Menu%%aDo0!"=="" (set y=) else (set y=1;)) else set y=1;
	set x=%%a^) !Menu%%aName!!B:~0,%col1%!
	echo  [0;!y!40;37m!x:~0,%col1%![0;1;40;36m ≥ !Line%%a!
)
if !TextLines! GTR !MenuEntityCount! (
	set /a y=MenuEntityCount+1
	for /l %%a in (!y!,1,!TextLines!) do (
		echo  !B:~0,%col1%![0;1;40;36m ≥
		echo  !B:~0,%col1%! ≥ [0;1;40;37m!Line%%a:~0,%col2%!
	)
)
echo  !B:~0,%col1%![0;1;40;36m ≥
echo  ƒ!A:~0,%col1%!¡ƒ!A:~0,%col2%![0;1;40;37m
set cho=
set /p "cho=> "
for /l %%a in (1,1,%MenuEntityCount%) do (
	if "%cho%"=="%%a" (
		if !Menu%%aCount! LEQ 0 (
			set result=!Menu%%aDo0!
		) else (
			set "Line0=ƒ"
			for /l %%A in (1,1,%TextLines%) do set "Line%%A= "
			if "%MenuActive%"=="%%a" set MenuActive=0&goto MenuHybrid
			set Line0=!Menu%%aName:~0,%col2%!:
			for /l %%A in (1,1,!Menu%%aCount!) do (
				set Line%%A=!Letters:~%%A,1!^) !Menu%%aName%%A!
				if "!Menu%%aDo%%A!"=="" (set y=) else (set y=1;)
				set Line%%A=[0;!y!40;37m!Line%%A:~0,%col2%!
			)
			set MenuActive=%%a
		)
	)
)
if not "%MenuActive%"=="0" (
	for /l %%a in (1,1,!Menu%MenuActive%Count!) do (
		if /i "%cho%"=="!Letters:~%%a,1!" set result=!Menu%MenuActive%Do%%a!
	)
)
if defined result goto MenuLaunch
goto MenuHybrid
::: Hybrid Menu :::

:MenuLaunch
endlocal & %Fn% Cursor 1 &%Result%& cls & color 0F & goto MenuConfig%CfgID%

:MenuWindows81Error
if defined ANSIcon_Enabled if not exist "%MDIR%\Core\%BX%" call :BatBox&goto Menu
cls
if not defined ANSIcon_Enabled set __MenuConflict1=I see that you are using Windows 8.1 or Linux.&set __MenuConflict2=Some commands may not work properly and screw up the program.&set __MenuConflict3=To solve this on Win8.1, launch program as administrator.
echo %__MenuConflict1%
echo %__MenuConflict2%
echo %__MenuConflict3%
pause>nul
goto :Exit

::: Koniec skryptu TouchMenu/HybridMenu :::


:MenuExit
cls
%BX% /h 0 /w 50 /c 0x0F /o 3 1 /g 0 0 /d "%__MenuExit:~0,1%" /w %wait1% /d "%__MenuExit:~1,1%" /w %wait1% /d "%__MenuExit:~2,1%" /w %wait1% /d "%__MenuExit:~3,1%" /w %wait1% /d "%__MenuExit:~4,1%" /w %wait1% /d "%__MenuExit:~5,1%" /w %wait1% /d "%__MenuExit:~6,1%" /w %wait1% /d "%__MenuExit:~7,1%" /w %wait1% /d "%__MenuExit:~8,1%" /w %wait1% /d "%__MenuExit:~9,1%" /w %wait1% /d "%__MenuExit:~10,1%" /w %wait1% /d "%__MenuExit:~11,1%" /w %wait1% /d "%__MenuExit:~12,1%" /w %wait1% /d "^!" /h 1 /w 1500 /h 0 /g 0 0 /d " " /w %wait1% /d " " /w %wait1% /d " " /w %wait1% /d " " /w %wait1% /d " " /w %wait1% /d " " /w %wait1% /d " " /w %wait1% /d " " /w %wait1% /d " " /w %wait1% /d " " /w %wait1% /d " " /w %wait1% /d " " /w %wait1% /d " " /w %wait1% /d " " /o 0 0 /g 0 0 /h 1 /w 100
goto :Exit

:MenuAboutCreepyGames
cls
for %%a in (%__About%) do echo.  %%~a
if /i "%notouch%"=="YES" (echo.&echo   %__PressToContinue%&pause>nul&goto :EOF)
echo.  …ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕª
echo   ∫                                                            ∫
echo   ∫      [0;1;40;37m%__ClickToMenu%[0;1;40;36m      ∫
echo   ∫                                                            ∫
echo   »ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕº[0;1;40;37m
%Fn% mouse >nul 2>&1 || (echo %__NoBatboxPTC%&pause>nul)
goto :EOF

:MenuCreditsCreepyGames
cls
mode con cols=66 lines=29
for %%a in (%__Credits%) do echo.  %%~a
if /i "%notouch%"=="YES" (echo.&echo   %__PressToContinue%&pause>nul&goto :EOF)
echo.  …ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕª
echo   ∫                                                            ∫
echo   ∫      [0;1;40;37m%__ClickToMenu%[0;1;40;36m      ∫
echo   ∫                                                            ∫
echo   »ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕº[0;1;40;37m
%Fn% mouse >nul 2>&1 || (echo %__NoBatboxPTC%&pause>nul)
goto :EOF

:MenuStatsCreepyGames
mode con cols=66 lines=40
setlocal

set /a ProgramCount=5+1+4+3+2
set /a Versions=8
set /a Length1=29
set /a Length2=6

set Version_1=v1.1.0
set Version_2=v1.2.0
set Version_3=v1.3.0
set Version_4=v1.3.1
set Version_5=v1.4.0
set Version_6=v1.4.1
set Version_7=v1.4.2
set Version_8=v1.4.3
set Version_1C=37
set Version_2C=32
set Version_3C=36
set Version_4C=33
set Version_5C=37
set Version_6C=32
set Version_7C=36
set Version_8C=33

set Program1=%__Menu1Name1_1%
set Program2=%__Menu1Name2_1%
set Program3=%__Menu1Name3_1%
set Program4=%__Menu1Name4_1%
set Program5=%__Menu2Name1_1%
set Program6=%__Menu2Name2_1%
set Program7=%__Menu2Name3_1%
set Program8=%__Menu2Name4_1%
set Program9=%__Menu3Name1_1%
set Program10=%__Menu3Name2_1% (old)
set Program11=%__Menu3Name3_1%
set Program12=%__Menu1Name6_1%
set Program13=%__Menu1Name5_1%
set Program14=*Touch/Hybrid Menu*
set Program15=* Interface *

set Program1_1=v1.3.0
set Program2_1=v1.1.1
set Program3_1=------
set Program4_1=
set Program5_1=v1.5.2
set Program6_1=------
set Program7_1=v0.5.0
set Program8_1=------
set Program9_1=------
set Program10_1=  v4
set Program11_1=v1.1.0
set Program12_1=
set Program14_1=  v4
set Program15_1=  v3

set Program1_2=v1.3.0
set Program2_2=v1.2.0
set Program3_2=------
set Program4_2=------
set Program5_2=v1.5.2
set Program6_2=------
set Program7_2=v0.5.0
set Program8_2=------
set Program9_2=------
set Program10_2=  v4
set Program11_2=v1.1.0
set Program12_2=
set Program14_2=  v5
set Program15_2=  v4

set Program1_3=v1.3.0
set Program2_3=v1.2.0
set Program3_3=------
set Program4_3=------
set Program5_3=v1.5.2
set Program6_3=------
set Program7_3=v0.5.0
set Program8_3=------
set Program9_3=------
set Program10_3=  v4
set Program11_3=v1.1.0
set Program12_3= v0.1
set Program14_3=  v5
set Program15_3=  v5

set Program1_4=v1.3.0
set Program2_4=v1.2.0
set Program3_4=------
set Program4_4=------
set Program5_4=v1.5.2
set Program6_4=------
set Program7_4=v0.5.0
set Program8_4=------
set Program9_4=------
set Program10_4=  v4
set Program11_4=v1.1.0
set Program12_4= v0.2
set Program14_4=  v5
set Program15_4=  v5

set Program1_5=v1.3.0
set Program2_5=v1.2.0
set Program3_5=------
set Program4_5=------
set Program5_5=v1.5.2
set Program6_5=------
set Program7_5=v0.5.0
set Program8_5=------
set Program9_5=------
set Program10_5=DELETE
set Program11_5=v1.1.0
set Program12_5=DELETE
set Program13_5=
set Program14_5=  v5
set Program15_5=  v6

set Program1_6=v1.3.0
set Program2_6=v1.2.0
set Program3_6=------
set Program4_6=------
set Program5_6=v1.5.2
set Program6_6=------
set Program7_6=v0.5.0
set Program8_6=------
set Program9_6=------
set Program10_6=
set Program11_6=v1.1.0
set Program12_6=
set Program13_6= v1.1
set Program14_6=  v5
set Program15_6=  v6

set Program1_7=v1.3.0
set Program2_7=v1.2.0
set Program3_7=------
set Program4_7=------
set Program5_7=v1.6.0
set Program6_7=------
set Program7_7=v0.5.0
set Program8_7=------
set Program9_7=------
set Program10_7=
set Program11_7=v1.1.0
set Program12_7= v0.2
set Program13_7= v1.1
set Program14_7=  v5
set Program15_7=  v6

set Program1_8=v1.3.0
set Program2_8=v1.2.0
set Program3_8=------
set Program4_8=------
set Program5_8=v1.6.0
set Program6_8=------
set Program7_8=v0.5.0
set Program8_8=------
set Program9_8=------
set Program10_8=
set Program11_8=v1.1.0
set Program12_8= v0.6
set Program13_8= v1.1
set Program14_8=  v5
set Program15_8=  v6

:: Auto-config ::
	set "A=                                                  "
	set "B=ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕ"
	set /a X=1
:MenuStats0CreepyGames
	if %X% LSS 1 set X=1
	if %X% EQU 1 (set PrevOK=0) else (set PrevOK=1)
	set /a X2=%X%+1,X3=%X%+2,X0=%X%-1
	if %X3% GTR %Versions% set /a X=%Versions%-2&goto MenuStats0CreepyGames
	if %X3% EQU %Versions% (set NextOK=0) else (set NextOK=1)
	for /l %%# in (%X%,1,%X3%) do set "VVersion_%%#=!A:~0,%Length2%!"
	for /l %%# in (1,1,%Versions%) do set VVersion_%%#=!Version_%%#!!A:~0,%Length2%!
:MenuStats1CreepyGames
	cls
	echo                  [0;1;40;32m%__MenuStats1%
	echo                  %__MenuStats2%[0;1;40;37m
	echo.
	echo  [0;%PrevOK%;40;37m^< Prev[0;1;40;37m                   ESC - Exit                   [0;%NextOK%;40;37mNext ^>[0;1;40;37m
echo  …Õ!B:~0,%Length1%!ÕÀÕ!B:~0,%Length2%!ÕÀÕ!B:~0,%Length2%!ÕÀÕ!B:~0,%Length2%!Õª
echo  ∫ !A:~0,%Length1%! ∫ [0;1;40;!Version_%X%C!m!VVersion_%X%:~0,%Length2%![0;1;40;37m ∫ [0;1;40;!Version_%X2%C!m!VVersion_%X2%:~0,%Length2%![0;1;40;37m ∫ [0;1;40;!Version_%X3%C!m!VVersion_%X3%:~0,%Length2%![0;1;40;37m ∫
echo  ÃÕ!B:~0,%Length1%!ÕŒÕ!B:~0,%Length2%!ÕŒÕ!B:~0,%Length2%!ÕŒÕ!B:~0,%Length2%!Õπ
	echo  ∫ !A:~0,%Length1%! ∫ !A:~0,%Length2%! ∫ !A:~0,%Length2%! ∫ !A:~0,%Length2%! ∫
	for /l %%# in (1,1,%ProgramCount%) do (
		set "Line1=!Program%%#!!A:~0,%Length1%!"
		set "Line2=!Program%%#_%X%!!A:~0,%Length1%!"
		set "Line3=!Program%%#_%X2%!!A:~0,%Length1%!"
		set "Line4=!Program%%#_%X3%!!A:~0,%Length1%!"
		if /i "!Program%%#_%X%!"=="DELETE" (set color0=1;31) else if not "!Program%%#_%X0%!"=="!Program%%#_%X%!" (if "!Program%%#_%X0%!"=="" (if %X0% Equ 0 (set color0=1;37) else set color0=1;36) else set color0=1;32) else set color0=37
		if /i "!Program%%#_%X2%!"=="DELETE" (set color1=1;31) else if not "!Program%%#_%X%!"=="!Program%%#_%X2%!" (if "!Program%%#_%X%!"=="" (set color1=1;36) else set color1=1;32) else set color1=37
		if /i "!Program%%#_%X3%!"=="DELETE" (set color2=1;31) else if not "!Program%%#_%X2%!"=="!Program%%#_%X3%!" (if "!Program%%#_%X2%!"=="" (set color2=1;36) else set color2=1;32) else set color2=37
		echo  ∫ [0;1;40;37m!Line1:~0,%Length1%![0;1;40;37m ∫ [0;!color0!;40m!Line2:~0,%Length2%![0;1;40;37m ∫ [0;!color1!;40m!Line3:~0,%Length2%![0;1;40;37m ∫ [0;!color2!;40m!Line4:~0,%Length2%![0;1;40;37m ∫
		echo  ∫ !A:~0,%Length1%! ∫ !A:~0,%Length2%! ∫ !A:~0,%Length2%! ∫ !A:~0,%Length2%! ∫
	)
echo  »Õ!B:~0,%Length1%!Õ Õ!B:~0,%Length2%!Õ Õ!B:~0,%Length2%!Õ Õ!B:~0,%Length2%!Õº
:MenuStats2CreepyGames
%BX% /k
set cho=%errorlevel%
if %cho%==330 if not %PrevOK% EQU 0 set /a X-=1&goto MenuStats0CreepyGames
if %cho%==332 if not %NextOK% EQU 0 set /a X+=1&goto MenuStats0CreepyGames
if %cho%==27 endlocal & goto :EOF
goto MenuStats2CreepyGames

:MenuSettings
cls
mode con cols=66 lines=28
echo.[0;1;40;37m
echo  %__MenuSettings01%
echo  %__MenuSettings02%
echo.
echo  [ ] %__MenuSettings1%
echo  [ ] %__MenuSettings2%
echo  [ ] %__MenuSettings3%
echo.
echo  [ ] %__MenuSettings4%
echo.
echo  [ ] %__MenuSettings5%
echo.
echo  [0;1;40;32m[ ] %__MenuSettings6%
echo.
echo.
echo  [0;1;40;33m[ ] %__MenuSettings7%[0;1;40;37m
	if defined DefaultMenu (if /i "%DefaultMenu%"=="Touch" (set /p "=[5;3H*" <nul) else if /i "%DefaultMenu%"=="Hybrid" (set /p "=[6;3H*" <nul) else set /p "=[7;3H*" <nul) else set /p "=[7;3H*" <nul
	if /i "%NoLoadAnim%"=="Y" set /p "=[9;3H*" <nul
	if /i "%NoIntro%"=="Y" set /p "=[11;3H*" <nul
	
for /f "tokens=1,2,3 delims=:" %%a in ('%BX% /m') do set /a X=%%a+1&set /a Y=%%b+1&set /a Z=%%c

if %X%==3 (
if %Y%==5 set DefaultMenu=Touch&set notouch=NO
if %Y%==6 set DefaultMenu=Hybrid&set notouch=YES
if %Y%==7 set DefaultMenu=None
if %Y%==9 (
	if /i "%NoLoadAnim%"=="Y" (set NoLoadAnim=) else set NoLoadAnim=Y
	call :Var
)
if %Y%==11 if /i "%NoIntro%"=="Y" (set NoIntro=) else set NoIntro=Y
if %Y%==13 call :Language & call :Var
if %Y%==16 ((
	echo DefaultMenu=!DefaultMenu!
	echo NoLoadAnim=!NoLoadAnim!
	echo NoIntro=!NoIntro!
	echo __CGLanguage=!__CGLanguage!
)>Settings.ini ) & exit /b
)
goto MenuSettings

:MenuUpdateCreepyGames
setlocal
cls
echo Moduà aktualizacji programu zostaà wyci©ty z wersji GitHub.
echo Aby sprawdziÜ aktualn• wersj© - sprawd´ wersj© programu na:
echo https://github.com/GrzegorzKi/CreepyGames
echo.
pause
endlocal
goto :EOF

:: Dodatkowe etykiety/ustawienia ::
:MenuShortcutLaunch
if defined launch (
	1>&2 echo ERROR: Too many arguments.
	1>&2 echo.
	1>&2 call :MenuShortcutUsage
	exit /b 1
)
	if /i "%~1"=="MineSweeper" (set "launch=call :MS_Init") else (
	if /i "%~1"=="Hangman" (set "launch=call :WS_Init") else (
	if /i "%~1"=="BatCraft" (set "launch=call :XX_BatCraft") else (
	if /i "%~1"=="CreepyChess" (set "launch=call :CC_Init") else (
	if /i "%~1"=="BatchOfPi" (set "launch=call :PI_BatchOfPi") else (
	if /i "%~1"=="AdminTools" (set "launch=call :AT_Init") else (
	if /i "%~1"=="DataBase" (set "launch=call :DB_Init") else (
	if /i "%~1"=="PicEditor" (set "launch=call :PE_Init") else (
	if /i "%~1"=="Cipher" (set "launch=call :SZ_Init") else (
	if /i "%~1"=="CreepyCraft" (set "launch=call :CB_Init") else (
	if /i "%~1"=="CraftBatcher" (set "launch=call :CB2_Init") else (
	if /i "%~1"=="TicTacToe" (set "launch=call :KK_Init") else (
	if /i "%~1"=="Update" (set "launch=call :MenuUpdateCreepyGames") else (
		1>&2 echo ERROR: Invalid program to launch.
		1>&2 echo.
		1>&2 call :MenuShortcutUsage
		exit /b 1
)))))))))))))
exit /b 0

:MenuShortcutUsage
echo Usage: %~nx0 [parametr1] [parametr2] ...
echo.
echo  -l, --launch ^<program^>  Launches selected program
echo.
echo     Available programs:  BatCraft
echo                            Hangman
echo                              MineSweeper
echo                                CreepyCraft
echo                                  CraftBatcher
echo                                    TicTacToe
echo.
echo                          CreepyChess
echo                            AdminTools
echo                              DataBase
echo                                PicEditor
echo.
echo                          Cipher
echo                            BatchOfPi
echo                              Update
echo.
echo          -n, --notouch   Replaces Touch Menu with Hybrid Menu
echo            -t, --touch   Reverse action to '--notouch' (default)
echo.
echo           -r, --return   Returns to menu when '--launch' parameter was used
goto :EOF


:Language
cls
mode con cols=80 lines=30
echo.[2;20H[0;1;40;33mWitaj w CreepyGames^^! [0;1;40;37m/[0;1;40;36m Welcome to CreepyGames^^!
echo.[4;15H[0;1;40;33mWybierz preferowany j©zyk [0;1;40;37m/[0;1;40;36m Select preferred language

:: Polska flaga ::
echo.[0;1;47;37m[7;5H€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€[8;5H€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€[9;5H€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€[10;5H€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€[11;5H€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€[12;5H€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€[13;5H€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€[0;1;41;31m[14;5H€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€[15;5H€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€[16;5H€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€[17;5H€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€[18;5H€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€[19;5H€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€

:: Amerykanska flaga ::
echo.[0;1;44;37m[7;44H* * * * * * * *[0;1;41;31m€€€€€€€€€€€€€€€€€€[0;1;44;37m[8;44H * * *   * * * €€€€€€€€€€€€€€€€€€[0;1;44;37m[9;44H* * * * * * * *[0;1;41;31m€€€€€€€€€€€€€€€€€€[0;1;44;37m[10;44H * * *   * * * €€€€€€€€€€€€€€€€€€[0;1;44;37m[11;44H* * * * * * * *[0;1;41;31m€€€€€€€€€€€€€€€€€€[0;1;44;37m[12;44H * * *   * * * €€€€€€€€€€€€€€€€€€[0;1;44;37m[13;44H* * * * * * * *[0;1;41;31m€€€€€€€€€€€€€€€€€€[0;1;47;37m[14;44H€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€[0;1;41;31m[15;44H€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€[0;1;47;37m[16;44H€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€[0;1;41;31m[17;44H€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€[0;1;47;37m[18;44H€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€[0;1;41;31m[19;44H€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€[0;1;40;37m

:LanguageInput
for /f "tokens=1,2,3 delims= " %%a in ('%Fn% mouse') do (
	set /a Y=%%a+1
	set /a X=%%b+1
	set /a Z=%%c
	if not "%%c"=="1" if not "%%c"=="3" goto LanguageInput
)
if %Y% GTR 6 if %Y% LSS 20 (
	if %X% GTR 4 if %X% LSS 38 set /p "=[0;5;47;30m[13;14HStosuj© j©zyk...[20;1H"<nul &set __LangChange=Y& goto LanguageSet_pl
	if %X% GTR 43 if %X% LSS 77 set /p "=[0;1;44;37m[13;51HApplying[0;1;5;41;37m language...[20;1H"<nul &set __LangChange=Y& goto LanguageSet_en
)
goto LanguageInput

:LanguageSet_pl
set /p "=[0;1;40;37m"<nul

:: Sekcja MENU ::
set "__ChangeLogHeader=               --= Oficjalny changelog programu CreepyGames =--"
set __ChangeLog=
for %%a in (
	"[0;1;40;33m"
	"               --= Oficjalny changelog programu CreepyGames =--" 
	"[0;1;40;37m"
	"CreepyGames v1.1.0"
	""
	"- Poprawiono na dobre polskie znaki przy òci•ganiu sà¢wek z SJP.pl"
	"--- Nie moæna mimo to wpisywaÜ polskich znak¢w przy wyszukiwaniu sà¢w na dan•"
	"    liter© (np. æ jako pierwsza litera - SJP.pl nie chce tego àykaÜ...)"
	"- Dodano program [0;1;40;33mBaza Danych[0;1;40;37m"
	"- Dodano program [0;1;40;33mZbi¢r Szyfr¢w[0;1;40;37m"
	"- Dodano program [0;1;40;33mPic Editor[0;1;40;37m by Honguito98"
	"- # CreepyGames # - Dodano zakàadk© INNE"
	"- CreepyGames oraz gry i programy zaczn• obsàugiwaÜ [0;40;32mmoduà ANSIcon[0;1;40;37m, uàatwiaj•c"
	"  przy tym moj• prac© xD (oraz sprawiaj•c, æe tekst jest àadniejszy)"
	""
	""
	"CreepyGames v1.2.0"
	""
	"- Ulepszono Touch Menu pod wzgl©dem czytelnoòci oraz zawijania wysuwanego menu"
	"- Dodano gr© [0;1;40;33mK¢àko i krzyæyk[0;1;40;37m by Szagajew"
	"- # CreepyGames # - Dodano zakàadk© USTAWIENIA I CREDITSY"
	"- [0;40;33mAbout CreepyGames[0;1;40;37m trafiào do zakàadki wyæej"
	"- Dodano [0;40;33mUstawienia[0;1;40;37m (ubogie, niestety...)"
	"- Dodano [0;40;33mCreditsy[0;1;40;37m"
	"- Dodano tzw. [0;40;33mStatystyki dla nerd¢w[0;1;40;37m (menu zawiera odnoònik do Changelogu"
	"  oraz historii aktualizacji program¢w)"
	""
	""
	"CreepyGames v1.3.0-v1.3.1 BIG UPDATE"
	""
	"- Poprawiono kilka bà©d¢w (m.in. w CreepyChess)"
	"- Dodano gr© [0;1;40;33mCraftBatcher[0;1;40;37m by Sucharowiec"
	"--- Program otrzymaà [0;1;40;36mDRUGI J®ZYK[0;1;40;37m (WooHoo xD)"
	"--- W zwi•zku z tym dodano menu wyboru j©zyka (i te àadne flagi... :D)"
	"--- Wraz z przebudowaniem programu doszàa moæliwoòÜ bezproblemowego tàumaczenia     programu na inne j©zyki :P"
	"- Wisielec wci•æ wymaga roboty. Brakuje plik¢w ze sà¢wkami do gry po angielsku"
	""
	""
	"CreepyGames v1.4.0-v1.4.1"
	""
	"- Dodano [0;1;40;33mKreator Aktualizacji[0;1;40;37m, kt¢ry bazuje na serwerze FTP"
	"- Poprawiono tàumaczenia"
	"- Przeniesiono wszystkie moduày do folderu [0;40;33mCore[0;1;40;37m"
	"- Usuni©to gr© [0;1;40;31mCraftBacher[0;1;40;37m i dodano [0;1;40;33mCreepyCraft[0;1;40;37m"
	"- Usuni©to [0;1;40;31mTest Samples[0;1;40;37m"
	""
	""
	"CreepyGames v1.4.2"
	"- Dodano (ponownie) na æyczenie [0;1;40;33mCraftBatcher[0;1;40;37m by Sucharowiec"
	"- Zaktualizowano [0;40;33mCreepyChess[0;1;40;37m"
	"- Dodano brakuj•ce sàowa do Wisielca po angielsku"
	"- Poprawiono pewne bà©dy w kodzie"
	""
	""
	"CreepyGames v1.4.3 (aktualna)"
	"- Zaktualizowano [0;40;33mCraftBatcher[0;1;40;37m by Sucharowiec"
	"- Poprawiono kilka bà©d¢w, np. w CreepyCrafcie."
) do set "__ChangeLog=!__ChangeLog! %%a")
set __About=
for %%a in (
""
"[0;1;40;33mCreepyGames %Version% - centrum gier i program¢w[0;1;40;37m"
""
"Program ten zbiera wszystkie gry i programy napisane przez"
"usera CreepyNinja_ (czyli mnie :D), a takæe te napisane"
"przez innych uæytkownik¢w z forum CMDTeam."
""
"Jestem wielce otwarty na propozycje zmian, dodania nowych gier,"
"program¢w itp.  Ku temu sàuæy przecieæ ten program -"
"zbiera wszystkie programiki do jednego ;)"
""
"CreepyGames - Copyright 2012-2015  by CreepyNinja_"
"Zapraszam r¢wnieæ na forum CMDTeam.hol.es, gdzie"
"znajdziecie WI®CEJ batchowych wytwor¢w. Pozdro :P"
"[0;1;40;36m"
) do set "__About=!__About! %%a"
set __Credits=
for %%a in (
""
"[0;1;40;33mCreepyGames %Version% - CREDITSY (Yay :P)[0;1;40;37m"
""
"Chciaàbym podzi©kowaÜ wszystkim uæytkownikom mojego programu"
"za to, æe uæywaj• tego programu i czerpi• z tego jakieò,"
"chociaæ niewielkie korzyòci :)"
""
"Chc© teæ podzi©kowaÜ kaædemu, kto dawaà jakieò propozycje"
"zmian, dodania nowych program¢w czy gier, oraz tym, kt¢rzy"
"dali mi cenne porady - poradnikiem czy teæ postem na forum."
""
"Ceni© to, æe ludzie w og¢le tworz• programy, na poz¢r,"
"w "niedorozwini©tym" j©zyku programowania (skryptowym),"
"w kt¢rym da si© zrobiÜ tak naprawd© ogromnie duæo ;)"
""
"Ja korzystam z tego, ucz© si© czegoò nowego od innych,"
"a nawet dodaj© programy danych os¢b - bo s• tego warte :P"
"Pozdrawiam teæ wszystkie osoby z forum [0;1;40;32mCMDTeam[0;1;40;37m. Kaæda z nich"
"w jakiò spos¢b mi pomogàa - moduà, poradnik, sàowo. Dzi©ki :)"
""
"Szczeg¢lnie pomogày mi te osoby: [0;1;40;36mSAdoch i EmilX[0;1;40;37m - tàumaczenia;]"
"oraz [0;1;40;32mMrKris7100[0;1;40;37m - tàumaczenia oraz moduà Batch# :D"
"[0;1;40;36m"
) do set "__Credits=!__Credits! %%a"
set "__Title=CreepyGames - Centrum gier i program¢w"
set "__MacroLoading=Trwa ladowanie programu @Program@, prosze czekac..."
set "__ErrorMessage1=Program jest juz uruchomiony w innym oknie."
set "__ErrorMessage2=Aby kontynuowac, zamknij istniejace sesje programu."
set "__IntroMessage=Centrum gier i programow - By CreepyNinja"
set "__WelcomeText1=   Witaj w centrum gier i program¢w CreepyGames. Wybierz opcje:"
set "__WelcomeText2=    Zbi¢r r¢ænorakich, mniejszych program¢w. Rozejrzyj si© ;)"
set "__WelcomeText3=       Statystyki dla nerd¢w: szczeg¢àowe dane o programie"
set "__Menu1Name_1=Gry wszelakiego rodzaju"
set "__Menu2Name_1=Programy"
set "__Menu3Name_1=Inne"
set "__Menu4Name_1=Ustawienia i creditsy"
set "__Menu5Name_1=Sprawd´ aktualizacje"
set "__Menu6Name_1=Wyjd´"
set "__Menu1Name1_1=MineSweeper"
set "__Menu1Name2_1=Wisielec"
set "__Menu1Name3_1=BatCraft (By Mac)"
set "__Menu1Name4_1=K¢àko i Krzyæyk (By Szagajew)"
set "__Menu1Name5_1=CreepyCraft"
set "__Menu1Name6_1=CraftBatcher"
set "__Menu2Name1_1=CreepyChess"
set "__Menu2Name2_1=Administrative Tools"
set "__Menu2Name3_1=Baza Danych"
set "__Menu2Name4_1=Pic Editor (By Honguito98)"
set "__Menu3Name1_1=Batch of Pi"
set "__Menu3Name2_1=Tips 'n' Tricks"
set "__Menu3Name3_1=Zbi¢r szyfr¢w"
set "__Menu4Name1_1=Ustawienia"
set "__Menu4Name2_1=About CreepyGames"
set "__Menu4Name3_1=Credits"
set "__Menu4Name4_1=Statystyki dla nerd¢w"
set "__Menu1Name1_2=Odpal program"
set "__Menu1Name2_2=Pokaæ kod programu"
set "__Menu1Name_3=              Historia aktualizacji program¢w"
set "__Menu2Name_3=                Changelog (od wersji v1.1.0)"
set "__Menu3Name_3=                   Wr¢Ü do gà¢wnego menu"
set "__MenuConflict1=Widz©, æe korzystasz z Windows 8.1 b•d´ Linuxa."
set "__MenuConflict2=Niekt¢re komendy mog• nie dziaàaÜ prawidàowo i zepsuÜ program."
set "__MenuConflict3=Aby program zadziaàaà w Win 8.1, uruchom program jako administrator."
set "__PressToContinue=Wciònij dowolny klawisz, aby kontynuowaÜ..."
set "__ClickToMenu=Kliknij gdziekolwiek, by wr¢ciÜ do gà¢wnego menu"
set "__NoBatboxPTC=Moduà od myszki niedost©pny. %__PressToContinue%"
set "__MenuStats1=Historia aktualizacji program¢w,"
set "__MenuStats2=Sterowanie masz wypisane poniæej"
set "__MenuSettings01=Ustawienia programu. Wybierz opcje za pomoc• myszki"
set "__MenuSettings02=Uwaga^^^^^! Niekt¢re zmiany wymagaj• restartu^^^^^!"
set "__MenuSettings1=Uæywaj domyòlnie "Touch Menu""
set "__MenuSettings2=Uæywaj domyòlnie "Hybrid Menu""
set "__MenuSettings3=Brak ustawie‰ domyòlnych"
set "__MenuSettings4=Wyà•cz animacje uruchamiania"
set "__MenuSettings5=Nie pokazuj intra"
set "__MenuSettings6=Zmie‰ j©zyk"
set "__MenuSettings7=Zapisz i wr¢Ü do menu"
set "__Prompt=Wyb¢r: "
set "__MenuExit=Do zobaczenia"

:: Sekcja MineSweeper ::
set "__MS_Name=MineSweeper"
set "__MS_Menu0_1=Witaj w grze Saper. Wybierz opcje:"
set "__MS_Menu1_1=Graj                          "
set "__MS_Menu2_1=Zmie‰ kolor tàa               "
set "__MS_Menu3_1=Zmie‰ kolor tekstu            "
set "__MS_MenuQ_1=Wyjd´                         "
set "__MS_Menu0_2=Wybierz poziom trudnoòci:"
set "__MS_Menu1_2=Pocz•tkuj•cy         "
set "__MS_Menu2_2=órednio-zaawansowany "
set "__MS_Menu3_2=Ekspert              "
set "__MS_Menu4_2=Niestardardowy       "
set "__MS_Menu1_3=Podaj dàugoòÜ planszy"
set "__MS_Menu2_3=Podaj szerokoòÜ planszy"
set "__MS_Menu3_3=Podaj iloòÜ min"
set "__MS_Wait=Czekaj, trwa àadowanie..."

:: Sekcja Wisielec ::
set "__WS_Name=Wisielec"
set "__WS_Menu0_1=Witaj w grze Wisielec. Wybierz opcje:"
set "__WS_Menu1_1=Graj                             "
set "__WS_Menu2_1=Zmie‰ kolor tàa                  "
set "__WS_Menu3_1=Zmie‰ kolor tekstu               "
set "__WS_Menu4_1=Modyfikuj uàatwiacze             "
set "__WS_MenuQ_1=Wyjd´                            "
set "__WS_Menu01_2= Uàatwiacze pomagaj• odgadywaÜ sàowa "
set "__WS_Menu02_2= Zwi©kszenie liczby pr¢b jest jednak "
set "__WS_Menu03_2= OSZUSTWEM - wyniki nie bed• liczone "
set "__WS_Menu1_2=Podawaj pierwsz• liter© sàowa"
set "__WS_Menu2_2=Zwi©ksz liczb© pr¢b do 16"
set "__WS_Menu3_2=Wr¢Ü do menu"
set "__WS_Menu0_3=    Wybierz kategori©:    "
set "__WS_Menu1_3=Warzywa i owoce       "
set "__WS_Menu2_3=Urz•dzenia RTV i AGD  "
set "__WS_Menu3_3=Pa‰stwa i Miasta      "
set "__WS_Menu4_3=Roòliny               "
set "__WS_Menu5_3=Zwierz©ta             "
set "__WS_Menu6_3=-= Wybierz losowo =-  "
set "__WS_Menu7_3=Wàasne (slownik.txt)  "
set "__WS_Menu8_3=Ze sàownika SJP.pl    "
set "__WS_Menu9_3=Gra 1v1               "
set "__WS_MenuQ_3=Wr¢Ü do menu          "
set "__WS_Error0=Wylosuj sàowo ponownie."
set "__WS_Error1=Hasào zawiera niedozwolone znaki"
set "__WS_Error2=Hasào jest za kr¢tkie"
set "__WS_Guess1=Zgadnij sàowo:"
set "__WS_Guess2=Kategoria:"
set "__WS_Guess3a=Ostatnia szansa"
set "__WS_Guess3b=Pozostaào pr¢b:"
set "__WS_Guess4=Ostatnio:"
set "__WS_Guess5=P¢ki co "zgadàeò" nast©puj•ce litery:"
set "__WS_Guess6Hotword=Zgaduj"
set "__WS_Guess6=Wpisz kolejn• liter© lub "%__WS_Guess6Hotword%", by odgadn•Ü caàe sàowo:"
set "__WS_Guess6Prompt=Sàowo brzmi "
set "__WS_Guess7=Juæ zgadywaàeò t• liter©..."
set "__WS_Guess8a=NIE trafiàeò."
set "__WS_Guess8b=Zgadàeò."
set "__WS_Guess9=Na pewno chcesz opuòciÜ gr©? (T/N) "
set "__WS_Lost1=Niestety przegraàeò"
set "__WS_Lost2=Sàowem do odgadni©cia byào:"
set "__WS_Win1=Wygraàeò"
set "__WS_Win2a=Zgadàeò sàowo"
set "__WS_Win2b=za"
set "__WS_Win2c=razem"
set "__WS_Again=Czy chcesz zagraÜ ponownie? (T/N) "
set "__WS_PvP01=Obecne wyniki:"
set "__WS_PvP02=Aby zako‰czyÜ rozgrywki, wpisz 'Q', lub nie wpisuj nic, aby graÜ dalej"
set "__WS_PvP1=Teraz grasz/gracie w trybie gry "1v1", gdzie jedna osoba pisze sàowo"
set "__WS_PvP2=do odgadni©cia, zaò druga ma za zadanie je odgadn•Ü. Proste, nie? :P"
set "__WS_PvP3=Aby wyjòÜ z kreatora gry, wciònij 'Q'."
set "__WS_PvP4=Prosimy o podanie swoich imion:"
set "__WS_PvP5=Imi© pierwszego gracza: "
set "__WS_PvP6=Imi© drugiego gracza: "
set "__WS_PvP7=Teraz niech @Name2@ si© odwr¢ci..."
set "__WS_PvP8=Kliknij cokolwiek, gdy b©dziecie gotowi/e..."
set "__WS_PvP9=Podaj hasào, kt¢re ma odgadn•Ü"
set "__WS_PvP10Hotword=losuj"
set "__WS_PvP10=Wpisz '%__WS_PvP10Hotword%', jeæeli nie b©dziesz miaà pomysàu: "
set "__WS_PvP11=Losuj© sàowo..."
set "__WS_PvP12=Podaj kategori© sàowa (dla uàatwienia zgaduj•cemu): "
set "__WS_PvP13=Twoja kolej, "
set "__WS_PvP14=Oto wyniki..."
set "__WS_PvP15a=Mamy remis"
set "__WS_PvP15b=C¢æ, i tak bywa :)"
set "__WS_PvP16a=wygrywa"
set "__WS_PvP16b=Szczere gratulacje z mojej strony :P"
set "__WS_PvP16c=Ale pami©tajmy, æe to tylko gra - raz si© wygrywa, raz si© przegrywa."
set "__WS_DownloadTip0=A jest ich duæo, bo aæ 150 tysi©cy sà¢wek^^^^^! (stan na 09/07/15)"
set "__WS_DownloadTip1=Wymagany jest: Internet, moduà wget.exe i m¢zg :P"
set "__WS_DownloadTip2=Nie zapisze je w formie staàej, bo jest ich po prostu za duæo :("
set "__WS_Download1=Program ma moæliwoòÜ pobierania sà¢w do Wisielca z Internetu :D"
set "__WS_Download2=Pobiera je ze strony *SJP.pl*, i to tylko takie, kt¢re zaczynaj•"
set "__WS_Download3=si© na dan• liter© b•d´ ci•g znak¢w."
set "__WS_Download4=Aby wr¢ciÜ do menu, wpisz 'Q'."
set "__WS_Download5=Aby wylosowaÜ (dosàownie) randomowe sàowo, wpisz '0'."
set "__WS_Download6=Podaj liter©/ci•g liter, na kt¢r• ma si© zacz•Ü sàowo: "
set "__WS_DownloadW1=Oczekuj© na odpowied´ serwera..."
set "__WS_DownloadW2=Ponawiam pr¢b© poà•czenia..."
set "__WS_DownloadW3=Serwer nie odpowiada. Spr¢buj ponownie p¢´niej..."
set "__WS_DownloadW4=Brak sà¢w zaczynaj•cych si© na podan• liter© :("
set "__WS_DownloadW5=Pobieram odpowiedni plik z list• sà¢wek..."
set "__WS_DownloadCat=Pobrane ze sàownika SJP"
set __WS_Warning1=
for %%a in (
"OSTRZEΩENIE: Nie znaleziono folderu "Wisielec_Files"."
"Folder ten przechowuje m.in. sà¢wka do gry, moduà do"
"pobierania stron SJP.pl oraz preferencje uàatwiaczy."
"Z powodu braku sà¢wek do gry, granie w domyòlnych"
"kategoriach z menu b©dzie niemoæliwe^^^^^!"
""
"Zalecamy pobraÜ ponownie paczk© z gr•. W przeciwnym razie"
"moæliwa b©dzie tylko gra na wàasne sà¢wka oraz gra 1v1."
) do set "__WS_Warning1=!__WS_Warning1! %%a"
set __WS_Warning2=
for %%a in (
"Pomoc dla pliku Slownik.txt:"
""
"Plik "Slownik.txt" jest potrzebny do uæywania wàasnych sà¢w w grze Wisielec"
"Utworzyàem ci go juæ, byò si© za bardzo nie m©czyà :)"
"Twoim zadaniem natomiast b©dzie:"
""
"	- Wypeànienie pliku wpisuj•c sàowa linijka po linijce"
"	- LINIJKA PO LINIJCE, nie po przecinku, òredniku czy cuò^^^^^!"
"	- No i nie radziàbym wpisywaÜ wi©kszej iloòci sà¢w niæ 2500."
""
"To chyba tyle :P Zatem do roboty..."
) do set "__WS_Warning2=!__WS_Warning2! %%a"

:: Sekcja CreepyChess ::
chcp 1250>nul
set "__CC_Error01=   Ups, program napotkal blad,"
set "__CC_Error02=    i musi zostac zatrzymany."
set "__CC_Error03= Jesli blad bedzie sie powtarzal"
set "__CC_Error04=    powiadom tworce programu."
set "__CC_Error1a=  Opis bledu: Uæyto komendy ^>nul"
set "__CC_Error1b=    B•d´ tekst wyjòciowy jest"
set "__CC_Error1c=         przekierowywany"
set "__CC_Error2a=    Opis bledu: Bà•d podczas"
set "__CC_Error2b=     konfiguracji programu."
set "__CC_Error3a=    Opis bledu: Bà•d podczas"
set "__CC_Error3b=    dobierania przeciwnikow."
set "__CC_Error4a=   Opis bledu: Nie znaleziono"
set "__CC_Error4b=    wymaganego moduàu Batch#."
set "__CC_NotSet=NIE USTAWIONE"
set "__CC_Set=USTAWIONE"
set "__CC_str1=Przyznaj punkt biaàym"
set "__CC_str2=Przyznaj punkt czarnym"
set "__CC_str3=Remis (przyznaj po p¢à punktu)"
set "__CC_str6=miejsce zajmuje:"
set "__CC_str8=Kliknij, aby wr¢ciÜ do dziaàu pomocy"
set "__CC_DefaultList=Gracze.ini"
set "__CC_Title=Tytuà"
set "__CC_TitlePrompt= Podaj tytuà dla tej sesji "
set "__CC_Menu1=Zacznij turniejowanie"
set "__CC_Menu2=Ustaw liczb© graczy"
set "__CC_Menu3= Ustaw liczb© rund"
set "__CC_Menu4=Przeà•cz liczenie Buchholza"
set "__CC_Menu5=Przeà•cz ustawienie drukowania"
set "__CC_Menu6=Zaawansowane ustawienia"
set "__CC_Menu7=Wyjd´ z programu"
set "__CC_Menu8=Zmie‰ tytuà okna"
set "__CC_Menu9=Zmie‰ nazw© pliku z list• graczy"
set "__CC_Menu10=Przeà•cz pokazywanie intra"
set "__CC_Menu11=Zapisz ustawienia do pliku .ini"
set "__CC_Menu12=[=] Dziaà pomocy [=]"
set "__CC_Menu13=Wr¢Ü do gà¢wnego menu"
set "__CC_Menu14=Ustaw now• nazw©:"
set "__CC_Menu15=Stara:"
set "__CC_Setup1=Liczba os¢b"
set "__CC_Setup2=Podaj liczb© graj•cych"
set "__CC_Setup3=Liczba rund"
set "__CC_Setup4=Podaj liczb© rund"
set "__CC_Warning1="UWAGA" "Ustawiono (nieparzyst•) liczb© rund tak• sam• jak liczba os¢b" "Bardzo prawdopodobne, æe przy n-tym losowaniu wyst•pi bà•d" "krytyczny z powodu braku moæliwoòci dalszych losowa‰" "" "Na pewno chcesz kontynuowaÜ?" "" "$$Tak" "" "$$Nie""
set "__CC_Setup5=Imi© osoby nr"
set "__CC_Setup6=Podaj imi© osoby pod nr"
set "__CC_Setup7="Imiona os¢b" "Dane:""
set "__CC_Setup8="Czy wpisane dane s• prawidàowe?" "" "$$Tak" "" "$$Nie""
set "__CC_ListName=Lista graczy"
set "__CC_RoundName=Runda"
set "__CC_Pausing=Pauzuje nr"
set "__CC_DrawName=Losowanie"
set "__CC_EndFileName=Wyniki turnieju"
set "__CC_Complete="Konfiguracja zako‰czona." "Za chwil© zaczn• si© losowania...""
set "__CC_LosError1="Losowanie nie powiodào si©..." "$$Czy chcesz samodzielnie dobraÜ przeciwnik¢w" "...czy..." "$$Zako‰czyÜ dziaàanie programu?""
set "__CC_LosError2="Informacja" "Dobierz kolejne pary, opieraj•c si© na poprzednich losowaniach rund" "System - w miar© moæliwoòci - b©dzie sprawdzaà, czy takie kojarzenie jest moæliwe" "Dobieraj numerami - nie nazwami.""
set "__CC_LosError3=Pierwszy numer: "
set "__CC_LosError4=Drugi numer: "
set "__CC_LosError5=Nie moæna ustawiÜ takiego kojarzenia."
set "__CC_LosError6=Kojarzenie ustawione."
set "__CC_LosError7=Ko‰czenie programu za 3 sekundy..."
set "__CC_LosMenu1="%__CC_DrawName%" "Na pewno chcesz rozpocz•Ü kolejn• rund©?" "" "$$Tak" "" "$$Nie""
set "__CC_LosMenu2="%__CC_DrawName%" "Nie wpisano jeszcze wszystkich wynik¢w.""
set "__CC_LosMenu3="$$Rozpocznij kolejn• rund©" "" "$$Pokaæ obecne wyniki" "" "$$Zabezpiecz sesj© hasàem""
set "__CC_Pair=Para"
set "__CC_Nr=nr"
set "__CC_Protect1=Podaj hasào odblokowuj•ce program (dozwolone: A-Z, a-z, 0-9, [SPACJA])"
set "__CC_Protect2= Program jest zabezpieczony hasàem"
set "__CC_Protect3=    Podaj hasào, by odblokowaÜ:"
set "__CC_Protect4=Hasào nieprawidàowe"
set "__CC_Protect5=Odblokowano"
set "__CC_Protect6=Hasào ustawione"
set "__CC_Print=Momencik, trwa drukowanie:"
set "__CC_CTC=Kliknij, aby kontynuowaÜ"
set "__CC_ByeText="Dzi©kuj© za przyjemn• prac©" "Ωycz© miàego dnia :)""
chcp 852>nul

:: Mniejsze sekcje ::
set "__PI_NumQuads1=Podaj "liczb© dokàadnoòci" (im wyæsza liczba, tym dokàadniejszy b©dzie wynik,"
set "__PI_NumQuads2=a takæe program b©dzie dàuæej liczyÜ): " 

set "__BatCraft1=Klawiszologia:"
set "__BatCraft2=WASD - Poruszanie si©"
set "__BatCraft3=123 - Zmiana trybu"
set "__BatCraft4=E - Wyb¢r przedmiotu"
set "__BatCraft5=Q - Wyjòcie"

set "__AT1=Parametry: "

set "__KK_Name=K¢àko i Krzyæyk"
set "__KK_Num1=90"
set "__KK_Num2=122"
set "__KK_Label1=Nowa gra"
set "__KK_Label2=Zako‰cz "
set "__KK_Label3=Ruch"
set "__KK_Label4=gracza"
set "__KK_Label5=Punkty:"
set "__KK_Label6=Remisy:"
set "__KK_Label7=Wygral O"
set "__KK_Label8=Wygral X"
set "__KK_Label9=.Remis."
set "__KK_Label10=     Wciònij aby zagraÜ ponownie      "

:: Sekcja Baza Danych ::
set "__DB_Name=Baza Danych"
set "__DB_Menu0=        Wybierz opcje:        "
set "__DB_Menu1=Utw¢rz now• baz© danych   "
set "__DB_Menu2=Wczytaj baz© danych       "
set "__DB_Menu3=Usu‰ baz© danych          "
set "__DB_MenuQ=Wyjòcie                   "
set "__DB_Create1=Podaj nazw© nowej bazy danych: "
set "__DB_Create2=A teraz czas na kofiguracj©..."
set "__DB_Create3=Tutaj ustalisz nazwy wprowadzanych do programu danych"
set "__DB_Create4=Aby zako‰czyÜ wprowadzanie, wciònij ENTER."
set "__DB_Create5a=Podaj nazw©"
set "__DB_Create5b=elementu"
set "__DB_Error1=Baza danych o takiej nazwie juæ istnieje"
set "__DB_Error2=Za maào element¢w^^^^^! Wymagane jest min. 2."
set "__DB_Error3=Podana baza danych nie zostaàa odnaleziona"
set "__DB_Create6a=Czy wprowadzone dane s• prawidàowe?"
set "__DB_Create6b=Nazwa:"
set "__DB_Create6c=Nazwy typ¢w danych:"
set "__DB_Create7=Baza danych zostaàa utworzona^^^^^! Teraz czas, aby j• zapeàniÜ :)"
set "__DB_Menu1_2=Usu‰ baz© danych - dost©pne:"
set "__DB_Menu2_2=Zmodyfikowano:"
set "__DB_Menu3_2=Wczytaj baz© danych - dost©pne:"
set "__DB_Menu4_2=Ωadne :("
set "__DB_Menu5_2=Zrobione. %__PressToContinue%"
set "__DB_AUS=Jestes pewien?"
set "__DB_Search1=Wyniki wyszukiwania"
set "__DB_Search2= Wciònij "F" lub "Esc", aby wr¢ciÜ...    "
set "__DB_Menu0_3=       Ustawienia bazy danych:        "
set "__DB_Menu1_3=Zmie‰ nazw© tej bazy danych       "
set "__DB_Menu2_3=Ustawienia tabeli                 "
set "__DB_Menu3_3=Zmie‰ kolorystyk© programu        "
set "__DB_MenuQ_3=Wr¢Ü                              "
set "__DB_Menu0_4=          Ustawienia tabeli:          "
set "__DB_Menu1_4=Dodaj now• kolumn©                "
set "__DB_Menu2_4=Usu‰ istniej•c• kolumn©           "
set "__DB_Menu3_4=Zmie‰ nazwy kolumn                "
set "__DB_Menu4_4=Zmie‰ szerokoòÜ kolumn            "
set "__DB_MenuQ_4=Wr¢Ü                              "
set "__DB_Menu0_5=             Zmie‰ kolor:             "
set "__DB_Menu1_5=Obramowa‰ tabeli oraz tàa         "
set "__DB_Menu2_5=Tabeli z klawiszologi•            "
set "__DB_Menu3_5=Wpis¢w w tabeli                   "
set "__DB_MenuQ_5=Wr¢Ü                              "
chcp 1250>nul
set __DB_Help=
for %%a in (
"Klawisze:"
"	                      --------------"
"	1 - Poprzednia strona \    Albo    /"
"	2 - NastÍpna strona   / strzalkami \"
"	R - Odswieø dane      --------------"
"	S - Sortuj dane"
"	F - Wyszukaj dane"
"	E - Edytuj dane"
"	A - Dodaj wpis"
"	D - UsuÒ wpis"
"	G - Przejdü do strony [...]"
"	H - Ta strona pomocy"
"	O - Ustawienia tej bazy danych"
"	Q - WrÛÊ do glÛwnego menu"
""
""
""
" ~~   Baza danych w Batchu - czyli tania   ~~"
" ~~  podrÛbka MS Access. Wersja beta v0.5  ~~"
" ~~  by CreepyNinja - All Rights Reserved  ~~"
"  ENJOY, moøe Wam siÍ przyda, a moøe nie :D"
) do set "__DB_Help=!__DB_Help! %%a"
set "__DB_Add=Dodaj wpis"
set "__DB_Edit=Edytuj dane"
set "__DB_Delete=UsuÒ wpis"
set "__DB_Sort1=Sortuj alfabetycznie po wartoúci:"
set "__DB_Sort2=WyczyúÊ sortowanie"
set "__DB_Prompt=WybÛr: "
set "__DB_Alphabet1=A • B C ∆ D E   F G H I J K L £ M N — O ” P R S å T U W Y Z è Ø"
set "__DB_Alphabet2=Ø è Z Y W U T å S R P ” O — N M £ L K J I H G F   E D ∆ C B • A"
set "__DB_Search3=Szukaj po wartoúci"
set "__DB_Search4=Nie znaleziono... :("
set "__DB_Goto=Przejdü do strony"
set "__DB_Options1=Nowa nazwa: "
set "__DB_Options2=ZmieÒ nazwy kolumn"
set "__DB_Options3=ZmieÒ szerokoúÊ kolumn"
set "__DB_Options4a=Obecny kolor: "
set "__DB_Options4b=Wpisz kod koloru: "
set "__DB_Options5=Dodaj kolumnÍ"
set "__DB_Options6=UsuÒ kolumnÍ"
set "__DB_Form=Tryb formularza"
chcp 852>nul

:: Sekcja Zbior szyfrow ::
set "__SZ_Name=Zbior szyfrow"
set "__SZ_Menu01=Witaj w programie do szyfrowania"
set "__SZ_Menu02=Tu moæesz zaszyfrowaÜ sw¢j tekst na przer¢æne sposoby"
set "__SZ_Menu03=Na pocz•tek wybierz rodzaj szyfrowania:"
set "__SZ_Menu04=Szyfry klasyczne:"
set "__SZ_Menu05=Szyfry podobne do Vigencra:"
set "__SZ_Menu06=Szyfry harcerskie i inne:"
set "__SZ_Menu1=Szyfr Cezara"
set "__SZ_Menu2=Szyfr Vigenera"
set "__SZ_Menu3=Szyfr Bacona"
set "__SZ_Menu4=Szyfr AtBash"
set "__SZ_Menu5=Szyfr Trithemiusa"
set "__SZ_Menu6=Szyfr Beauforta"
set "__SZ_Menu7=Szyfr "Gaderypoluki""
set "__SZ_MenuX=Inne szyfry? Podsuwajcie pomysày na forum ;)"
set "__SZ_MenuQ=Wyjòcie"
set "__SZ_ABType0=Wpisz typ alfabetu:"
set "__SZ_ABType1=Polski"
set "__SZ_ABType2=Angielski"
set "__SZ_Default=domyòlny"
set "__SZ_Code1=Podaj o ile maj• byÜ przesuni©te litery (ujemna liczba - deszyfracja): "
set "__SZ_Code2=Wpisz tekst do przetworzenia"
set "__SZ_Code3=Czekaj, przetwarzam wpisany tekst. Parametry:"
set "__SZ_Code4=Rodzaj szyfrowania:"
set "__SZ_Code5=Typ alfabetu:"
set "__SZ_Code6a=Przesuniecie o"
set "__SZ_Code6b=znak/i/ow"
set "__SZ_Code7a=Przetwarzam porcj© znak¢w od"
set "__SZ_Code7b=do"
set "__SZ_Code8=Wygenerowane programem"
set "__SZ_Code9=Gotowe"
set "__SZ_Code10=Podaj klucz do zaszyfrowania tekstu: "
set "__SZ_Code11=Podano nieprawidàowy klucz. Spr¢buj ponownie."
set "__SZ_Code12=Moment, przetwarzam klucz..."
set "__SZ_Code13=Klucz:"
set "__SZ_Code14=Wpisany tekst:"
set "__SZ_Code15=Wynik koncowy:"
set "__SZ_Code16=Wpisz tekst do zaszyfrowania:"
set "__SZ_Code17=(Aby deszyfrowaÜ, wpisz "decode")"
set "__SZ_Code18=Wpisz tekst do zdeszyfrowania:"
set "__SZ_Code19=(Aby szyfrowaÜ, wpisz "code")"
set "__SZ_Code20=Szyfracja"
set "__SZ_Code21=Deszyfracja"
set "__SZ_Code22=Podaj klucz do zaszyfrowania tekstu. Litery w kluczu nie mog• si© powtarzaÜ: "
set "__SZ_Code23=Czekaj, sprawdzam hasào..."
set "__SZ_Code24=Oto przetworzony tekst:"

:: Sekcja CreepyCraft ::
set "__CB_CTC=Wciònij dowolny klawisz..."

set "__CB_Credits1=Gra stworzona w Batchu przy pomocy dw¢ch dodatkowych moduà¢w."
set "__CB_Credits2=Gra na podstawie CraftBatchera"
set "__CB_Credits3=usera Sucharowiec"
set "__CB_Credits4=Zainspirowany grami user¢w:"
set "__CB_Credits5=Honguito98 i MrKris7100."
set "__CB_Credits6=Istniej• pewne powi•zania z grami"
set "__CB_Credits7=danych os¢b - po prostu przyòwie-"
set "__CB_Credits8=caàa nam podobna idea :P"

set "__CB_Controls1=Klawiszologia:"
set "__CB_Controls2=WASD - Poruszanie si©"
set "__CB_Controls3=LPM - Niszczenie blok¢w"
set "__CB_Controls4=PPM - Kàadzenie blok¢w"
set "__CB_Controls5=1-5 (lub myszk•) - Wyb¢r bloku"
set "__CB_Controls6=E (lub myszk•) - Ekwipunek/crafting"
set "__CB_Controls7=P/Esc - Pauza"
set "__CB_Controls8=Klik na kilofie - Zmiana kilofa"

set "__CB_Settings1=Ustawienia obejmuj• jedynie"
set "__CB_Settings2=czuàoòÜ moduàu od myszki."
set "__CB_Settings3=Klawiszami od 0-9 zmieniaj czuàoòÜ"
set "__CB_Settings4=Wciònij ESC aby wyjòÜ."

set "__CB_Start1=Wybierz òwiat"
set "__CB_Start2=Podaj nazw© dla nowego òwiata"
set "__CB_Start3=Podczas pisania nie ruszaj myszk•"
set "__CB_Start4=Podany òwiat juæ istnieje"
set "__CB_Start5=Trwa generowanie òwiata..."
set "__CB_Start6=Trwa àadowanie òwiata..."
set "__CB_Start7=Trwa zapisywanie òwiata..."

	set __CGLanguage=Polski
	if "%__LangChange%"=="Y" (
	echo DefaultMenu=%DefaultMenu%
	echo NoLoadAnim=%NoLoadAnim%
	echo NoIntro=%NoIntro%
	echo __CGLanguage=%__CGLanguage%
	)>Settings.ini
goto :EOF



:LanguageSet_en
set /p "=[0;1;40;37m"<nul

:: Section MENU ::
set __ChangeLog=
for %%a in (
	"[0;1;40;33m"
	"            --= Official changelog of the CreepyGames program =--" 
	"[0;1;40;37m"
	"CreepyGames v1.1.0"
	""
	"- Fixed effectively polish chars when downloading words from SJP.pl"
	"--- But you can't write polish chars when searching words on a given"
	"    letter (eg. æ as a first letter - SJP.pl will reject this...)"
	"- Added a program [0;1;40;33mDataBase[0;1;40;37m"
	"- Added a program [0;1;40;33mCiphers[0;1;40;37m"
	"- Added a program [0;1;40;33mPic Editor[0;1;40;37m by Honguito98"
	"- # CreepyGames # - Added tab OTHER"
	"- CreepyGames and games and programs in it will handle [0;40;32mthe ANSIcon module [0;1;40;37m"
	""
	""
	"CreepyGames v1.2.0"
	""
	"- Improved Touch Menu in terms of readability and wrapping pop-up menu"
	"- Added game [0;1;40;33mTic Tac Toe[0;1;40;37m by Szagajew"
	"- # CreepyGames # - Added tab OPTIONS AND CREDITS"
	"- [0;40;33mAbout CreepyGames[0;1;40;37m moved to tab above"
	"- Added [0;40;33mOptions[0;1;40;37m"
	"- Added [0;40;33mCredits[0;1;40;37m"
	"- Added [0;40;33mStats for geeks[0;1;40;37m (menu contains a link to the"
	"  Changelog and History of updated programs)"
	""
	""
	"CreepyGames v1.3.0-v1.3.1 BIG UPDATE"
	""
	"- Fixed some bugs (i.e. in CreepyChess)"
	"- Added game [0;1;40;33mCraftBatcher[0;1;40;37m by Sucharowiec"
	"--- Program received [0;1;40;36mSECOND LANGUAGE[0;1;40;37m (WooHoo xD)"
	"--- Accordingly, I've added pretty language selection (mmm, that flags... :D)"
	"--- Along with program rebuilding there's the ability to easily translate"
	"    program to other languages :P"
	"- Hangman still needs some work. Files with words to this game are missing."
	""
	""
	"CreepyGames v1.4.0-v1.4.1"
	""
	"- Added [0;1;40;33mUpdate Wizard[0;1;40;37m, and it is based on FTP server"
	"- Fixed some translates"
	"- Moved all the modules to the [0;40;33mCore[0;1;40;37m folder"
	"- Removed game [0;1;40;31mCraftBacher[0;1;40;37m and added [0;1;40;33mCreepyCraft[0;1;40;37m"
	"- Removed [0;1;40;31mTest Samples[0;1;40;37m"
	""
	""
	"CreepyGames v1.4.2"
	"- Added (again) for request [0;1;40;33mCraftBatcher[0;1;40;37m by Sucharowiec"
	"-- For now it hasn't got translation to English, sorry :("
	"- Updated [0;40;33mCreepyChess[0;1;40;37m"
	"- Added missing words to Hangman game"
	"- Fixed some mistakes in code"
	""
	""
	"CreepyGames v1.4.3 (actual)"
	"- Updated [0;40;33mCraftBatcher[0;1;40;37m by Sucharowiec"
	"- Fixed some bugs, ex. in CreepyCraft."
) do set "__ChangeLog=!__ChangeLog! %%a")
set __About=
for %%a in (
""
"[0;1;40;33mCreepyGames %Version% - games and programs centre[0;1;40;37m"
""
"This program ten collects all the games and programs written by"
"user CreepyNinja_ (that's me :D), as well as those written by"
"other users from the CMDTeam forum."
""
"I am very open to suggestions of changes, add new games,"
"programs, etc. That's a main goal of this program -"
"collects all these programs into one ;)"
""
"CreepyGames - Copyright 2012-2015  by CreepyNinja_"
"I also invite you to CMDTeam.hol.es forum, where you can"
"find MORE batch creations. Cheers :P"
"[0;1;40;36m"
) do set "__About=!__About! %%a"
set __Credits=
for %%a in (
""
"[0;1;40;33mCreepyGames %Version% - CREDITS (Yay :P)[0;1;40;37m"
""
"I would like to thank all the users who use my program"
"for the fact that they use this program and draw from this"
"although some little benefits :)"
""
"I also want to thank everyone who gave me some suggestions"
"for improvement, adding new programs or games, and those who"
"gave me valuable advice - by tutorial or post on the forum."
""
"I appreciate the fact that people in general create programs,"
"seemingly, in the "underdeveloped" programming (scripting)"
"language in which we can do REALLY very much ;)"
""
"I have "profits" from this, I learn something new from others,"
"And I even add these people programs - bcoz they are worth it."
"I also greet all people from the [0;1;40;32mCMDTeam[0;1;40;37m forum. Each of them"
"in some way helped me - module, tutorial, word. Thanks :)"
""
"These people helped me a lot: [0;1;40;36mSAdoch and EmilX[0;1;40;37m - translations;]"
"aand [0;1;40;32mMrKris7100[0;1;40;37m - translations and Batch# module :D"
"[0;1;40;36m"
) do set "__Credits=!__Credits! %%a"
set "__Title=CreepyGames - Games and programs centre"
set "__MacroLoading=Loading program @Program@, please wait..."
set "__ErrorMessage1=Program is already launched in another window."
set "__ErrorMessage2=       Close existing sessions to continue."
set "__IntroMessage=Games and programs centre - By CreepyNinja"
set "__WelcomeText1= Welcome to games and programs centre CreepyGames. Select option:"
set "__WelcomeText2=    A collection of various, smaller programs. Look around ;)"
set "__WelcomeText3=          Stats for geeks: detailed data about program"
set "__Menu1Name_1=Games of all kinds"
set "__Menu2Name_1=Programs"
set "__Menu3Name_1=Other"
set "__Menu4Name_1=Options and credits"
set "__Menu5Name_1=Check for updates"
set "__Menu6Name_1=Exit"
set "__Menu1Name1_1=MineSweeper"
set "__Menu1Name2_1=Hangman"
set "__Menu1Name3_1=BatCraft (By Mac)"
set "__Menu1Name4_1=Tic Tac Toe (By Szagajew)"
set "__Menu1Name5_1=CreepyCraft"
set "__Menu1Name6_1=CraftBatcher"
set "__Menu2Name1_1=CreepyChess"
set "__Menu2Name2_1=Administrative Tools"
set "__Menu2Name3_1=DataBase"
set "__Menu2Name4_1=Pic Editor (By Honguito98)"
set "__Menu3Name1_1=Batch of Pi"
set "__Menu3Name2_1=Tips 'n' Tricks"
set "__Menu3Name3_1=Ciphers"
set "__Menu4Name1_1=Options"
set "__Menu4Name2_1=About CreepyGames"
set "__Menu4Name3_1=Credits"
set "__Menu4Name4_1=Stats for geeks"
set "__Menu1Name_3=                History of updated programs"
set "__Menu2Name_3=                    Changelog (v1.1.0+)"
set "__Menu3Name_3=                  Return to the main menu"
set "__MenuConflict1=I see that you are using Windows 8.1 or Linux."
set "__MenuConflict2=Some commands may not work properly and screw up the program."
set "__MenuConflict3=To solve this on Windows 8.1, launch program as administrator."
set "__PressToContinue=Press any key to continue..."
set "__ClickToMenu=   Click anywhere to return to the main menu    "
set "__NoBatboxPTC=Mouse module is unavailable. %__PressToContinue%"
set "__MenuStats1=  History of updated programs"
set "__MenuStats2=        Controls below."
set "__MenuSettings01=Program settings. Select options with the mouse"
set "__MenuSettings02=Warning^^^^^! Some changes require a restart^^^^^!"
set "__MenuSettings1=Use by default "Touch Menu""
set "__MenuSettings2=Use by default "Hybrid Menu""
set "__MenuSettings3=No defaults"
set "__MenuSettings4=Turn off launch animations"
set "__MenuSettings5=Do not view intro"
set "__MenuSettings6=Change language"
set "__MenuSettings7=Save and return to menu"
set "__Prompt=Choice: "
set "__MenuExit=See ya later"

:: Section MineSweeper ::
set "__MS_Name=MineSweeper"
set "__MS_Menu0_1=    Welcome to the MineSweeper    "
set "__MS_Menu1_1=Play                          "
set "__MS_Menu2_1=Change background color       "
set "__MS_Menu3_1=Change foreground color       "
set "__MS_MenuQ_1=Exit                          "
set "__MS_Menu0_2=Sel. level of difficulty:"
set "__MS_Menu1_2=Beginner             "
set "__MS_Menu2_2=Middle-experienced   "
set "__MS_Menu3_2=Expert               "
set "__MS_Menu4_2=Custom               "
set "__MS_Menu1_3=Specify the length of the board"
set "__MS_Menu2_3=Enter the width of the board"
set "__MS_Menu3_3=Enter the number of mines"
set "__MS_Wait=Please wait, loading..."

:: Section Hangman ::
set "__WS_Name=Hangman"
set "__WS_Menu0_1= Welcome to Hangman. Choose options: "
set "__WS_Menu1_1=Play                             "
set "__WS_Menu2_1=Change background color          "
set "__WS_Menu3_1=Change text color                "
set "__WS_Menu4_1=Modify bonuses                   "
set "__WS_MenuQ_1=Exit                             "
set "__WS_Menu01_2=Bonuses will help you guess the word "
set "__WS_Menu02_2=Increasing the number of attempts is "
set "__WS_Menu03_2=a CHEAT - scores will not be counted "
set "__WS_Menu1_2=Serve the first letter of the word   "
set "__WS_Menu2_2=Increase the number of attempts      "
set "__WS_Menu3_2=Back to menu"
set "__WS_Menu0_3=     Select category:     "
set "__WS_Menu1_3=Vegetables and fruits "
set "__WS_Menu2_3=Devices RTV and AGD   "
set "__WS_Menu3_3=Countries and Cities  "
set "__WS_Menu4_3=Plants                "
set "__WS_Menu5_3=Animals               "
set "__WS_Menu6_3=-= Choose random =-   "
set "__WS_Menu7_3=Custom (slownik.txt)  "
set "__WS_Menu8_3=From SJP.pl dictionary"
set "__WS_Menu9_3=1 vs. 1 game          "
set "__WS_MenuQ_3=Back to menu          "
set "__WS_Error0=Draw the word again."
set "__WS_Error1=Password contains illegal characters"
set "__WS_Error2=Password is too short"
set "__WS_Guess1=Guess the word:"
set "__WS_Guess2=Category:"
set "__WS_Guess3a=Last chance"
set "__WS_Guess3b=Attempts remaining:"
set "__WS_Guess4=Last:"
set "__WS_Guess5=For now, you "guessed" the following letters:"
set "__WS_Guess6Hotword=Guess"
set "__WS_Guess6=Enter the next letter or "%__WS_Guess6Hotword%", to guess the whole word:"
set "__WS_Guess6Prompt=The word is "
set "__WS_Guess7=You already guessed this letter..."
set "__WS_Guess8a=You have NOT guessed."
set "__WS_Guess8b=You HAVE guessed."
set "__WS_Guess9=Do you really want to leave the game? (Y/N) "
set "__WS_Lost1=Unfortunately, you lost"
set "__WS_Lost2=Word to guess was:"
set "__WS_Win1=You win"
set "__WS_Win2a=You've guessed the word"
set "__WS_Win2b=for"
set "__WS_Win2c=time"
set "__WS_Again=Do you want to play again? (Y/N) "

set "__WS_PvP01=Current scores:"
set "__WS_PvP02=To end the game, enter 'Q', or do not type anything to continue play"
set "__WS_PvP1=Now you play 1 vs. 1 mode where one player writes the word to guess,"
set "__WS_PvP2=and the second must guess it. It's simple, is it not? :P"
set "__WS_PvP3=To exit the wizard of the game, press 'Q'."
set "__WS_PvP4=Please enter your names:"
set "__WS_PvP5=1st player: "
set "__WS_PvP6=2nd player: "
set "__WS_PvP7=Now let @Name2@ don't look here..."
set "__WS_PvP8=Click any key, when you'll be ready..."
set "__WS_PvP9=Enter the password to guess"
set "__WS_PvP10Hotword=Random"
set "__WS_PvP10=Type '% __ WS_PvP10Hotword%', if you do not have any idea: "
set "__WS_PvP11=Wait, drawing word..."
set "__WS_PvP12=Enter a category of word (to facilitate guessing): "
set "__WS_PvP13=Your turn, "
set "__WS_PvP14=Here are the scores..."
set "__WS_PvP15a=We have a draw"
set "__WS_PvP15b=Well, it happens sometimes :)"
set "__WS_PvP16a=wins"
set "__WS_PvP16b=Sincere congratulations from my side :P"
set "__WS_PvP16c=But remember that this is just a game - once you win, sometimes you lose."
set "__WS_DownloadTip0=And there are many words, nearly 150,000 words^^^^^!"
set "__WS_DownloadTip1=Requires: Internet, wget.exe module and the brain :P"
set "__WS_DownloadTip2=I do not save them in the form of a solid file, because there are just too many :("
set "__WS_Download1=The program has the ability to retrieve words to the Hangman from the Internet :D"
set "__WS_Download2=Downloads them from the *SJP.pl*, and only those that begin"
set "__WS_Download3=and only those that begin on the letter or string of letters."
set "__WS_Download4=To return to the menu, type 'Q'."
set "__WS_Download5=To draw (literally) a random word, type '0'."
set "__WS_Download6=Enter letter/text, which is to begin a word: "
set "__WS_DownloadW1=Waiting for server response..."
set "__WS_DownloadW2=Retrying..."
set "__WS_DownloadW3=The server is not responding. Try again later..."
set "__WS_DownloadW4=There are no words beginning with the specified letter :("
set "__WS_DownloadW5=Downloading the appropriate file with the list of words..."
set "__WS_DownloadCat=Downloaded from SJP.pl"
set __WS_Warning1=
for %%a in (
"WARNING: Folder "Wisielec_Files" wasn't found."
"This folder stores words to the game, module to downloading"
"SJP.pl webpages and preferences of the facilitators."
"In the absence of words to the game, playing in default"
"categories from the menu will be impossible^^^^^!"
""
"We recommend that you download the new package with the game. Otherwise, 
"you'll be able to play only in 1 vs. 1 mode."
) do set "__WS_Warning1=!__WS_Warning1! %%a"
set __WS_Warning2=
for %%a in (
"Help for Slownik.txt file:"
""
"File "Slownik.txt": This file is needed to use your own words in the Hangman"
"I created it for you already, you do not need to make it now :)"
"Your task is:"
""
"	- Fill the file by typing the words to this file line by line"
"	- LINE BY LINE, not decimal, semicolon or something^^^^^!"
"	- Well, I would not recommend typing more than 2500 words at once."
""
"It's probably enough :P So, to work..."
) do set "__WS_Warning2=!__WS_Warning2! %%a"

:: Section CreepyChess ::
chcp 1250>nul
set "__CC_Error01=  Oops, program  encountered an"
set "__CC_Error02=  error and needs to be stopped"
set "__CC_Error03=  If the error persists, notify"
set "__CC_Error04=   the creator of the program."
set "__CC_Error1a=  Description:  ^>nul command was"
set "__CC_Error1b=      used or text output is"
set "__CC_Error1c=           redirected."
set "__CC_Error2a=          Description:"
set "__CC_Error2b=      Configuration Error."
set "__CC_Error3a=    Description: Error while"
set "__CC_Error3b=       drawing opponents."
set "__CC_Error4a=   Description: Batch# module"
set "__CC_Error4b=         was not found."
set "__CC_NotSet=NOT SET"
set "__CC_Set=SET"
set "__CC_str1=Admit point white"
set "__CC_str2=Admit point black"
set "__CC_str3=Draw (admit half a point each side)"
set "__CC_str6=place takes:"
set "__CC_str8=Kliknij, aby wr¢ciÜ do dziaàu pomocy"
set "__CC_DefaultList=Players.ini"
set "__CC_Title=Title"
set "__CC_TitlePrompt= Enter a title for this session "
set "__CC_Menu1=Start tournament"
set "__CC_Menu2=Set the number of players"
set "__CC_Menu3=Set the number of rounds"
set "__CC_Menu4=Switch: Buchholz points counting"
set "__CC_Menu5=Switch: Print txt files"
set "__CC_Menu6=Advanced settings"
set "__CC_Menu7=Exit the program"
set "__CC_Menu8=Change the title of the session"
set "__CC_Menu9=Rename the list of players"
set "__CC_Menu10=Switch: show intro"
set "__CC_Menu11=Save settings to .ini file"
set "__CC_Menu12=-= Helpdesk (only in polish) =-"
set "__CC_Menu13=Back to the main menu"
set "__CC_Menu14=Type new name:"
set "__CC_Menu15=Old:"
set "__CC_Setup1=Number of players"
set "__CC_Setup2=Set number of players"
set "__CC_Setup3=Number of rounds"
set "__CC_Setup4=Number of rounds"
set "__CC_Warning1="WARNING" "Number of rounds is the same as the number of players" "It is very likely that on the n-th draw an critical error" "will occur due to lack of opportunities for further draws" "" "Do you really want to continue?" "" "$$Yes" "" "$$No""
set "__CC_Setup5=Person name no."
set "__CC_Setup6=Set person name under no."
set "__CC_Setup7="Names of players" "Data:""
set "__CC_Setup8="Are entered data correct?" "" "$$Yes" "" "$$No""
set "__CC_ListName=Players list"
set "__CC_RoundName=Round"
set "__CC_Pausing=Pausing no."
set "__CC_DrawName=The draw"
set "__CC_EndFileName=Tournament results"
set "__CC_Complete="Configuration is complete." "The draw will start in a moment...""
set "__CC_LosError1="The draw failed..." "$$Do you want to manually select opponents" "...or..." "$$Quit the program?""
set "__CC_LosError2="Information" "Choose the successive pairs based on previous draws rounds" "System - where possible - will check whether such a pairing is possible" "Select by numbers - not by names.""
set "__CC_LosError3=First number: "
set "__CC_LosError4=Second number: "
set "__CC_LosError5=I cannot set this. Invalid setting."
set "__CC_LosError6=Associate has been set."
set "__CC_LosError7=Ending the program in three seconds..."
set "__CC_LosMenu1="%__CC_DrawName%" "Do you really want to start next round?" "" "$$Yes" "" "$$No""
set "__CC_LosMenu2="%__CC_DrawName%" "You do not entered all the results^^^^^!""
set "__CC_LosMenu3="$$Start next round" "" "$$View current results" "" "$$Protect session with password""
set "__CC_Pair=Pair"
set "__CC_Nr=no."
set "__CC_Protect1=Set password unlocking the program (allowed: A-Z, a-z, 0-9, [SPACE]): "
set "__CC_Protect2=  Program is locked with password"
set "__CC_Protect3=     Type password to unlock:"
set "__CC_Protect4=Wrong password"
set "__CC_Protect5=Unlocked"
set "__CC_Protect6=Password set"
set "__CC_Print=Wait a moment, printing:"
set "__CC_CTC=Click to continue"
set "__CC_ByeText="Thanks for a nice job" "Have a nice day :)""
chcp 852>nul

:: Smaller sections ::
set "__PI_NumQuads1=Enter the "number of accuracy" (the higher the number, the result will be more accurate,"
set "__PI_NumQuads2=but program will calculate longer): " 

set "__BatCraft1=Keys:"
set "__BatCraft2=WASD - Moving"
set "__BatCraft3=123 - Change mode"
set "__BatCraft4=E - Change item"
set "__BatCraft5=Q - Quit"

set "__AT1=Parametry: "

set "__KK_Name=Tic Tac Toe"
set "__KK_Num1=69"
set "__KK_Num2=101"
set "__KK_Label1=New game"
set "__KK_Label2=Exit    "
set "__KK_Label3=Player"
set "__KK_Label4=turn"
set "__KK_Label5=Points:"
set "__KK_Label6=Draws:"
set "__KK_Label7= O .Wins. "
set "__KK_Label8= X .Wins. "
set "__KK_Label9=.Draaw."
set "__KK_Label10=         Press to play again          "

:: Section DataBase ::
set "__DB_Name=DataBase"
set "__DB_Menu0=        Select options:       "
set "__DB_Menu1=Create new database       "
set "__DB_Menu2=Load database             "
set "__DB_Menu3=Delete database           "
set "__DB_MenuQ=Exit                      "
set "__DB_Create1=Type name of the new database: "
set "__DB_Create2=Now it's time for configuration..."
set "__DB_Create3=Here you can set name of columns"
set "__DB_Create4=To end typing, press ENTER."
set "__DB_Create5a=Type name of"
set "__DB_Create5b=element"
set "__DB_Error1=Database with that name already exists"
set "__DB_Error2=Too few elements^^^^^! Required min. 2."
set "__DB_Error3=Selected database was not found"
set "__DB_Create6a=Are entered data correct?"
set "__DB_Create6b=Name:"
set "__DB_Create6c=Names of data:"
set "__DB_Create7=Baza danych zostaàa utworzona^^^^^! Teraz czas, aby j• zapeàniÜ :)"
set "__DB_Menu1_2=Delete database - available:"
set "__DB_Menu2_2=Modified:"
set "__DB_Menu3_2=Load database - available:"
set "__DB_Menu4_2=Empty :("
set "__DB_Menu5_2=Done. %__PressToContinue%"
set "__DB_AUS=Are you sure?"
set "__DB_Search1=Search results"
set "__DB_Search2= Press "F" or "Esc" to go back...        "
set "__DB_Menu0_3=          Database settings:          "
set "__DB_Menu1_3=Change the name of this database  "
set "__DB_Menu2_3=Table settings                    "
set "__DB_Menu3_3=Change program colors             "
set "__DB_MenuQ_3=Back                              "
set "__DB_Menu0_4=           Table settings:            "
set "__DB_Menu1_4=Add new column                    "
set "__DB_Menu2_4=Delete existing column            "
set "__DB_Menu3_4=Change columns names              "
set "__DB_Menu4_4=Change columns width              "
set "__DB_MenuQ_4=Back                              "
set "__DB_Menu0_5=           Change color of:           "
set "__DB_Menu1_5=Table border and background       "
set "__DB_Menu2_5=Table with keys legend            "
set "__DB_Menu3_5=Table content                     "
set "__DB_MenuQ_5=Back                              "
chcp 1250>nul
set __DB_Help=
for %%a in (
"Keys:"
"	                      --------------"
"	1 - Previous page     \     or     /"
"	2 - Next page         /   arrows   \"
"	R - Refresh page      --------------"
"	S - Sort data"
"	F - Find data"
"	E - Edit data"
"	A - Add entry"
"	D - Delete entry"
"	G - Go to page [...]"
"	H - This help page"
"	O - Settings of this database"
"	Q - Quit/Return to the main menu"
""
""
""
" ~~   DataBase in Batch - that is cheap    ~~"
" ~~  imitation of MS Access. Version v0.5  ~~"
" ~~  by CreepyNinja - All Rights Reserved  ~~"
"ENJOY, maybe it will come handy, maybe not :D"
) do set "__DB_Help=!__DB_Help! %%a"
set "__DB_Add=Add entry"
set "__DB_Edit=Edit data"
set "__DB_Delete=Delete entry"
set "__DB_Sort1=Sort alphabetically by value:"
set "__DB_Sort2=Clear sort"
set "__DB_Prompt=Choice: "
set "__DB_Alphabet1=A B C D E F G H I J K L M N O P Q R S T U V W X Y Z"
set "__DB_Alphabet2=Z Y X W V U T S R Q P O N M L K J I H G F E D C B A"
set "__DB_Search3=Search by value"
set "__DB_Search4=Not found... :("
set "__DB_Goto=Goto page"
set "__DB_Options1=New name: "
set "__DB_Options2=Rename columns"
set "__DB_Options3=Resize columns"
set "__DB_Options4a=Current color: "
set "__DB_Options4b=Enter color code: "
set "__DB_Options5=Add column"
set "__DB_Options6=Delete column"
set "__DB_Form=Form mode"
chcp 852>nul

:: Section Ciphers ::
set "__SZ_Name=Ciphers"
set "__SZ_Menu01=Welcome to the program that encrypt any text"
set "__SZ_Menu02=Here you can encrypt your text in various ways"
set "__SZ_Menu03=Now select the type of encryption:"
set "__SZ_Menu04=Classical ciphers:"
set "__SZ_Menu05=Similar to the Vigencre ciphers:"
set "__SZ_Menu06=Scouts ciphers and others"
set "__SZ_Menu1=Caesar cipher"
set "__SZ_Menu2=Vigencre cipher"
set "__SZ_Menu3=Bacon cipher"
set "__SZ_Menu4=AtBash cipher"
set "__SZ_Menu5=Trithemius cipher"
set "__SZ_Menu6=Beaufort cipher"
set "__SZ_Menu7=Cipher "Gaderypoluki""
set "__SZ_MenuX=Other ciphers? Suggests ideas on the forum ;)"
set "__SZ_MenuQ=Exit"
set "__SZ_ABType0=Select alphabet type:"
set "__SZ_ABType1=Polish"
set "__SZ_ABType2=English"
set "__SZ_Default=default"
set "__SZ_Code1=Enter the offset value (negative vaule - decoding): "
set "__SZ_Code2=Enter the text to be processed"
set "__SZ_Code3=Wait, processing typed text. Parameters:"
set "__SZ_Code4=Encryption name:"
set "__SZ_Code5=Alphabet type:"
set "__SZ_Code6a=Offset by"
set "__SZ_Code6b=character/s"
set "__SZ_Code7a=Processing portion of characters from"
set "__SZ_Code7b=to"
set "__SZ_Code8=Generated by program"
set "__SZ_Code9=Done"
set "__SZ_Code10=Enter the encryption key: "
set "__SZ_Code11=Entered invalid key. Try again."
set "__SZ_Code12=Wait, processing key..."
set "__SZ_Code13=Key:"
set "__SZ_Code14=Written text:"
set "__SZ_Code15=Final result:"
set "__SZ_Code16=Enter the text to encrypt:"
set "__SZ_Code17=(To decode, type "decode")"
set "__SZ_Code18=Enter the text to decrypt:"
set "__SZ_Code19=(To encode, type "code")"
set "__SZ_Code20=Encryption"
set "__SZ_Code21=Decryption"
set "__SZ_Code22=Enter the key to encrypt the text. The letters in the key cannot be repeated:"
set "__SZ_Code23=Wait, checking key..."
set "__SZ_Code24=Here is processed text:"

:: Section CreepyCraft ::
set "__CB_CTC=Press any key..."

set "__CB_Credits1=Game made in Batch with additional two modules."
set "__CB_Credits2=Game based on CraftBatcher"
set "__CB_Credits3=by Sucharowiec"
set "__CB_Credits4=Inspired by games of:"
set "__CB_Credits5=Honguito98 and MrKris7100."
set "__CB_Credits6=There are some similar elements"
set "__CB_Credits7=in that games - we just had got"
set "__CB_Credits8=similar ideas :P"

set "__CB_Controls1=Keyboard controls:"
set "__CB_Controls2=WASD - Moving"
set "__CB_Controls3=LPM - Breaking blocks"
set "__CB_Controls4=PPM - Placing blocks"
set "__CB_Controls5=1-5 (or by mouse) - Block select"
set "__CB_Controls6=E (or by mouse) - Inventory/craft."
set "__CB_Controls7=P/Esc - Pause"
set "__CB_Controls8=Click a pickaxe - Change pickaxe"

set "__CB_Settings1=The only settings to modify is"
set "__CB_Settings2=an accuracy of a mouse module."
set "__CB_Settings3=With keys 0-9 adjust accuracy."
set "__CB_Settings4=Click ESC to exit."

set "__CB_Start1=Select world"
set "__CB_Start2=Set the name of new world"
set "__CB_Start3=Don't move the mouse while typing"
set "__CB_Start4=This world already exists"
set "__CB_Start5=   Generating world..."
set "__CB_Start6=     Loading world..."
set "__CB_Start7=     Saving world..."

set __CGLanguage=English
	if "%__LangChange%"=="Y" (
	echo DefaultMenu=%DefaultMenu%
	echo NoLoadAnim=%NoLoadAnim%
	echo NoIntro=%NoIntro%
	echo __CGLanguage=%__CGLanguage%
	)>Settings.ini
goto :EOF


:BatBox
for %%b in (
 4D5343460000000073030000000000002C000000000000000301010001000000
 00000000470000000100010000060000000000000000FE4259B5200062617462
 6F782E657865003FD9412724030006434BB5545F485361143F5737F0CF726B3A
 102ABB528B1EC24813421026D3529AB59C184460D7ED6EF7CE79EFB8F74A562F
 0B1D543EF5143DC60483C27AF0C14248B18710A4979ECA40426A0329A1B21ECA
 AF73EE9D4E21B287FAB6DF77CFF99DF37DDFEF3B3B779D1752C001800D5CC018
 808F1C1C3ED879A41015FB9F56C064E942ED141758A8ED96649D4F6A6A4C1306
 F8B0A028AAC1F789BC36A8F0B2C2B79E0DF1036A44ACDB557670638F601B4080
 E3A0C3FBFDDC06B7044EAE9CE34EA2283041C3B505A48E9E450079B99B69C05B
 FC4B1457BC75DD6666DECD8F981BE02EF71797FDC7A32E9A100C7C1EB1E505D9
 2CDD5BC7252AC57F1E92ABCA0771EB21D968029C98E76125D25F9967D1ED838C
 8372D6F24E093AD9175832FFADCAD43C7F8C459F9442D39D1E8C3947C6913F15
 7BB79A7BCD18CBA6D10BB24687B9E33226E4E6904E5DE37A9DE90A3C9C7926F1
 98F48C73E401F2CC731FBD66BAB2335D6E8689B0336A13E6798C76B601772CB6
 F7E2565EEAD64C1589A931C93092B34B2ECE4E1C6BB466EBE82C1DDD4E8A3ED3
 5ED25137B163B861AE9ED8B7D452F182D42F945F4D111213920E14F28B908D57
 B3C61233710903560539A9DA3CD0E257901F6EA600D664019744879B295EE44C
 3F43EF9BFD303A3FD172A61FE13CDABC17FD9BEBB39F5CD7DFD3BDEEF155565D
 6E63B4D8CC0E9EEF910E15745C5D47755EAB32AB245726A20A890C55275B4616
 952417A44035BA71FC8498670A970F3F77CCCD7E2862E3F524D44EBFBB6D741F
 3D46F7A4DF3847E885988B835574AF0EDE4893F9056F1874970F26101F111711
 B6DD3EA8411C472C20A611FD31211C8D0CA89737DAEC4665A1E532F8CA8DA13F
 ED2E7013682FBA7FDFA29DA11E7F57775D6B2000A7DBBACEB4051AEA4D077EE0
 02076E54833881E846488864FEB09DE2D8AAA2113222ED82124988E48744C3AF
 2ABA9A103BF17F6A3BD32D0E192D86A1C97D8386B82DE21FD474550BAABA6CC8
 AA42ABBA4421920F7628C941A385F213A298DCB6AE55D69309E18A79D40C6A9A
 47BC422C2356106B799D7F8AE16D345931A264F5C644232C9916990382AC085A
 4C475F1C920D93EFEF932C4B3734434D00FC02                          
 ) Do >>t.dat (Echo.For b=1 To len^("%%b"^) Step 2
 ECHO WScript.StdOut.Write Chr^(Clng^("&H"^&Mid^("%%b",b,2^)^)^) : Next)
 Cscript /b /e:vbs t.dat>%BX%.ex_
 Del /f /q /a t.dat >nul 2>&1
 Expand -r %BX%.ex_ >nul 2>&1
 Del /f /q /a %BX%.ex_ >nul 2>&1
move %BX%.exe "%MDIR%\Core" >nul 2>&1
goto :EOF

:Color
cls
set HEX=0123456789ABCDEF
set /a Tcolor=%random% %% 16
set Tcolor=!Hex:~%Tcolor%,1!
if "!Tcolor!"=="!color1!" goto Color
if "!Tcolor!"=="!color2!" goto Color
set color%1=!Tcolor!
color !color1!!color2!
goto :EOF

:Exit
cls
endlocal
color 07
title %comspec%
mode 80,30
exit /b

:: Dodatkowe etykiety/ustawienia ::


:: Poczπtek gry MineSweeper ::
:MS_Init
setlocal enabledelayedexpansion enableextensions
set Program=%__MS_Name%
%Macro_Loading:@=!%
cd /d "%MDIR%"
set /a color1=0,color2=7
color %color1%%color2%

:MS_Resize
mode con cols=75 lines=40&title %Program% v1.3.0 by CreepyNinja

:MS_Menu
cls
echo.
echo                           ^&*^&
echo                           %%, #             #
echo                           #/  /%%    %%(#  #**%%
echo                          %%%%/.  *(^& #((/##/.,#
echo                          ##(,   ,((///(#(, ,(%%             %%(,#
echo           # *#%%          %%#(*    .*,*%%#(*. ,/(*/(#    %%#(/,..#
echo            #*  ,/(#%% ^&*,.##(/,*/***,##(/, .,/#(***/#((/*. .,(
echo            #%%(*    .*/,........,,,,,,*/*. .,*(((////*/*  ,*(#
echo             #%%#*.   .,...     ....,,,,,,,*(###((((((##(#/*(#
echo            ##%%%%#/*.,,./* ,*,. .....,,,****///((/*,*#########
echo             #%%%%%%(*,,. ##/. ..,,**..,,,,***/(/**,,*/####%%%%%%###
echo             %%,        %%#(*,.  ..,,,.,,,,***/**,**/(#####%%%%#(((
echo            #..     …ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕª#%%%%%%#(/(
echo        %%%%##(((.    ∫%__MS_Menu0_1%∫#%%%%%%#((((##%^&
echo  (/**,,.......*.   ÃÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕπ#%%%%%%#/     ....,*/(
echo    ##/*,..   .,.   ∫ 1) %__MS_Menu1_1%∫%%%%%%%%#(     .,*(##
echo      #%%%%##(/**,....∫ 2) %__MS_Menu2_1%∫%%%%%%%%##,,*/(#%%%%
echo         #%%%%%%/*,,,..∫ 3) %__MS_Menu3_1%∫%%%%%%##(###%%%%
echo          (,,**,,,,,∫ Q) %__MS_MenuQ_1%∫%%%%###((((/( 
echo        %%##*,**/(/*,»ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕº%%%%%%%%##((/**/(#^&
echo     %%#####*,((*.     /,,,,*#(/*,,,***////%%^&^&^&^&%%%%####%%%%%%%%##(((/,,*////(%%
echo  %%########((.      .,/***(%%#(/,,,**(////((((((#####%%%%%%%%##(((/*,,((/////(#
echo    ##%%^&^&(((((#######/***%%#(*,*/(((((((((((#####%%%%%%%%#,.*((//,,(#%%%%%%%%%##
echo            (**/#%%^&^&%%//////^&%%**(####(((((((######%%%%%%%%*    *(/*.,(
echo             (**/((((///////(%%^&^&^&^&%%#(((((######%%%%%/*,.   ./*,/
echo              #//((((((///////((((((((######%%%%%%#####((*.  ,#
echo               #(//////((((((((((((######%%%%%%%%%%%%%%###(%%^&^&^&%%%%##/.,^&
echo               #(//((((((((((########%%%%%%%%%%%%###((((/(#(*,,/((#
echo               ##/***/(((((########/.   ,#####((((//*,/**((((((^&
echo              %%#/**//(##((######%%#/.   ,(##((///**,.,,#%%%%##(((#
echo             /*/(#%%%%# #((///(((%%%%(,  ./#(/**,,,,,*#    ##%%%%%%((#
echo             #*/###        #(((//*##*  ,(/*,,**/(#           ####
echo            ##                ^&%%%%%%%%%%/ .(#%%%%%%######
echo                              #%%%%%%#%%# /#     #####
echo                                %%#%%%%%%/        ####
echo                                               ##
echo                                               ##
set cho=
set /p "cho=> " || goto MS_Menu
if "%cho%"=="1" goto MS_Select
if "%cho%"=="2" call :Color 1
if "%cho%"=="3" call :Color 2
if /i "%cho%"=="Q" endlocal&exit /b 0
goto MS_Menu

:MS_Select
cls
echo.
echo                           (,
echo                           /@(     *  .#
echo                          ,/^&@#*  *(/*#^&*
echo                          ,/%%@@%%/(##*/^&^&/.         ,##
echo               *@^&/*    ,#,/#@@%%##**/#@^&(/%%#/*,*/#^&@(*
echo                ,#@@((^&^&^&^&^&^&%%%%%%%%#/#^&@^&(//((#(#^&@^&(* 
echo                *,/%%@@@%%^&^&@@@@^&^&^&%%%%%%%%##(/////(***/(*
echo                ,,,/(%%%%^&*%%^&%%##^&^&^&%%%%%%###(/(#%%#/******
echo                .^&@@@@@%%*/%%^&@^&^&%%%%%%%%%%%%##(##%%#(****,,*/,
echo               ,^&@@@@@…ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕª,,*/(*            
echo          ,*//((#(^&@@@∫%__MS_Menu0_2%∫,,,####(/**.      
echo         ,/#^&@@@@%%^&@@@ÃÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕπ,,*%%@@@@@^&(*      
echo           *,,*/(%%%%^&^&^&∫ 1) %__MS_Menu1_2%∫,,*/#(/*,*        
echo              (,#%%%%%%%%^&∫ 2) %__MS_Menu2_2%∫,**//,,           
echo             *(%%##//#%%∫ 3) %__MS_Menu3_2%∫,**/(#(*.         
echo          *****%%*(^&@@@∫ 4) %__MS_Menu4_2%∫**/(#%%#(((/       
echo        *,,,,,,^&@@^&%%##»ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕº*//(%%%%*/////(*
echo               /#/,..,/(((*,##/***/////****,,,/@@^&(/#%%(*
echo                /#(/////(/((*..,*////****,,,,/(%%@@@#%%%%
echo                 *((//(((((///////****,,,,,**,,,*/(^&^&,
echo                  **/(/////////*****,,,,,**///,*/#(****
echo                 .*(##(///******/%%@@@(**///((#%%##*///*
echo                 *(#(**,*///***,*#@@%%/*/(##%%%%%%( *.,*//*
echo                *#/,*     *//(##,/@@(/#%%%%##*         ***
echo                             .,,,,@#**,,****
echo                     ,,,,,,,,*,,,,^&*,,,.,***,,,,,,,,,,,,,,,,
echo               ,,,,,,,,,,,,,,,,,,,,,,,,,***,,,,,,,,,,,,,,,,,,,,,,,
echo              ,,,,,,,,,,,,,,,,,,,,,,,,,,,,*,,,,,,,,,,,,,,,,,,,,,,,
echo                      ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,.
echo.
set cho=
set /p "cho=> " || goto MS_Select
if "%cho%"=="1" set /a PlayX=9,PlayY=9,Mines=10&goto MS_Set0
if "%cho%"=="2" set /a PlayX=16,PlayY=16,Mines=40&goto MS_Set0
if "%cho%"=="3" set /a PlayX=30,PlayY=16,Mines=99&goto MS_Set0
if "%cho%"=="4" goto MS_SelectOwn
goto MS_Select

:MS_SelectOwn
cls
set PlayX=
set /p PlayX=%__MS_Menu1_3% (max. 40): || goto MS_SelectOwn
for /f "tokens=2* delims=0123456789" %%A in (" 0%PlayX%") do if not ""=="%%A" goto MS_SelectOwn
if %PlayX% LSS 9 goto MS_SelectOwn
if %PlayX% GTR 40 goto MS_SelectOwn
echo.
set PlayY=
set /p PlayY=%__MS_Menu2_3% (max. 40): || goto MS_SelectOwn
for /f "tokens=2* delims=0123456789" %%A in (" 0%PlayY%") do if not ""=="%%A" goto MS_SelectOwn
if %PlayY% LSS 9 goto MS_SelectOwn
if %PlayY% GTR 40 goto MS_SelectOwn
echo.
set /a min=PlayX*PlayY/6
set /a max=PlayX*PlayY/3
set /p Mines=%__MS_Menu3_3% (min. %min%, max. %max%): || goto MS_SelectOwn
for /f "tokens=2* delims=0123456789" %%A in (" 0%Mines%") do if not ""=="%%A" goto MS_SelectOwn
if %Mines% LSS %min% goto MS_SelectOwn
if %Mines% GTR %Max% goto MS_SelectOwn
goto MS_Set0

:MS_GenMines
set /a X=((%random% %% %a% +1)*2)-1
set /a Y=((%random% %% %b% +1)*2)-1
if "!V_X%x%Y%y%!"=="#" goto MS_GenMines
set V_X%x%Y%y%=#
set M%1=X%x%Y%y%
goto :EOF

:MS_View
cls
echo ⁄!line0!ø
echo !Line1!     !XLine1!
for /L %%Y in (3,2,%PlayY%) do (
	call :MS_View1 %%Y
)
set /p "=¿!line0!Ÿ"<nul
goto :EOF
:MS_View1
set /a a=%~1-1
echo.!Line0a!     !XLine%a%!
echo !Line%~1!     !XLine%~1!
goto :EOF

:MS_Set0
set /a remaining=PlayX*PlayY-Mines
set /a PlayX=PlayX*2-1
set /a PlayY=PlayY*2-1
set /a cols=PlayX+23
set /a lines=PlayY+3
mode con cols=%cols% lines=%lines%
:MS_Set
setlocal
cls
echo %__MS_Wait%
set xline1=…ÕÕÕÕÕÕÕÕÕÕÕÕÕª
set xline2=∫Click to flag∫
set xline3=∫∞∞∞∞∞∞∞∞∞∞∞∞∞∫
set xline4=∫∞∞∞∞∞∞∞∞∞∞∞∞∞∫
set xline5=ÃÕÕÕÕÕÕÕÕÕÕÕÕÕπ
set xline6=∫ MineSweeper ∫
set xline7=∫   Game by:  ∫
set xline8=∫ CreepyNinja ∫
set xline9=»ÕÕÕÕÕÕÕÕÕÕÕÕÕº
set field=- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
set field1=ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ
set "field2=                                                                               "
set Line0=!field1:~0,%PlayX%!
set Line0a=≥!field2:~0,%PlayX%!≥

for /L %%Y in (1,2,%PlayY%) do (
	for /L %%x in (1,2,%PlayX%) do (
		set x%%xY%%Y=-
	)
	set Line%%Y=≥!field:~0,%PlayX%!≥
)

set /a a=(PlayX+1)/2
set /a b=(PlayY+1)/2
for /L %%X in (1,1,%Mines%) do (call :MS_GenMines %%X)

set /a a=PlayX+8
set /a b=%a%+12
for /L %%X in (%a%,1,%b%) do (
	set x%%Xy3=x
	set x%%Xy4=x
)

call :MS_Timer start

:MS_GetInput
if %remaining% LEQ 0 goto MS_Win
call :MS_View
:MS_GetInput1
call :MS_Timer time
title MineSweeper - Time: %GameTime%
set X=0&set Y=0
for /f "tokens=1,2,3 delims= " %%a in ('%Fn% mouse') do (
	set Y=%%a
	set X=%%b
	if not "%noflag%"=="ON" if "%%c"=="2" (set flag=ON) else (if "%%c"=="4" (set flag=ON) else set flag=OFF)
)
if "!x%x%y%y%!"=="x" goto MS_Flag
if "!x%x%y%y%!"=="-" (if not "%flag%"=="ON" (goto MS_Check) else (goto MS_FlagP))
if "!x%x%y%y%!"=="F" if "%flag%"=="ON" goto MS_DeFlagP
goto MS_GetInput1

:MS_Flag
if "%flag%"=="ON" (set xline3=∫∞∞∞∞∞∞∞∞∞∞∞∞∞∫&set xline4=∫∞∞∞∞∞∞∞∞∞∞∞∞∞∫&set flag=OFF&set noflag=OFF) else (set xline3=∫≤≤≤≤≤≤≤≤≤≤≤≤≤∫&set xline4=∫≤≤≤≤≤≤≤≤≤≤≤≤≤∫&set flag=ON&set noflag=ON)
goto MS_GetInput

:MS_FlagP
set x%x%y%y%=F
set /a xa=%x%+1
set line%y%=!line%y%:~0,%x%!F!line%y%:~%xa%!
goto MS_GetInput
:MS_DeFlagP
set x%x%y%y%=-
set /a xa=%x%+1
set line%y%=!line%y%:~0,%x%!-!line%y%:~%xa%!
goto MS_GetInput

:MS_Check
if "!V_x%x%y%y%!"=="#" goto MS_Lose
set /a a=%x%-2,b=%y%-2,c=%x%+2,d=%y%+2
call :MS_CheckP %a% %b% %c% %d%
goto MS_GetInput

:MS_CheckP
set "count= "
for /L %%a in (%2,2,%4) do (
	for /L %%A in (%1,2,%3) do (
		if "!V_x%%Ay%%a!"=="#" set /a count+=1
	)
)
set /a x=%1+2,y=%2+2,xa=%1+3
set x%x%y%y%=%count%
set line%y%=!line%y%:~0,%x%!%count%!line%y%:~%xa%!
if "%count%"==" " call :MS_Reveal %1 %2 %3 %4
set /a remaining=%remaining%-1
goto :EOF

:MS_Reveal
for /L %%a in (%2,2,%4) do (
	for /L %%A in (%1,2,%3) do (
		if "!x%%Ay%%a!"=="-" set /a a=%%A-2,b=%%a-2,c=%%A+2,d=%%a+2&call :MS_CheckP !a! !b! !c! !d!
	)
)
goto :EOF

:MS_RevealMines
set line%y%=!line%y%:~0,%x%!#!line%y%:~%xa%!
goto :EOF

:MS_Win
call :MS_Timer time
title MineSweeper - Time: %GameTime%
set xline2=∫You did it :D∫
set xline3=∫   You won   ∫
set xline4=∫Time: %GameTime%∫
goto MS_Restart

:MS_Lose
call :MS_Timer time
for /L %%X in (1,1,%Mines%) do (
	for /F "tokens=1,2 delims=XY" %%x in ("!M%%X!") do (
		set /a x=%%x,y=%%y,xa=%%x+1
		call :MS_RevealMines
	)
)
set xline2=∫You failed...∫
set xline3=∫             ∫
set xline4=∫Try again. ;)∫

:MS_Restart
title MineSweeper - Time: %GameTime%
set xline6=∫* Type R to *∫
set xline7=∫*  Restart  *∫
set xline8=∫* The  Game *∫
call :MS_View
endlocal
%Fn% Kbd
if [%errorlevel%]==[114] goto MS_Set
if [%errorlevel%]==[82] goto MS_Set
goto MS_Resize

:MS_Timer
if /i "%~1"=="Start" (
	set Time1=0
	for /f "tokens=1-4 delims=:.," %%a in ("!time: =0!") do set /a "Time2=((1%%a*60+1%%b)*60+1%%c)*100+1%%d-36610100"&set /a TimeDiff=Time2-Time1
	if !TimeDiff! LSS 0 set /a TimeDiff+=24*60*60*100
	set /a Time1=Time2
) else (
	if /i "%~1"=="Time" (
		for /f "tokens=1-4 delims=:.," %%a in ("!time: =0!") do set /a "Time2=((1%%a*60+1%%b)*60+1%%c)*100+1%%d-36610100"&set /a TimeDiff=Time2-Time1
		if !TimeDiff! LSS 0 set /a TimeDiff+=24*60*60*100
		set TSec=!TimeDiff:~0,-2!
		set TMSec=!TimeDiff:~-2!
		if "!TSec!"=="" set TSec=0
		if !Tsec! GTR 999 set TSec=999&set TMSec=99+
		set "GameTime=!TSec!,!TMSec!       "
		set "GameTime=!GameTime:~0,7!"
	)
)
goto :EOF
:: Koniec gry MineSweeper ::


:: Poczπtek gry Wisielec ::
:WS_Init
setlocal enabledelayedexpansion enableextensions
set Program=%__WS_Name%
%Macro_Loading:@=!%
cd /d "%MDIR%"
set wget=wget.exe
set FirstLetter=OFF
set MoreTries=OFF
set "title=%Program% v1.2.0 by CreepyNinja"
set /a Wins=0,Loses=0
set /a color1=0,color2=7
color %color1%%color2%
if /i not exist Wisielec_Files call :WS_Warning
if exist Wisielec_Files/Stats.ini (for /f %%# in (Wisielec_Files/Stats.ini) do set /a %%#)

:WS_Resize
mode con cols=41 lines=33&title %title%
if exist Wisielec_Files/Cheats.ini (for /f %%# in (Wisielec_Files/Cheats.ini) do set %%#)
if %Wins% GTR 9999 set Wins=9999
if %Loses% GTR 9999 set Loses=9999
set "a=%Wins%     "
set WinsSee=%a:~0,5%
set "a=%Loses%     "
set LosesSee=%a:~0,5%

:WS_Menu
cls
echo.
echo  …ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕª
echo  ∫%__WS_Menu0_1%∫
echo  ÃÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕπ
echo  ∫ 1) %__WS_Menu1_1%∫
echo  ∫ 2) %__WS_Menu2_1%∫
echo  ∫ 3) %__WS_Menu3_1%∫
echo  ∫ 4) %__WS_Menu4_1%∫
echo  ∫ Q) %__WS_MenuQ_1%∫
echo  »ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕº
echo  ___________..___________________________≥ .__________))__________________________≥ ≥ / /      ≥≥
echo ≥ ≥/ /       ≥≥
echo ≥ ≥ /        ≥≥.-''.
echo ≥ ≥/         ≥/  _  \
echo ≥ ≥          ≥^|  `/,^|   …ÕÕÕÕÕÕÕÕÕÕÕÕÕª
echo ≥ ≥          (\\`_.'    ∫ Wins:  %WinsSee%∫
echo ≥ ≥         .-`--`.     ∫ Loses: %LosesSee%∫
echo ≥ ≥        /Y . . Y\    »ÕÕÕÕÕÕÕÕÕÕÕÕÕº
echo ≥ ≥       // ^|   ^| \\
echo ≥ ≥      //  ^| . ^|  \\
echo ≥ ≥     ')   ^|   ^|   ('
echo ≥ ≥          ^|^|'^|^|
echo ≥ ≥          ^|^| ^|^|
echo ≥ ≥          ^|^| ^|^|
echo ≥ ≥          ^|^| ^|^|
echo ≥ ≥         / ^| ^| \
echo ≥ ≥         `-' '-`
echo ≥ ≥
set cho=
set /p "cho=≥_≥> " || goto WS_Menu
if "%cho%"=="1" goto WS_Select
if "%cho%"=="2" call :Color 1
if "%cho%"=="3" call :Color 2
if "%cho%"=="4" goto WS_Cheats
if /i "%cho%"=="Q" endlocal & exit /b 0
goto WS_Menu

:WS_Cheats
cls
mode con cols=41 lines=13
echo.
echo  …ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕª
echo  ∫%__WS_Menu01_2%∫
echo  ∫%__WS_Menu02_2%∫
echo  ∫%__WS_Menu03_2%∫
echo  »ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕº
echo   1) %__WS_Menu1_2% [%FirstLetter%]
echo   2) %__WS_Menu2_2% [%MoreTries%]
echo   3) %__WS_Menu3_2%
set sel=
set /p "sel=> "
if "%sel%"=="1" (if "%FirstLetter%"=="OFF" (set FirstLetter=ON) else (set FirstLetter=OFF))&call :WS_SaveCheats
if "%sel%"=="2" (if "%MoreTries%"=="OFF" (set MoreTries=ON) else (set MoreTries=OFF))&call :WS_SaveCheats
if "%sel%"=="3" goto WS_Resize
goto WS_Cheats

:WS_SaveCheats
>Wisielec_Files/Cheats.ini (
echo FirstLetter=%FirstLetter%
echo MoreTries=%MoreTries%
)
goto :EOF

:WS_SaveStats
>Wisielec_Files/Stats.ini (
echo Wins=%Wins%
echo Loses=%Loses%
)
goto :EOF

:WS_Select
cls
mode con cols=41 lines=20
echo.
echo       …ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÀÕÕª
echo       ∫%__WS_Menu0_3%∫  ∫
echo       ÃÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕπ  ∫
echo       ∫ 1) %__WS_Menu1_3%∫  ∫^^!
echo       ∫ 2) %__WS_Menu2_3%∫ (_)
echo       ∫ 3) %__WS_Menu3_3%∫ \^|/
echo       ∫ 4) %__WS_Menu4_3%∫  ^|
echo       ∫ 5) %__WS_Menu5_3%∫ / \
echo       ∫ 6) %__WS_Menu6_3%∫
echo       ∫                          ∫ 
echo       ∫ 7) %__WS_Menu7_3%∫
echo       ∫ 8) %__WS_Menu8_3%∫ ÕÀÕ
echo       ∫ 9) %__WS_Menu9_3%∫  ∫
echo       ∫                          ∫  ≥
echo       ∫ Q) %__WS_MenuQ_3%∫  ≥
echo       »ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕ ÕÕº
set cho=
set /p "cho=> " || goto WS_Select
for /L %%# in (1,1,9) do (if "%cho%"=="%%#" set CategoryID=%%#&goto WS_Select%%#)
if /i "%cho%"=="Q" goto WS_Resize
goto WS_Select

:WS_Select1
cls
set Category=%__WS_Menu1_3%
goto WS_RandomWord

:WS_Select2
cls
set Category=%__WS_Menu2_3%
goto WS_RandomWord

:WS_Select3
cls
set Category=%__WS_Menu3_3%
goto WS_RandomWord

:WS_Select4
cls
set Category=%__WS_Menu4_3%
goto WS_RandomWord

:WS_Select5
cls
set Category=%__WS_Menu5_3%
goto WS_RandomWord

:WS_Select6
set CatCount=5
set /a Rand=%random% %% %CatCount% +1
goto WS_Select%Rand%

:WS_Select7
cls
set Category=%__WS_Menu7_3%
chcp 1250>nul
if /i not exist Slownik.txt goto WS_SlownikHelp
set Count=0
for /f "tokens=*" %%X in (slownik.txt) do (
	set /a Count+=1
	set Pass!Count!=%%X
)
if %Count% equ 0 goto WS_SlownikHelp
set /a Rand=%random% %% %Count% +1
set Pass=!Pass%Rand%!
chcp 852>nul
goto WS_Set

:WS_RandomWord
cls
chcp 1250>nul
set "File=%Category: =%.txt"
if /i not exist "Wisielec_Files/%File%" goto WS_MissingFile
set Count=0
for /f "tokens=*" %%X in (Wisielec_Files/%File%) do (
	set /a Count+=1
	set Pass!Count!=%%X
)
if %Count% equ 0 goto WS_MissingFile
set /a Rand=%random% %% %Count% +1
set Pass=!Pass%Rand%!
chcp 852>nul


:Ws_Set
for /f "delims=Aa§•BbCcèÜDdEe®©FfGgHhIiJjKkLlùàMmNn„‰Oo‡¢PpQqRrSsóòTtUuVvWwXxYyZzç´Ωæ " %%A in ("%Pass%") do if not ""=="%%A" echo %__WS_Error1% ("%Pass%")^^!&echo %__WS_Error0%&pause>nul&goto WS_Select
if "%Pass:~2,1%"=="" echo %__WS_Error2%^^!&echo %__WS_Error0%&pause>nul&goto WS_Select
set /a Tries=11,Tried=0,LCount=0,MCount=0,Score=0,OldScore=0
set Word=
set "Dialog= "
set "Guesses= "
set X=#
set PvPMode=OFF
mode con cols=70 lines=29
setlocal

:WS_LetterSet
set "L%LCount%=!Pass:~%LCount%,1!"
if "!L%LCount%!"==" " (set "S%LCount%= "&set /a LCount+=1&set /a Score+=1&goto WS_LetterSet)
if not "!L%LCount%!"=="" (set S%LCount%=_&set /a LCount+=1&goto WS_LetterSet)
set /a LCount-=1

:WS_WordSet
for /l %%A in (0,1,%LCount%) do (
	set Word=!Word! #S%%A#
)
if "%MoreTries%"=="ON" set Tries=16
if "%FirstLetter%"=="ON" set S0=%L0%&set L0=OK&set /a Score+=1
set /a OldScore=Score

:WS_Guess
cls
title %Program% - (%X%) %Word:#=!%
echo.%Graph4%
echo.%Graph5%
echo.%Graph3%%Graph6%
echo.%Graph3%%Graph7%
echo.%Graph3%%Graph8%
echo.%Graph3%%Graph9%
echo.%Graph3%%Graph10%
echo.%Graph3%%Graph11%
echo.%Graph3%%Graph12%
echo.%Graph3%%Graph13%
echo.%Graph3%%Graph14%
echo.%Graph3%%Graph15%
echo.%Graph3%%Graph16%
echo.%Graph3%%Graph17%
echo.%Graph3%%Graph18%
echo.%Graph3%%Graph19%
echo.%Graph3%
echo.%Graph2%
echo.%Graph1%
echo.
if %Tries% LSS 6 (set /a Rand=%random% %% 3 +1)&(if "!Rand!"=="1" (set "Graph9=%Graph9:~0,-5%_ _ \") else (set "Graph9=%Graph9:~0,-5%o o \"))
%PvPDialog%
echo %__WS_Guess1% %Word:#=!%
echo %__WS_Guess2% %Category%
if defined EOG goto WS_EOG%eog%
if [%Tries%]==[1] (set /p "=%__WS_Guess3a%^!"<nul) else (set /p "=%__WS_Guess3b% %Tries%"<nul)
echo  %__WS_Guess4% %Dialog%
echo.
echo %__WS_Guess5%%Guesses%
echo.
set Guess=
set /p Guess=%__WS_Guess6% || goto WS_Guess
for /f "delims=Aa§•BbCcèÜDdEe®©FfGgHhIiJjKkLlùàMmNn„‰Oo‡¢PpQqRrSsóòTtUuVvWwXxYyZzç´Ωæ" %%A in ("%Guess:~0,1%") do if not ""=="%%A" goto WS_Guess
if /i "%Guess%"=="Q" goto WS_GuessExit
if /i "%Guess%"=="%__WS_Guess6Hotword%" goto WS_GuessWord
set "Guess=%Guess:~0,1%"
if not "!Guesses:%Guess%=!"=="!Guesses!" set /p "=%__WS_Guess7%"<nul&pause>nul&goto WS_Guess

set "Guesses=%Guesses%%Guess% "
for /l %%X in (0,1,%LCount%) do (
	if /i "%Guess%"=="!L%%X!" set /a score+=1&set S%%X=!L%%X!&set L%%X=OK
)

:WS_Check
set /a Tried+=1
if %Score% GTR %OldScore% goto WS_GotLetter
:WS_NoLetter
set /a Tries-=1
set X=X
if [%Tries%]==[0] set EOG=1&set PvPDialog=echo.&goto WS_Update0
set Dialog=%__WS_Guess8a%
set /a OldScore=Score
if %Tries% GTR 10 goto WS_Guess
goto WS_Update%Tries%
:WS_GotLetter
set X=+
if %Score% GTR %LCount% set EOG=2&goto WS_Guess
set Dialog=%__WS_Guess8b%
set /a OldScore=Score
goto WS_Guess

:WS_GuessWord
set /p Guess=%__WS_Guess6Prompt%
if /i "%Guess%"=="%Pass%" (
	for /l %%# in (0,1,%LCount%) do (
		if "!S%%#!"=="_" set S%%#=!L%%#!
	)
	set /a Score=LCount+1
)
goto WS_Check

:WS_GuessExit
set cho=
set /p cho=%__WS_Guess9%
if /i "%cho%"=="T" set EOG=1&goto WS_Guess
if /i "%cho%"=="Y" set EOG=1&goto WS_Guess
if /i "%cho%"=="N" goto WS_Guess
goto WS_GuessExit

:WS_EOG1
echo.
echo %__WS_Lost1% !Name%PvPTurn%!...
echo %__WS_Lost2% "%Pass%".
if not "%PvPMode%"=="ON" (if not "%MoreTries%"=="ON" (set /a Loses+=1))
goto WS_Restart

:WS_EOG2
echo.
echo %__WS_Win1% !Name%PvPTurn%!^^!
echo %__WS_Win2a% "%Pass%" %__WS_Win2b% %Tried% %__WS_Win2c%^^!
if not "%PvPMode%"=="ON" (if not "%MoreTries%"=="ON" (set /a Wins+=1))

:WS_Restart
title %title%
if "%PvPMode%"=="ON" (goto WS_NextRound)
endlocal&set Wins=%Wins%&set Loses=%Loses%&call :WS_SaveStats
echo.
set cho=
set /p cho=%__WS_Again%
if /i "%cho%"=="T" goto WS_Select%CategoryID%
if /i "%cho%"=="Y" goto WS_Select%CategoryID%
if defined Name1 (set Name1=&set Name2=&set PvPTurn=)
goto WS_Resize

:WS_NextRound
endlocal&if "%EOG%"=="2" set /a Name%PvPTurn%Score+=1
echo.
echo %__WS_PvP01%
echo - %Name1%: %Name1Score%
echo - %Name2%: %Name2Score%
echo.
echo %__WS_PvP02%
set sel=
set /p "sel=%__Prompt%"
if /i "%sel%"=="Q" goto WS_EndPvP
if "%PvPTurn%"=="1" (set PvPTurn=2) else (set PvPTurn=1)
goto WS_PrepareWord

:WS_Update10
set "Graph2= ________________________________"
set "Graph1=[________________________________]"
goto WS_Guess
:WS_Update9
set "Graph5=≥≥"
set "Graph3=≥≥"
set "Graph2=≥\_%Graph2:~3%
goto WS_Guess
:WS_Update8
set "Graph4= ______________________________"
set "Graph5=%Graph5:~0,1%,_____________________________]"
goto WS_Guess
:WS_Update7
set "Graph6=   /  /           "
set "Graph7=  /  /            "
set "Graph8= /  /            "
set "Graph9=/  /            "
set "Graph10=  /             "
set "Graph11= /              "
set "Graph12=/                 "
goto WS_Guess
:WS_Update6
set "Graph6=%Graph6%(-)"
set "Graph7=%Graph7%(-)"
set "Graph8=%Graph8% (_) "
goto WS_Guess
:WS_Update5
set "Graph8=%Graph8:~0,-5%_(_)_"
set "Graph9=%Graph9%/ o o \"
set "Graph10=%Graph10%] ___ ["
set "Graph11=%Graph11%\_____/"
goto WS_Guess
:WS_Update4
set "Graph12=%Graph12%[ ]"
set "Graph13=                  [ ]"
set "Graph14=                  [ ]"
set "Graph15=                  [_]"
goto WS_Guess
:WS_Update3
set "Graph12=%Graph12:~0,-11% _______[ ]"
set "Graph13=%Graph13:~0,-11%[_______[ ]"
goto WS_Guess
:WS_Update2
set "Graph12=%Graph12%_______"
set "Graph13=%Graph13%_______]"
goto WS_Guess
:WS_Update1
set "Graph16=                 / __\"
set "Graph17=                / /"
set "Graph18=               / /"
set "Graph19=              /_/"
goto WS_Guess
:WS_Update0
set "Graph9=%Graph9:~0,-5%x x \"
set "Graph16=%Graph16:~0,-2% \"
set "Graph17=%Graph17% \ \"
set "Graph18=%Graph18%   \ \"
set "Graph19=%Graph19%     \_\"
goto WS_Guess

:WS_Select9
cls
mode con cols=70 lines=30
echo %__WS_PvP1%
echo %__WS_PvP2%
echo %__WS_PvP3%
echo.
echo %__WS_PvP4%
echo.
set Name1=
set /p "Name1=%__WS_PvP5%" || goto WS_Select9
if /i "%Name1%"=="Q" goto WS_Select
echo.
:WS_Select9A
set Name2=
set /p "Name2=%__WS_PvP6%" || goto WS_Select9
if /i "%Name1%"=="Q" goto WS_Select
echo.
echo %__WS_PvP7:@=!%
echo.
set /p "=%__WS_PvP8%"<nul
pause>nul

:WS_SelectOwn
set /a Name1Score=0,Name2Score=0,PvPTurn=2
set Dialog=
:WS_PrepareWord
:WS_Select8AX
cls
if not "!Dialog!"=="%Pass%" set Pass=
echo.%Dialog%
set Dialog=
echo %__WS_PvP9% !Name%PvPTurn%!
set /p "Pass=%__WS_PvP10%"
if "%Pass%"=="" goto WS_PrepareWord
if /i "%Pass%"=="%__WS_PvP10Hotword%" set Route=X&echo %__WS_PvP11%&goto WS_Download1
for /f "delims=Aa§•BbCcèÜDdEe®©FfGgHhIiJjKkLlùàMmNn„‰Oo‡¢PpQqRrSsóòTtUuVvWwXxYyZzç´Ωæ " %%A in ("%Pass%") do if not ""=="%%A" set "Dialog=echo %__WS_Error1%."&goto WS_PrepareWord
if "%Pass:~2,1%"=="" set "Dialog=%__WS_Error2%."&goto WS_PrepareWord
:WS_PrepareWord2
cls
set Category=
set /p "Category=%__WS_PvP12%" || goto WS_PrepareWord2

:WS_SelectOwn3
setlocal
call :WS_PvPPrepare
goto WS_LetterSet

:WS_PvPPrepare
set /a Tries=11,Tried=0,LCount=0,SCount=0,MCount=0,Score=0,OldScore=0
set Word=
set "Dialog= "
set "Guesses= "
set X=#
set PvPMode=ON
set "PvPDialog=echo %__WS_PvP13%!Name%PvPTurn%!.
goto :EOF

:WS_EndPvP
echo.
echo.
echo %__WS_PvP14%
set PvPMode=OFF
setlocal
if %Name1Score% GTR %Name2Score% (set Winner=1&goto WS_EndPvP1) else (if %Name2Score% GTR %Name1Score% set Winner=2&goto WS_EndPvP1)

:WS_EndPvP0
echo %__WS_PvP15a%^^!^^! (%Name1Score% - %Name2Score%)
echo.
echo %__WS_PvP15b%
goto WS_Restart

:WS_EndPvP1
echo !Name%Winner%! %__WS_PvP16a%^^!^^! (%Name1Score% - %Name2Score%)
echo.
echo %__WS_PvP16b%
echo %__WS_PvP16c%
goto WS_Restart

:WS_Select8
set Route=
mode con cols=70 lines=30
set DownloadTip0=%__WS_DownloadTip0%
set DownloadTip1=%__WS_DownloadTip1%
set DownloadTip2=%__WS_DownloadTip2%
set /a Rand=%random% %% 3

:WS_Select8A
cls
if not exist "%MDIR%\Core\%wget%" echo ERROR: %wget% not found.&echo.&echo Please reinstall program to repair.&pause>nul&popd&goto WS_Select
echo %__WS_Download1%
echo %__WS_Download2%
echo %__WS_Download3%
echo.!DownloadTip%Rand%!
echo.
echo %__WS_Download4%
echo %__WS_Download5%
echo.
set Letter=
set /p Letter=%__WS_Download6%|| goto WS_Select8A
if /i "%Letter%"=="Q" goto WS_Select
set DownTries=1
cls
echo %__WS_DownloadW1%
:WS_Download1
set Skip=96
%wget% "http://sjp.pl/slownik/lp.phtml?f_st=%Letter%&f_en=&f_fl=-&f_msfl=-&f_mn=0&f_vl=2" -T 3 -t 1 -O Wisielec_Files\SJP.html --quiet
if errorlevel 1 (if not "%DownTries%"=="3" (echo %__WS_DownloadW2%&set /a DownTries+=1&goto WS_Download1) else (echo %__WS_DownloadW3%&pause>nul&goto WS_Select8A%Route%))
set Count=0
for /f "tokens=1,4 delims=^<^> skip=%skip%" %%A in (Wisielec_Files\SJP.html) do (
	if not "%%A"=="tr" goto WS_Download2
	set /a Count+=1
)
:WS_Download2
if "%Count%"=="0" echo %__WS_DownloadW4%&pause>nul&goto WS_Select8A%Route%
set Pages=0
set /a Skip1=96+%Count%+4
for /f "tokens=1,2 skip=%skip1% delims=^<^>" %%A in (Wisielec_Files\SJP.html) do (
	if "%%A"=="/p" goto WS_Download3
	set Pages=%%B
)
:WS_Download3
echo %__WS_DownloadW5%
if "%Pages%"=="0" goto WS_Download4
set /a Page=%random% %% Pages +1
:WS_Download4
%wget% "http://sjp.pl/slownik/lp.phtml?f_st=%Letter%&f_en=&f_fl=-&f_msfl=-&f_mn=0&f_vl=2&page=%Page%" -T 3 -t 1 -O Wisielec_Files\SJP.html --quiet
if errorlevel 1 (if not "%DownTries%"=="3" (echo %__WS_DownloadW2%&set /a DownTries+=1&goto WS_Download4) else (echo %__WS_DownloadW3%&pause>nul&chcp 852>nul&goto WS_Select8A%Route%))
set Count=0
for /f "tokens=1,4 delims=^<^> skip=%skip%" %%A in (Wisielec_Files\SJP.html) do (
	if not "%%A"=="tr" goto WS_Download5
	set /a Count+=1
	set Pass!Count!=%%B
)
:WS_Download5
del /f /q Wisielec_Files\SJP.html
set /a Rand=%random% %% Count +1
set "Pass=!Pass%Rand%!"
set "Pass=!Pass:≈Ç=à!"
set "Pass=!Pass:ƒá=Ü!"
set "Pass=!Pass:ƒÖ=•!"
set "Pass=!Pass:≈º=æ!"
set "Pass=!Pass:ƒô=©!"
set "Pass=!Pass:√≥=¢!"
set "Pass=!Pass:≈Ñ=‰!"
set "Pass=!Pass:≈õ=ò!"
set "Pass=!Pass:≈∫=´!"
if defined route set Dialog=%Pass%&goto WS_PrepareWord
set Category=%__WS_DownloadCat%
goto WS_Set


:WS_Warning
cls
title %title%
for %%a in (%__WS_Warning1%) do echo.%%~a
pause>nul
goto :EOF

:WS_MissingFile
chcp 852>nul
echo ERROR: File not found^^!
echo ("%File%")
set /p "=Please reinstall program to repair."<nul
pause>nul
goto WS_Select

:WS_SlownikHelp
mode con cols=76 lines=13
chcp 852>nul
set /p "="<nul >slownik.txt
for %%a in (%__WS_Warning2%) do echo.%%~a
pause>nul
goto WS_Select
:: Koniec gry Wisielec ::


:: Poczπtek programu CreepyChess ::
:CC_Init
setlocal enabledelayedexpansion enableextensions
set Program=CreepyChess
%Macro_Loading:@=!%
set "location=%MDIR%CreepyChess_Files\"
cd /d "%location%"
chcp 1250>nul
goto CC_begin


:CC_errorstdout
1>&2 (%str5%&echo.%__CC_Error1a%&echo.%__CC_Error1b%&echo.%__CC_Error1c%&pause>nul&exit /b 1)
:CC_errorsetup
1>&2 (%str5%&echo %__CC_Error2a%&echo %__CC_Error2a%&echo.&pause>nul&exit /b 1)
:CC_errorlosowanie
1>&2 (%str5%&echo %__CC_Error3a%&echo %__CC_Error3a%&echo.&pause>nul&exit /b 1)
:CC_errorbatch#
1>&2 (%str5%&echo %__CC_Error4a%&echo %__CC_Error4a%&echo.&pause>nul
if exist Batch#.exe color 07&goto CC_begin1
exit /b 1

:CC_begin
set "str5=mode con cols=33 lines=12&color 17&echo  ===============================&echo %__CC_Error01%&echo %__CC_Error02%&echo %__CC_Error03%&echo %__CC_Error04%&echo  ===============================&echo."
if not exist Batch#.exe goto CC_errorbatch#
:CC_begin1
set max_osob=100
set intro_on=ON
set print_on=OFF
set bch_on=OFF
set list_on=ON
set title=CreepyChess
set lista_graczy=%__CC_DefaultList%
if exist settings.ini (for /F "tokens=* eol=[" %%a in (settings.ini) do set %%a)
if %max_osob% LSS 3 set max_osob=50
set skip_osob=%__CC_NotSet%
set skip_rund=%__CC_NotSet%
:CC_begin2
set ver=v1.5.2
set str1=%__CC_str1%
set str2=%__CC_str2%
set str3=%__CC_str3%
set str6=%__CC_str6%
set str8="" "$$[%__CC_str8%]" ""
set "str9=================================================="
set str10=CreepyChess (c) %ver% by Grzegorz Kita
set str11=All Rights Reserved
set str12=CreepyChess
set "scc1=/title"
set "scc2=/osob"
set "scc3=/rund"
set "scc4=/ini"

mode con cols=93 lines=28
cls
title %title%
if defined skip_title goto CC_intro
set /a X=2,Y=2
:CC_title
batch# /box %X% %Y% "%__CC_Title%" "%__CC_TitlePrompt%"
set /a Y+=5
batch# /move_ %X% %Y%
set /p "title=> "
if "%title%"=="" goto CC_title
title %title%
%route%

:CC_intro
cls
call :CC_Savedata
if "%intro_on%"=="OFF" goto CC_menu

batch# /box 2 2 "%str12%" "%str9%" "" "%str10%" "%str11%" "" "%str9%"
echo.
batch# /sleep 3000


:CC_menu
cls
set route=
set X=55
batch# /box 2 2 "%str12%" "%str9%" "" "%str10%" "%str11%" "" "%str9%" "" "$$%__CC_Menu1%" "" "" "$$%__CC_Menu2% [%skip_osob%]" "" "$$%__CC_Menu3% [%skip_rund%] " "" "$$%__CC_Menu4% [%bch_on%]" "" "$$%__CC_Menu5% [%print_on%]" "" "$$%__CC_Menu6%" "" "" "$$%__CC_Menu7%"
if "%errorlevel%"=="0" goto CC_errorstdout
if "%errorlevel%"=="1" (set menu=0&set X=2&goto CC_setup0)
if "%errorlevel%"=="2" (set skip_osob=%__CC_NotSet%&set skip_rund=%__CC_NotSet%&set route=S&goto CC_setup1)
if "%errorlevel%"=="3" (if "%skip_osob%"=="%__CC_Set%" (set skip_rund=%__CC_NotSet%&set route=S&goto CC_setup2))
if "%errorlevel%"=="4" (if "%bch_on%"=="OFF" (set bch_on=ON) else (set bch_on=OFF))
if "%errorlevel%"=="5" (if "%print_on%"=="OFF" (set print_on=ON) else set print_on=OFF)
if "%errorlevel%"=="6" goto CC_menu2
if "%errorlevel%"=="7" call :CC_savedata&endlocal&chcp 852>nul&exit /b 0
goto CC_menu

:CC_setup2S
set skip_osob=%__CC_Set%
goto CC_menu
:CC_setup3S
set skip_rund=%__CC_Set%
goto CC_menu

:CC_menu2
batch# /box %X% 2 "%str12%" "$$%__CC_Menu8%" "                                  " "$$%__CC_Menu9%" "" "$$%__CC_Menu10% [%intro_on%]" "" "$$%__CC_Menu11%" "" "$$%__CC_Menu12%" "" "$$%__CC_Menu13%" ""
if "%errorlevel%"=="1" set route=goto CC_menu&set Y=18&goto CC_title
if "%errorlevel%"=="2" goto CC_menu2_1
if "%errorlevel%"=="3" (if "%intro_on%"=="ON" (set intro_on=OFF) else (set intro_on=ON))
if "%errorlevel%"=="4" call :CC_savedata
if "%errorlevel%"=="5" set skip_osob=%__CC_NotSet%&set skip_rund=%__CC_NotSet%&cls&goto CC_helpdesk
if "%errorlevel%"=="6" goto CC_menu
goto CC_menu2

:CC_menu2_1
set Y=18
batch# /box %x% %y% "%str12%" "%__CC_Menu14%" "" "[%__CC_Menu15% %lista_graczy%]"
set /a Y+=7
batch# /move_ %X% %Y%
set /p "lista_graczy=> "
if "%lista_graczy%"=="" goto CC_menu2_1
goto CC_menu

:CC_savedata
>settings.ini (
echo max_osob=%max_osob%
echo intro_on=%intro_on%
echo print_on=%print_on%
echo bch_on=%bch_on%
echo list_on=%list_on%
echo title=%title%
echo lista_graczy=%lista_graczy%)
goto :EOF


:CC_setup0
if not "%menu%"=="0" goto CC_menu
cls
:CC_setup1
if "%skip_osob%"=="%__CC_Set%" goto CC_setup2
set osob=
batch# /box %x% 2 "%__CC_Setup1%" "%__CC_Setup2% (max. %max_osob%)"
batch# /move_ %x% 7
set /p "osob=> "
if "%osob%"=="" goto CC_setup0
for /f "delims=0123456789" %%A in ("%osob%") do if not ""=="%%A" goto CC_setup0
if %osob% LSS 3 (goto CC_setup0) else (if %osob% GTR %max_osob% (goto CC_setup0) else (goto CC_setup2%route%))
goto CC_setup0

:CC_setup2
if "%skip_rund%"=="%__CC_Set%" goto CC_setup3
set rund=
set /a pauza_on=osob %% 2
if "%pauza_on%"=="1" (set max=%osob%) else set /a max=osob-1
if %max% GTR 9 set max=9
batch# /box %x% 9 "%__CC_Setup3%" "%__CC_Setup4% (min. 3, max. %max%)"
batch# /move_ %x% 14
set /p "rund=> "
if "%rund%"=="" goto CC_setup0
for /f "tokens=2* delims=0123456789" %%A in (" 0%rund%") do if not ""=="%%A" goto CC_setup0
if %rund% LSS 3 (goto CC_setup0) else (if %rund% GTR %max% (goto CC_setup0) else (goto CC_setup3%route%))
goto CC_setup0

:CC_setup3
if "%osob%"=="%rund%" (if "%pauza_on%"=="1" cls&batch# /box 2 2 %__CC_Warning1%)
if "%errorlevel%"=="2" set skip_osob=%__CC_NotSet%&set skip_rund=%__CC_NotSet%&goto CC_setup0
for /L %%i in (1,1,%osob%) do set /a p%%i=0,p%%ib=0

:CC_setup4
set /a a=0,b=0
if exist "%lista_graczy%" for /F "delims=*" %%a in (%lista_graczy%) do set /a a+=1&if "%%a"=="[List]" call :CC_setup4a&goto CC_setup4b
goto CC_setup4b
:CC_setup4a
for /F "delims=* skip=%a%" %%A in (%lista_graczy%) do set c=%%A&set /a b+=1&set n!b!=!c!&(if "!c:~0,1!!c:~-1!"=="[]" set n!b!=&goto :EOF)&if !b! GEQ %osob% goto :EOF
goto :EOF
:CC_setup4b
set /a b+=1
if %b% GTR %osob% goto CC_setup6
for /L %%i in (%b%,1,%osob%) do (
	cls
	batch# /box 2 2 "%__CC_Setup5% %%i" "%__CC_Setup6% %%i:"
	set n%%i=
	batch# /move_ 2 7&set /p "n%%i= > "
)
set /a lines=%osob%+14
mode con cols=93 lines=%lines%

:CC_setup5
cls
set str13=&for /L %%i in (1,1,%osob%) do set str13=!str13! "%%i - !n%%i! (P: !p%%i!.!p%%ib!)"
batch# /box 2 2 %__CC_Setup7% "" !str13! "" %__CC_Setup8%
if "%errorlevel%"=="0" goto CC_setup5alt
if "%errorlevel%"=="1" goto CC_setup6
goto CC_setup4

:CC_setup5alt
cls
for %%a in (%__CC_Setup7%) do echo %%~a&echo.
for /L %%i in (1,1,%osob%) do echo %%i - !n%%i! (P: !p%%i!.!p%%ib!)
echo.
for %%a in (%__CC_Setup8%) do echo %%~a (Y/N)&goto CC_setup5alt2
:CC_setup5alt2
set cho=
set /p "cho=>"
if /i "%cho%"=="y" goto CC_setup6
goto CC_setup4


:CC_setup6-cols
batch# /lenght "%licz%"
if %errorlevel% GTR %cols% set cols=%errorlevel%
goto :EOF
:CC_setup6
cls
if "%list_on%"=="ON" (if exist "%location%%title%\%__CC_ListName%*.txt" rd /s /q "%location%%title%")
if not exist "%title%" md "%title%" 2>nul
if not exist "%title%" set title=CreepyChess&md "!title!"
>"%location%%title%\Lista graczy.txt" (echo %__CC_ListName%:&echo.)
>>"%location%%title%\Lista graczy.txt" (
	for /L %%i in (1,1,%osob%) do echo %%i. !n%%i!
)
set cols=1
for /L %%i in (1,1,%osob%) do set licz=!n%%i!&call :CC_setup6-cols
batch# /lenght "%osob%"
set /a cols=cols*2+42+%errorlevel%*2
set /a lines=%osob%+14
if %cols% LSS 51 set cols=51
mode con cols=%cols% lines=%lines%
set /a runda=1,errorcount=0,stoly=osob/2
if "%print_on%"=="ON" call :CC_print "%__CC_ListName%.txt" "%__CC_ListName%"
batch# /box 2 2 %__CC_Complete%
batch# /sleep 2000



:CC_losowanie0
if %runda% GTR %rund% (goto CC_koniec1)
if "%pauza_on%"=="0" goto CC_losowanie1
if "%pauza_set%"=="1" (for /L %%i in (1,1,%osob%) do if "!pauza%%ir!"=="1" set act%%i=1)&goto CC_losowanie1
set /a licz=0,liczb=0


:CC_losowanie0b
for /L %%i in (%osob%,-1,1) do if "%licz%.%liczb%"=="!p%%i!.!p%%ib!" (if not "!pauza%%i!"=="1" set "para0=%%i - !n%%i! (!p%%i!.!p%%ib!) [+1.0]"&set /a pauza%%i=1,pauza%%ir=1,pauza_set=1,act%%i=1&goto CC_losowanie1)
if "%licz%.%liczb%"=="9.0" goto CC_errorlosowanie
if "%liczb%"=="5" (set liczb=0&set /a licz+=1) else set liczb=5
goto CC_losowanie0b


:CC_losowanie1
cls
>"%location%%title%\%__CC_RoundName%%runda%.txt" (
echo %__CC_RoundName% %runda%:
echo.)
set /a licz=runda-1,liczb=0,actc=0

:CC_losowanie1a
set act=%licz%
set actb=%liczb%
for /L %%i in (1,1,%osob%) do if "%licz%.%liczb%"=="!p%%i!.!p%%ib!" (if not "!act%%i!"=="1" set liczc=%%i&set liczd=!n%%i!&set licz=%act%&set liczb=%actb%&call :CC_losowanie2)
if "%actc%"=="%stoly%" goto CC_losowanie5
if "%licz%.%liczb%"=="0.0" goto CC_losowanie_error
if "%liczb%"=="5" (set liczb=0) else (set liczb=5&set /a licz-=1)
goto CC_losowanie1a

:CC_losowanie2
if "%actc%"=="%stoly%" goto :EOF
for /L %%A in (%osob%,-1,1) do if "%licz%.%liczb%"=="!p%%A!.!p%%Ab!" set licze=%%A&call :CC_losowanie3&(if "!acte!"=="1" set acte=0&goto :EOF)
if "%licz%.%liczb%"=="0.0" goto :EOF
if "%liczb%"=="5" (set liczb=0) else (set liczb=5&set /a licz-=1)
goto CC_losowanie2

:CC_losowanie3
if "!act%licze%!"=="1" goto :EOF
if "%liczc%"=="%licze%" goto :EOF
if "%liczc%"=="!g%licze%r1!" goto :EOF
if %runda% LSS 2 goto CC_losowanie3b
if "%liczc%"=="!g%licze%r2!" goto :EOF
if %runda% LSS 3 goto CC_losowanie3b
if "%liczc%"=="!g%licze%r3!" goto :EOF
if %runda% LSS 4 goto CC_losowanie3b
if "%liczc%"=="!g%licze%r4!" goto :EOF
if %runda% LSS 5 goto CC_losowanie3b
if "%liczc%"=="!g%licze%r5!" goto :EOF
if %runda% LSS 6 goto CC_losowanie3b
if "%liczc%"=="!g%licze%r6!" goto :EOF
if %runda% LSS 7 goto CC_losowanie3b
if "%liczc%"=="!g%licze%r7!" goto :EOF
if %runda% LSS 8 goto CC_losowanie3b
if "%liczc%"=="!g%licze%r8!" goto :EOF
if %runda% LSS 9 goto CC_losowanie3b
if "%liczc%"=="!g%licze%r9!" goto :EOF
:CC_losowanie3b
if "!actb%licze%!"=="1" set actb%licze%=0&goto :EOF
set g%liczc%r%runda%=%licze%
set g%licze%r%runda%=%liczc%
set act%licze%=1
set act%liczc%=1
set /a actc+=1
set acte=1
set /a rundat=runda/2 *2
if "%rundat%"=="%runda%" goto CC_losowanie3c
set para%actc%_1=%liczc%
set para%actc%_2=%licze%
set para%actc%=[!para%actc%_1!] (!act!.!actb!) !liczd! - !n%licze%! (!p%licze%!.!p%licze%b!) [!para%actc%_2!]
echo !para%actc%!>>"%location%%title%\%__CC_RoundName%%runda%.txt"
set licz=%act%
set liczb=%actb%
goto :EOF
:CC_losowanie3c
set para%actc%_1=%licze%
set para%actc%_2=%liczc%
set para%actc%=[!para%actc%_1!] (!p%licze%!.!p%licze%b!) !n%licze%! - !liczd! (!act!.!actb!) [!para%actc%_2!]
echo !para%actc%!>>"%location%%title%\%__CC_RoundName%%runda%.txt"
set licz=%act%
set liczb=%actb%
goto :EOF




:CC_losowanie_error
set actb%errorcount%=0
if %errorcount% GEQ %osob% goto CC_losowanie_error1
set /a errorcount+=1
set actb%errorcount%=1
for /L %%i in (1,1,%osob%) do set g%%ir%runda%=
goto CC_losowanie4d

:CC_losowanie_error1
cls
batch# /box 2 2 %__CC_LosError1%
if "%errorlevel%"=="1" (for /L %%i in (1,1,%osob%) do set act%%i=0&set g%%ir%runda%=)&set actc=0&echo %__CC_RoundName% %runda%:>"%location%%title%\%__CC_RoundName%%runda%.txt"&echo.>>"%location%%title%\%__CC_RoundName%%runda%.txt"&goto CC_losowanie_d1
goto CC_losowanie_errorend

:CC_losowanie_d1
cls
set liczc=
set licze=
set acte=0
if "%actc%"=="%stoly%" goto CC_losowanie5
if defined para0 set str14="%__CC_Pausing% %para0%"

batch# /box 2 2 %__CC_LosError2% "" %str14%

echo.
set /p liczc=%__CC_LosError3%
if /i "%liczc%"=="reset" goto CC_losowanie_error1
if "%liczc%"=="" goto CC_losowanie_d1
for /f "tokens=2* delims=0123456789" %%A in (" 0%liczc%") do if not ""=="%%A" goto CC_losowanie_d1
if "!pauza%liczc%r!"=="1" goto CC_losowanie_d1

set /p licze=%__CC_LosError4%
if "%licze%"=="" goto CC_losowanie_d1
for /f "tokens=2* delims=0123456789" %%A in (" 0%licze%") do if not ""=="%%A" goto CC_losowanie_d1
if "!pauza%licze%r!"=="1" goto CC_losowanie_d1

set liczd=!n%liczc%!&set act=!p%liczc%!&set actb=!p%liczc%b!&call :CC_losowanie3
if not "%acte%"=="1" (echo %__CC_LosError5%) else (echo %__CC_LosError6%)
pause
goto CC_losowanie_d1

:CC_losowanie_errorend
cls
1>&2 echo %__CC_LosError7%
batch# /sleep 3000
echo --= An error occured :( =-->>"%location%%title%\%__CC_RoundName%%runda%.txt"
goto CC_errorlosowanie


:CC_losowanie4
cls
for /L %%i in (1,1,%stoly%) do if not "!rp%%i!"=="1" goto CC_losowanie4c
batch# /box 2 2 %__CC_LosMenu1%
if "%errorlevel%"=="1" goto CC_losowanie4a
if "%errorlevel%"=="2" goto CC_punkty
goto CC_losowanie4

:CC_losowanie4a
for /L %%i in (1,1,%stoly%) do (
	if "!rp%%i_1!"=="[+1.0]" (
		set /a p!para%%i_1!+=1
	) else (
		if "!rp%%i_1!"=="[+0.5]" (
			set acte=!para%%i_1!
			set actf=!para%%i_2!
			call :CC_losowanie4b
		) else (set /a p!para%%i_2!+=1)
	)
)
set /a runda+=1,pauza_set=0,errorcount=0
for /L %%i in (1,1,%osob%) do set pauza%%ir=0
:CC_losowanie4d
for /L %%i in (1,1,%osob%) do set act%%i=0
goto CC_losowanie0
:CC_losowanie4b
if "!p%acte%!"=="5" (set p%acte%b=0&set /a p%acte%+=1) else (set p%acte%b=5)
if "!p%actf%!"=="5" (set p%actf%b=0&set /a p%actf%+=1) else (set p%actf%b=5)
goto :EOF
:CC_losowanie4c
batch# /box 2 2 %__CC_LosMenu2%
batch# /sleep 2000
goto CC_punkty

:CC_losowanie5
if not "%para0%"=="" set /a p%pauza%+=1&>>"%location%%title%\%__CC_RoundName%%runda%.txt" echo.&>>"%location%%title%\%__CC_RoundName%%runda%.txt" echo %__CC_Pausing% %para0%
if "%print_on%"=="ON" call :CC_print "%__CC_RoundName%%runda%.txt" "%__CC_RoundName%%runda%.txt"
for /L %%i in (1,1,%stoly%) do (
	set rp%%i_1=[+#.#]
	set rp%%i_2=[+#.#]
	set rp%%i=0
)
for /F %%A in ("%para0%") do set /a p%%A+=1
set /a errorcount+=1
set Locked=0

:CC_punkty
cls
set check=
set str15=
if not %Locked% EQU 1 (set LockingTab="" %__CC_LosMenu3%) else (set LockingTab="" "-= Sesja zabezpieczona =-")
for /L %%i in (1,1,%stoly%) do set str15=!str15!"" "$$!rp%%i_1! !para%%i! !rp%%i_2!" 
if defined para0 set str15=!str15!"" "%__CC_Pausing% %para0%"
batch# /box 2 2 "%__CC_DrawName%" "%__CC_RoundName% %runda%:" %str15% %LockingTab%
set Input=%errorlevel%
if %Locked% EQU 1 call :CC_Unlock0 & goto CC_Punkty
set /a x=stoly+1
if "%Input%"=="%x%" goto CC_losowanie4
set /a x+=1
if "%Input%"=="%x%" if not "%runda%"=="1" (set check=T&goto CC_koniec1) else goto CC_punkty
set /a x+=1
if "%Input%"=="%x%" call :CC_Lock0&goto CC_punkty
set x=%Input%

:CC_punkty1
cls
batch# /box 2 2 "%__CC_DrawName%" "[%__CC_Pair% %__CC_Nr% %x%]" "!para%x%!" "" "$$%str1%" "" "$$%str2%" "" "$$%str3%"
if "%errorlevel%"=="1" set rp%x%_1=[+1.0]&set rp%x%_2=[+0.0]&set rp%x%=1
if "%errorlevel%"=="2" set rp%x%_1=[+0.0]&set rp%x%_2=[+1.0]&set rp%x%=1
if "%errorlevel%"=="3" set rp%x%_1=[+0.5]&set rp%x%_2=[+0.5]&set rp%x%=1
goto CC_punkty

:CC_Lock0
set chars1=
set chars2=
:CC_Lock
cls
echo %__CC_Protect1%
set /p "=> %chars2%"<nul
%FN% Kbd
if %errorlevel% LEQ 0 goto CC_Lock
if %errorlevel% EQU 8 if not "%chars1%"=="" set chars2=%chars2:~0,-1%&(set Last=&set chars3=&(for %%A in (%chars1%) do set chars3=!chars3!,!last!&set last=%%A)&set chars1=!chars3:~1!)&goto CC_Lock
if %errorlevel% EQU 27 goto CC_Lock0
if %errorlevel% EQU 13 if defined chars2 goto CC_Lock2
set Error=1
if %errorlevel% EQU 32 set Error=0
if %errorlevel% GTR 47 if %errorlevel% LSS 58 set Error=0
if %errorlevel% GTR 64 if %errorlevel% LSS 91 set Error=0
if %errorlevel% GTR 96 if %errorlevel% LSS 123 set Error=0
if %Error% EQU 1 goto CC_Lock
set chars1=%chars1%,%errorlevel%
set chars2=%chars2%*
goto CC_Lock
:CC_Lock2
cls
set Pass=%chars1:~1%
set Locked=1
set chars1=&set chars2=
echo %__CC_Protect6%^^!
echo.
pause
title %title% - Locked
goto CC_punkty

:CC_Unlock0
set chars1=
set chars2=
:CC_Unlock
cls
set passw=
echo ===================================
echo %__CC_Protect2%
echo %__CC_Protect3%
echo ===================================
set /p "=> %chars2%"<nul
%FN% Kbd
if %errorlevel% LEQ 0 goto CC_UnLock
if %errorlevel% EQU 8 if not "%chars1%"=="" set chars2=%chars2:~0,-1%&(set Last=&set chars3=&(for %%A in (%chars1%) do set chars3=!chars3!,!last!&set last=%%A)&set chars1=!chars3:~1!)&goto CC_UnLock
if %errorlevel% EQU 27 goto CC_Unlock0
if %errorlevel% EQU 13 if defined chars2 set UnPass=%chars1:~1%&(if "!Pass!"=="!UnPass!" (set Locked=0&cls&echo %__CC_Protect5%^^!&echo.&pause&title %title%&exit /b 0) else (cls&echo %__CC_Protect4%^^!^^!^^!&ping localhost -n 3 >nul&exit /b 1))
set Error=1
if %errorlevel% EQU 32 set Error=0
if %errorlevel% GTR 47 if %errorlevel% LSS 58 set Error=0
if %errorlevel% GTR 64 if %errorlevel% LSS 91 set Error=0
if %errorlevel% GTR 96 if %errorlevel% LSS 123 set Error=0
if %Error% EQU 1 goto CC_UnLock
set chars1=%chars1%,%errorlevel%
set chars2=%chars2%*
goto CC_UnLock

:CC_print
batch# /box 2 2 "Print Service" "%__CC_Print% %~2..."
print "%location%%title%\%~1">nul
goto :EOF


:CC_koniec1
cls
set /a runda-=1
if not "%bch_on%"=="ON" goto CC_koniec1a
set dot=.
set "bch=; Bch: "
set /a licz=rund %% 2
for /L %%i in (1,1,%osob%) do set /a bch%%i=0,bch%%ib=0
for /L %%i in (1,1,%osob%) do (
	for /L %%A in (1,1,%runda%) do (
		set act=!g%%ir%%A!
		set actb=%%i
		call :CC_bch
	)
)
for /L %%i in (1,1,%osob%) do (
	if "!pauza%%i!"=="1" (
		if not "!pauza%%ir!"=="1" (
			set /a bch%%i+=rund/2
			if "%licz%"=="1" (
				if "!bch%%ib!"=="5" (
					set /a bch%%i+=1,bch%%ib=0
				) else (
					set bch%%ib=5
				)
			)
		)
	)
)
goto CC_koniec1a

:CC_bch
if not defined act goto :EOF
set /a bch%actb%+=p%act%
if "!p%act%b!"=="5" (
	if "!bch%actb%b!"=="5" (
		set bch%actb%b=0&set /a bch%actb%+=1
	) else (
		set bch%actb%b=5
	)
)
goto :EOF

:CC_koniec1a
set /a licz=9,liczb=0,msc=1
:CC_koniec1b
for /L %%i in (1,1,%osob%) do (if "%licz%.%liczb%"=="!p%%i!.!p%%ib!" (set miejsce%%i=!msc!&set /a msc+=1))
if %msc% GTR %osob% goto CC_koniec1c
if "%licz%.%liczb%"=="0.0" goto CC_koniec1c
if "%liczb%"=="5" (set liczb=0) else (set /a licz-=1,liczb=5)
goto CC_koniec1b

:CC_koniec1c
set a=1
if not "%bch_on%"=="ON" goto CC_koniec1d
set act=
for /L %%x in (1,1,2) do (
for /L %%a in (1,1,%osob%) do (
	for /L %%A in (1,1,%osob%) do (
		if not "%%a"=="%%A" (
			if "!p%%a!.!p%%ab!"=="!p%%A!.!p%%Ab!" (
				if !bch%%a! GTR !bch%%A! (
					if !miejsce%%a! GTR !miejsce%%A! (
						set act=!miejsce%%a!
						set miejsce%%a=!miejsce%%A!
						set miejsce%%A=!act!
						set act=
					)
				) else (
					if !bch%%a! EQU !bch%%A! (
						if not "!bch%%ab!"=="!bch%%AB!" (
							if "!bch%%ab!"=="5" (
								if !miejsce%%a! GTR !miejsce%%A! (
									set act=!miejsce%%a!
									set miejsce%%a=!miejsce%%A!
									set miejsce%%A=!act!
									set act=
								)
							)
						)
					)
				)
			)
		)
	)
)
)
:CC_koniec1d
for /L %%i in (1,1,%osob%) do if "!a!"=="!miejsce%%i!" set stringk!a!=!a!. %str6% [%%i] !n%%i! (P: !p%%i!.!p%%ib!%bch%!bch%%i!%dot%!bch%%ib!)&set /a a+=1
if %a% GTR %osob% goto CC_koniec2
goto CC_koniec1d

:CC_koniec2
set str16=
for /L %%i in (1,1,%osob%) do set str16=!str16! "!stringk%%i!"
if defined check goto CC_koniec2b
>"%location%%title%\%__CC_EndFileName%.txt" (
echo %__CC_EndFileName% [%runda%. %__CC_RoundName%]:
echo.)
for /L %%i in (1,1,%osob%) do (echo !stringk%%i! >>"%location%%title%\%__CC_EndFileName%.txt")
if "%print_on%"=="ON" call :CC_print "%__CC_EndFileName%.txt" "%__CC_EndFileName%.txt"
:CC_koniec2b
cls
batch# /box 2 2 "%__CC_EndFileName%" "%__CC_EndFileName% (%runda%. %__CC_RoundName%)" "" !str16! "" "$$%__CC_CTC%"
if defined check set /a runda+=1&goto CC_punkty


:CC_koniec
cls
mode con cols=55 lines=15
batch# /box 2 2 "%str12%" "%str9%" "" "%str10%" "%str11%" "" "%str9%" "" %__CC_ByeText%
batch# /sleep 5000
endlocal
chcp 852>nul
exit /b 0


:CC_helpdesk
:CC_helpdesk-a4
batch# /box 2 2 "Dzia≥ pomocy" "Witaj w dziale pomocy^! Wybierz interesujπce CiÍ pytanie:" "" "$$             Co to za program??            " "" "$$            Jakie on ma funkcje?           " "" "$$      Czy potrzebny jest modu≥ Batch#?     " "" "$$       W jaki sposÛb dzia≥a program?       " "" "$$          MogÍ zobaczyÊ changelog?         " "" "$$  Czy program czyta imiona graczy z pliku? " "" "$$Mam pomys≥/sugestiÍ. Gdzie mogÍ to napisaÊ?" "" "$$              Kolejna strona -^>            " "" "$$WrÛÊ do menu"
goto CC_helpdesk-%errorlevel%
:CC_helpdesk-8
:CC_helpdesk-a
batch# /box 2 2 "Dzia≥ pomocy (str. 2)" "Witaj w dziale pomocy^! Wybierz interesujπce CiÍ pytanie:" "" "$$     Czy program bÍdzie aktualizowany?     " "" "$$  Jak mogÍ utworzyÊ skrÛt? [NiedostÍpne]   " "" "$$ Dlaczego max. liczba osÛb jest taka ma≥a? " "" "" "" "" "" "" "" "" "" "$$             ^<- Poprzednia strona          " "" "$$WrÛÊ do menu"
goto CC_helpdesk-a%errorlevel%
:CC_helpdesk-0
goto errorstdout
:CC_helpdesk-1
batch# /box 2 2 "Co to za program??" "Ty jeszcze o to pytasz? To CreepyChess cz≥owieku^!" "" "CreepyChess - program do losowaÒ szachowych i nie tylko." "Pozwala ustalaÊ typowania dla danej iloúci osÛb i rund -" "czyli dobiera osoby... zresztπ, od tego jest inny temat." "" "$$Kliknij, by do niego przejúÊ" "" "Nie nauczy CiÍ graÊ w szachy, moøe w warcaby :P" "Zosta≥ stworzony na potrzeby turniejÛw lokalnych," "ale przede wszystkim dla mojego instruktora szachowego," "ktÛremu taki program by≥by bardzo potrzebny" "" "Jest to program na licencji MIT do pobrania na GitHub:" "https://github.com/GrzegorzKi/CreepyChess" %str8%
if "%errorlevel%"=="1" goto CC_helpdesk-4
goto CC_helpdesk
:CC_helpdesk-2
batch# /box 2 2 "Jakie on ma funkcje?" "Ma on duøo funkcji :P Nic, tylko patrzeÊ" "" "Funkcje:" "" "- Dobieranie graczy na podstawie punktacji" "- Prosty system przydzielania punktÛw" "- MoøliwoúÊ drukowania list" "- Liczenie tzw. Buchholza" "- £atwa nawigacja za pomocπ przyciskÛw (modu≥ Batch#)" "- SkrÛty (/title, /osob, /rund, /bch, /print, /about)" "- Wiele wiÍcej..." "" "Funkcji jest bardzo wiele, a ich liczba ciπgle wzrasta.." "" "Moja rada: odkryj je wszystkie :D" "" %str8%
goto CC_helpdesk
:CC_helpdesk-3
batch# /box 2 2 "Czy potrzebny jest modu≥ Batch#" "Niestety, ale jest potrzebny." "" "DziÍki niemu mogÍ:" "" "- Dynamicznie zmieniaÊ rozmiar okna" "" "- U≥atwiÊ poruszanie siÍ po programie (przyciskowo)" "" "- RysowaÊ boxy" "" "" " Moøna by zrobiÊ program i bez tego modu≥u, ale po co?  " "Od tego one sπ, by je wykorzystywaÊ :P" "" "Generalnie, bez tego modu≥u program nie uruchomi≥by siÍ" "- jest od niego po prostu zaleøny" %str8%
goto CC_helpdesk
:CC_helpdesk-4
batch# /box 2 2 "W jaki sposÛb dzia≥π program?" "Dzia≥anie programu jest bardzo proste:" "" "-Losowanie-: Bierze pierwszπ z brzegu osobÍ" "Dobiera do niej osobÍ o takie samej lub podobnej liczbie" "punktÛw. Jeøeli juø gra≥ z danπ osobπ - dobiera innπ" "" "-Pauzy-: Gdy liczba osÛb jest nieparzysta, pauzy zostajπ" "w≥aczone. Osoba o najmniejszej liczbie punktÛw pauzuje." "Jeúli juø pauzowa≥a, bierze kolejnπ na podobnej zasadzie" "" "-Wyniki-: PorÛwnuje wyniki wszystkich osÛb na turnieju" "i przyznaje miejsca na podstawie punktÛw" "(oraz Buchholza - jeøeli w≥πczone)" "" "NastÍpnie wypisuje wyniki na ekranie - Proste? - Proste." "" %str8%
goto CC_helpdesk
:CC_helpdesk-5
if exist CreepyChangelog.txt (start CreepyChangelog.txt&set a="ProszÍ bardzo. Otworzy≥em Ci w nowym oknie ;)") else (set a="MÛg≥bym, ale nie widzÍ tu pliku CreepyChangelog.txt :(")
batch# /box 2 2 "MogÍ zobaczyÊ changelog?" %a% "" "       [=] SkrÛtowy podglπd na ostatnie zmiany [=]      " "" "CreepyChess v1.5.0" "+ Dodano dzia≥ pomocy (ten, ktÛry widzisz teraz)" "+ PrzywrÛcono skrÛty programu (m.in. /osob, /rund)" "" "CreepyChess v1.5.1" "+ Dodano kreator skrÛtÛw (umieszczony w dziale pomocy)" "* Dodano kolejne pytania do dzia≥u pomocy" "- Poprawki b≥ÍdÛw" "" "CreepyChess v1.5.2 FINAL" "* Poprawiono system Buchholza i przydzielanie miejsc" "+ Dodano moøliwoúÊ zablokowania programu has≥em" %str8%
goto CC_helpdesk
:CC_helpdesk-6
batch# /box 2 2 "Czy program czyta imiona graczy z pliku?" "Odpowiedü brzmi: Jak najbardziej^!" "" " Co wiÍcej, tworzenie takiego pliku jest bardzo proste: " "" "-= Tworzymy plik %lista_graczy% i wpisujemy tak: =-" "" "[Lista]" "gracz_1" "gracz_2" "gracz_3" "......." "gracz_n" "" "(zamiast gracz_# jakieú imiÍ)" "Za ma≥o imion = pyta o imiona pozosta≥ych osÛb" "Za duøo imion = bierze tylko tyle, ile potrzebuje" %str8%
goto CC_helpdesk
:CC_helpdesk-7
batch# /box 2 2 "Mam pomys≥/sugestiÍ. Gdzie mogÍ to zasugerowaÊ?" "Niegdyú powiedzia≥bym na forum" "Ale teraz mamy GitHuba - tam siÍ kieruj!" "" "https://github.com/GrzegorzKi/CreepyChess" "" "" "Kaødy pomys≥ jest mile widziany" "" "Mam nadziejÍ, øe z waszπ pomocπ uda mi siÍ" "  stworzyÊ program porÛwnywalny do ChessArbiter Pro :)  " "" "(i tak w batchu tego nie zrobiÍ... lol)" "" "" "" "" "" %str8%
goto CC_helpdesk
:CC_helpdesk-a1
batch# /box 2 2 "Czy program bÍdzie aktualizowany?" "Moøe i bÍdzie, wszystko w swoim czasie :P" "" "Wszystkie najnowsze aktualizacje pojawiπ siÍ" "  na forum/forach wypisanych w pierwszym temacie, czyli " "" "$$Tutaj^!" "" "Zawsze moøesz zapytaÊ, kiedy nowa wersja" "Ale odpowiedü bÍdzie brzmia≥a zawsze tak samo:" "" "- Dowiesz siÍ w swoim czasie :D -" "" "A na serio: nie wiem. Obecna wersja programu jest OK." "" "Ale nie martw siÍ - jak bÍdzie trzeba to zaktualizujÍ ;)" "" %str8%
if "%errorlevel%"=="1" goto CC_helpdesk-1
goto CC_helpdesk-a
:CC_helpdesk-a2
goto CC_helpdesk-a
:CC_helpdesk-a3
if %max_osob% LSS 50 (set a="Bo tak sobie ustawi≥eú :P - %max_osob% to rzeczywiúcie ma≥o") else (set a="%max_osob% osÛb - to dla Ciebie ma≥o?")
batch# /box 2 2 "Dlaczego maksymalna liczba osÛb jest taka ma≥a?" %a% "" "No skoro tak, to powiem ci, jak zmieniÊ:" "" "Jeøeli masz w folderze plik *settigns.ini*, otwÛrz go" "i zmieÒ wartoúÊ zmiennej *max_osob* na jakπ tam chcesz. " "" "Przyk≥ad:" "" "(ZawartoúÊ pliku settings.ini)" "max_osob=1000" "skip_intro=ON" "..." "" "--= Ale nie prÛbuj dopisywaÊ innych zmiennych^! =--" "(bo i tak ci to nie wyjdzie xd)" %str8%
goto CC_helpdesk-a
:CC_helpdesk-9
:CC_helpdesk-a5
goto CC_menu
:: Koniec program CreepyChess ::


:: Poczπtek programu BatchOfPi ::
:PI_BatchOfPi
mode con cols=81 lines=20
:PI_BatchOfPi1
cls
echo.
set NumQuads=
echo %__PI_NumQuads1%
set /p NumQuads=%__PI_NumQuads2%

set /a NumQuads=%NumQuads%+0
if %NumQuads% LSS 5 goto PI_BatchOfPi1
cls

setlocal EnableDelayedExpansion
echo.[0;40;32mpi.bat  -  By Don Cross  -  http://cosinekitty.com
set /a MaxQuadIndex = NumQuads - 1

echo.
echo.[0;1;40;32m%time% - started
echo.

call :PI_PiEngine 48 18 32 57 -20 239
call :PI_PiEngine 16 5 -4 239
pause
endlocal
goto :EOF

:PI_PiEngine
    call :PI_SetToInteger Pi 0
    set Formula=
    :PI_PiTermLoop
        if "%1" == "" (
            call :PI_Print pi
            echo.
            echo.[0;1;40;32m!time! - finished !Formula![0;1;40;37m
            echo.
            goto :EOF
        )
        call :PI_ArctanRecip PiTerm %2
        set /a PiEngineFactor=%1
        if !PiEngineFactor! lss 0 (
            set /a PiEngineFactor *= -1
            set Formula=!Formula!
            call :PI_MultiplyByInteger PiTerm !PiEngineFactor!
            call :PI_Subtract Pi PiTerm
            set Operator=-
        ) else (
            call :PI_MultiplyByInteger PiTerm %1
            call :PI_Add Pi PiTerm
            set Operator=+
        )
        if defined Formula (
            set Formula=!Formula! !Operator! !PiEngineFactor!*arctan^(1/%2^)
        ) else (
            set Formula=pi = %1*arctan^(1/%2^)
        )
        shift 
        shift
    goto PI_PiTermLoop
    
:PI_SetToInteger
    for /L %%i in (0, 1, !MaxQuadIndex!) do (
        set /a %1_%%i = 0
    )
    set /a %1_!MaxQuadIndex! = %2
    goto :EOF
    
:PI_Print
    set PrintBuffer=x
    REM  Omit a couple of least significant quads, because they will have roundoff errors.
    if defined PiDebug (
        set /a PrintMinQuadIndex=0
    ) else (
        set /a PrintMinQuadIndex=2
    )
    set /a PrintMaxQuadIndex = MaxQuadIndex - 1
    for /L %%i in (!PrintMinQuadIndex!, 1, !PrintMaxQuadIndex!) do (
        set PrintDigit=!%1_%%i!
        if !PrintDigit! lss 1000 (
            if !PrintDigit! lss 100 (
                if !PrintDigit! lss 10 (
                    set PrintDigit=000!PrintDigit!
                ) else (
                    set PrintDigit=00!PrintDigit!
                )
            ) else (
                set PrintDigit=0!PrintDigit!
            )
        )
        set PrintBuffer=!PrintDigit!!PrintBuffer!
    )
    set PrintBuffer=!%1_%MaxQuadIndex%!.!PrintBuffer:x=!
    echo.[0;1;40;31m%1 = [0;1;40;33m!PrintBuffer![0;1;40;37m
    goto :EOF
    
:PI_DivideByInteger
    if defined PiDebug echo.DivideByInteger %1 %2
    set /a DBI_Carry = 0
    for /L %%i in (!MaxQuadIndex!, -1, 0) do (
        set /a DBI_Digit = DBI_Carry*10000 + %1_%%i
        set /a DBI_Carry = DBI_Digit %% %2
        set /a %1_%%i = DBI_Digit / %2
    )
    goto :EOF
    
:PI_MultiplyByInteger
    if defined PiDebug echo.MultiplyByInteger %1 %2
    set /a MBI_Carry = 0
    for /L %%i in (0, 1, !MaxQuadIndex!) do (
        set /a MBI_Digit = %1_%%i * %2 + MBI_Carry
        set /a %1_%%i = MBI_Digit %% 10000
        set /a MBI_Carry = MBI_Digit / 10000
    )
    goto :EOF    
    
:PI_ArctanRecip
    if defined PiDebug echo.ArctanRecip %1 %2
    call :PI_SetToInteger %1 1
    call :PI_DivideByInteger %1 %2
    call :PI_CopyValue AR_Recip %1
    set /a AR_Toggle = -1    
    set /a AR_K = 3
    :PI_ArctanLoop
        if defined PiDebug (
            echo.
            echo.ArctanRecip  AR_K=!AR_K!    ---------------------------------------------------------
        )
        call :PI_DivideByInteger AR_Recip %2
        call :PI_DivideByInteger AR_Recip %2
        call :PI_CopyValue AR_Term AR_Recip
        call :PI_DivideByInteger AR_Term !AR_K!
        call :PI_CopyValue AR_PrevSum %1
        if !AR_Toggle! lss 0 (
            call :PI_Subtract %1 AR_Term
        ) else (
            call :PI_Add %1 AR_Term
        )
        call :PI_Compare AR_EqualFlag %1 AR_PrevSum
        if !AR_EqualFlag! == true goto :EOF
        set /a AR_K += 2
        set /a AR_Toggle *= -1
    goto PI_ArctanLoop
    
:PI_CopyValue
    if defined PiDebug echo.CopyValue %1 %2
    for /L %%i in (0, 1, !MaxQuadIndex!) do (
        set /a %1_%%i = %2_%%i
    )
    goto :EOF
    
:PI_Add 
    if defined PiDebug echo.Add %1 %2
    if defined PiDebug call :PI_Print %1
    if defined PiDebug call :PI_Print %2
    set /a Add_Carry = 0
    for /L %%i in (0, 1, !MaxQuadIndex!) do (
        set /a Add_Digit = Add_Carry + %1_%%i + %2_%%i
        set /a %1_%%i = Add_Digit %% 10000
        set /a Add_Carry = Add_Digit / 10000
    )
    goto :EOF    

:PI_Subtract 
    if defined PiDebug echo.Subtract %1 %2
    if defined PiDebug call :PI_Print %1
    if defined PiDebug call :PI_Print %2
    set /a Subtract_Borrow = 0
    for /L %%i in (0, 1, !MaxQuadIndex!) do (
        set /a Subtract_Digit = %1_%%i - %2_%%i - Subtract_Borrow
        if !Subtract_Digit! lss 0 (
            set /a Subtract_Digit += 10000
            set /a Subtract_Borrow = 1
        ) else (
            set /a Subtract_Borrow = 0
        )
        set /a %1_%%i = Subtract_Digit
    )
    goto :EOF    
    
:PI_Compare
    if defined PiDebug echo.Compare %1 %2 %3
    if defined PiDebug call :PI_Print %2
    if defined PiDebug call :PI_Print %3
    set /a Compare_Index = 0
    set %1=true
    :PI_CompareLoop
        if not !%2_%Compare_Index%! == !%3_%Compare_Index%! (
            if defined PiDebug echo.!%2_%Compare_Index%! neq !%3_%Compare_Index%!
            set %1=false
            goto :EOF
        )
        set /a Compare_Index += 1
        if !Compare_Index! gtr !MaxQuadIndex! (
            if defined PiDebug echo.Compare equal
            goto :EOF
        )
    goto PI_CompareLoop    
:: Koniec programu BatchOfPi ::


:: Poczπtek gry BatCraft ::
:XX_BatCraft
title BatCraft
if /i "%batcraft_loaded%"=="y" goto XX_BatCraftLoop
set x=0
set y=0
set i=1
set i1=0
set i2=0
set m=1
set Line-5=%__BatCraft1%
set Line-3=%__BatCraft2%
set Line-1=%__BatCraft3%
set Line1=%__BatCraft4%
set Line3=%__BatCraft5%
set batcraft_loaded=Y
:XX_BatCraftLoop
set /a bx=!x!-7&set /a ex=!x!+7&set /a by=!y!-5&set /a ey=!y!+5&set x!x!y!y!=@
cls
echo  BatCraft by Mac
echo …ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕª
for /l %%y in (!by!,1,!ey!) do (
	set l=
	for /l %%x in (!bx!,1,!ex!) do (
		if "!x%%xy%%y!"=="" set /a r=!random!*5/32768&if !r!==0 (set x%%xy%%y=*) else if !r!==1 (set x%%xy%%y=#) else set x%%xy%%y= 
		set l=!l!!x%%xy%%y!)
	echo ∫!l!∫ !Line%%y!)
echo »ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕº
if !m!==1 (echo Move) else if !m!==2 (echo Mine) else if !m!==3 echo Build
if !i!==1 (echo Stone * x!i1!) else if !i!==2 (echo Wood # x!i2!)

set x!x!y!y!= 
set t=0
set /p o=
if /i "!o!"=="w" (
	set vx=!x!&set /a vy=!y!-1&set t=1
) else if /i "!o!"=="s" (
	set vx=!x!&set /a vy=!y!+1&set t=1
) else if /i "!o!"=="a" (
	set /a vx=!x!-1&set vy=!y!&set t=1
) else if /i "!o!"=="d" (
	set /a vx=!x!+1&set vy=!y!&set t=1
) else if "!o!"=="1" (
	set m=1
) else if "!o!"=="2" (
	set m=2
) else if "!o!"=="3" (
	set m=3
) else if /i "!o!"=="e" (
	set /a i+=1&if !i! gtr 2 set i=1
) else if /i "!o!"=="q" exit /b
if !t!==1 (
	for /l %%y in (!vy!,1,!vy!) do for /l %%x in (!vx!,1,!vx!) do if !m!==1 (
		if "!x%%xy%%y!"==" " (
			set x=!vx!&set y=!vy!
		)
	) else if !m!==2 (
		if "!x%%xy%%y!"=="*" (
			set /a i1+=1&set x%%xy%%y= 
		) else if "!x%%xy%%y!"=="#" (
			set /a i2+=1&set x%%xy%%y= 
		)
	) else if !m!==3 (
		if "!x%%xy%%y!"==" " if !i!==1 (
			if not !i1!==0 (
				set /a i1-=1&set x%%xy%%y=*
			)
		) else if !i!==2 (
			if not !i2!==0 (
				set /a i2-=1&set x%%xy%%y=#
			)
		)
	)
)
goto XX_BatCraftLoop
:: Koniec gry BatCraft ::


:: Poczπtek programu AdminTools ::
:AT_Init
setlocal enabledelayedexpansion
set Program=AdminTools
%Macro_Loading:@=!%
title Administrative Tools
cd /d "%MDIR%"
if not exist %BX% call :BatBox
cls
mode con cols=80 lines=30
set ParameterStatus=-
:AT_Start
set Params=
%BX% /g 0 0
echo [0;1;40;37m[0;0H                           -= Administrative Tools =-                           [0;1;40;33mÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕ taskmgr ^| dxdiag ^| regedit ^| resmon ^| netplwiz ^| devmgmt.msc ^| netstat  ^| sfc  ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕ cls ^| cmd ^| help ^| systeminfo ^| netstat -a ^| ftp ^| chkdsk ^| Parameters%ParameterStatus% ^| EXIT ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕ[0;1;40;37m[28;0H
set X=&set Y=
for /f "tokens=1,2,3 delims=:" %%a in ('%BX% /m') do (
	set X=%%a
	set Y=%%b
)
set Result=
set NoParams=
if %Y% GTR 1 (if %Y% LSS 3 (
	if %X% LSS 10 (set result=start taskmgr&set NoParams=Y
	) else (if %X% LSS 19 (set result=start dxdiag @Params@
	) else (if %X% LSS 29 (set result=start regedit&set NoParams=Y
	) else (if %X% LSS 38 (set result=start resmon&set NoParams=Y
	) else (if %X% LSS 49 (set result=start netplwiz&set NoParams=Y
	) else (if %X% LSS 63 (set result=start devmgmt.msc&set NoParams=Y
	) else (if %X% LSS 74 (set result=netstat @Params@ ^| more
	) else (set result=sfc @Params@ ^| more
)))))))
) else (if %Y% GTR 3 (if %Y% LSS 5 (
	if %X% LSS 6 (set result=cls^&goto AT_Start&set NoParams=Y
	) else (if %X% LSS 12 (set result=call cmd @Params@
	) else (if %X% LSS 20 (set result=help @Params@ ^| more
	) else (if %X% LSS 32 (set result=systeminfo @Params@ ^| more
	) else (if %X% LSS 46 (set result=netstat -a -b ^| more&set NoParams=Y
	) else (if %X% LSS 51 (set result=ftp @Params@
	) else (if %X% LSS 60 (set result=chkdsk @Params@ ^| more
	) else (if %X% LSS 74 if "%ParameterStatus%"=="+" (set ParameterStatus=-) else (set ParameterStatus=+
	) else set result=endlocal^&exit /b 0
))))))))))
)

if not "%Result%"=="" (
if "%ParameterStatus%"=="+" (if not "%NoParams%"=="Y" set /p "Params=%__AT1%"&echo.)
%Result:@=!%
set /p "=Done^! Press any key to continue..."<nul
pause>nul
echo.
echo.
echo.
)
goto AT_Start
:: Koniec programu AdminTools ::


:: Poczπtek programu Baza Danych ::
:DB_Init
setlocal enabledelayedexpansion enableextensions
set Program=%__DB_Name%
set DBVersion=v0.5
title %Program% - %Version%
if not exist %BX% call :batbox
set "Logo=echo.&echo        ____                             __                            __  &echo       / __ ) ____ _ ____  ____ _   ____/ /____ _ ____   __  __ _____ / /_ &echo      / __  ^|/ __ `//_  / / __ `/  / __  // __ `// __ \ / / / // ___// __ \&echo     / /_/ // /_/ /  / /_/ /_/ /  / /_/ // /_/ // / / // /_/ // /__ / / / /&echo    /_____/ \__,_/  /___/\__,_/   \__,_/ \__,_//_/ /_/ \__, / \___//_/ /_/ &echo                                                      /____/&echo."
set "NoLogo=echo.&echo.&echo.&echo.&echo.&echo.&echo.&echo."

:DB_DBstart
cd /d "%MDIR%"
mode con cols=80 lines=30
:DB_Menu
cls
color 0C
2>nul %BX% /h 0 /o 3 1 /g 0 4 /d / /w 10 /g 1 3 /d / /g 1 4 /d "_" /w 10 /g 2 2 /d / /g 2 4 /d "_" /w 10 /g 3 1 /d / /g 3 3 /d / /g 3 4 /d "_" /w 10 /g 4 0 /d "_" /g 4 2 /d "_" /g 4 3 /d "_" /g 4 4 /d "_" /w 10 /g 5 0 /d "_" /g 5 1 /d "_" /g 5 2 /d "_" /g 5 3 /d / /g 5 4 /d "_" /w 10 /g 6 0 /d "_" /g 6 1 /d "_" /g 6 4 /d / /w 10 /g 7 0 /d "_" /g 7 3 /d / /w 10 /g 8 1 /d ")" /g 8 2 /d "|" /g 8 3 /d / /g 8 4 /d \ /w 10 /g 9 2 /d / /g 9 4 /d "_" /w 10 /g 10 1 /d "_" /g 10 3 /d / /g 10 4 /d "_" /w 10 /g 11 1 /d "_" /g 11 2 /d "_" /g 11 3 /d "_" /g 11 4 /d "," /w 10 /g 12 1 /d "_" /g 12 2 /d "_" /g 12 3 /d / /g 12 4 /d "_" /w 10 /g 13 1 /d "_" /g 13 4 /d / /w 10 /g 14 2 /d "`" /g 14 3 /d / /w 10 /g 15 1 /d "_" /g 15 2 /d / /w 10 /g 16 2 /d / /g 16 4 /d / /w 10 /g 17 1 /d "_" /g 17 2 /d "_" /g 17 3 /d / /g 17 4 /d "_" /w 10 /g 18 1 /d "_" /g 18 4 /d "_" /w 10 /g 19 1 /d "_" /g 19 3 /d / /g 19 4 /d "_" /w 10 /g 20 1 /d "_" /g 20 2 /d / /g 20 3 /d "_" /g 20 4 /d / /w 10 /g 21 3 /d / /g 21 4 /d \ /w 10 /g 22 2 /d / /g 22 4 /d "_" /w 10 /g 23 1 /d "_" /g 23 3 /d / /g 23 4 /d "_" /w 10 /g 24 1 /d "_" /g 24 2 /d "_" /g 24 3 /d "_" /g 24 4 /d "," /w 10 /g 25 1 /d "_" /g 25 2 /d "_" /g 25 3 /d / /g 25 4 /d "_" /w 10 /g 26 1 /d "_" /g 26 4 /d / /w 10 /g 27 2 /d "`" /g 27 3 /d / /w 10 /g 28 1 /d "_" /g 28 2 /d / /w 10 /w 10 /g 30 3 /d / /g 30 4 /d \ /w 10 /g 31 2 /d / /g 31 4 /d "_" /w 10 /g 32 1 /d "_" /g 32 3 /d / /g 32 4 /d "_" /w 10 /g 33 1 /d "_" /g 33 2 /d "_" /g 33 3 /d "_" /g 33 4 /d "," /w 10 /g 34 1 /d "_" /g 34 2 /d "_" /g 34 3 /d / /g 34 4 /d "_" /w 10 /g 35 1 /d "_" /g 35 4 /d / /w 10 /g 36 1 /d / /g 36 3 /d / /w 10 /g 37 0 /d "_" /g 37 2 /d / /g 37 3 /d / /g 37 4 /d \ /w 10 /g 38 0 /d "_" /g 38 1 /d / /g 38 2 /d / /g 38 4 /d "_" /w 10 /g 39 1 /d "_" /g 39 3 /d / /g 39 4 /d "_" /w 10 /g 40 1 /d "_" /g 40 2 /d "_" /g 40 3 /d "_" /g 40 4 /d "," /w 10 /g 41 1 /d "_" /g 41 2 /d "_" /g 41 3 /d / /g 41 4 /d "_" /w 10 /g 42 1 /d "_" /g 42 4 /d / /w 10 /g 43 2 /d "`" /g 43 3 /d / /g 43 4 /d / /w 10 /g 44 1 /d "_" /g 44 2 /d / /g 44 3 /d / /g 44 4 /d "_" /w 10 /g 45 2 /d / /g 45 4 /d / /w 10 /g 46 1 /d "_" /g 46 3 /d / /w 10 /g 47 1 /d "_" /g 47 2 /d "_" /g 47 4 /d / /w 10 /g 48 1 /d "_" /g 48 2 /d "_" /g 48 3 /d / /g 48 4 /d "_" /w 10 /g 49 1 /d "_" /g 49 4 /d / /w 10 /g 50 2 /d \ /g 50 3 /d / /g 50 5 /d / /w 10 /g 51 3 /d / /g 51 4 /d \ /g 51 5 /d "_" /w 10 /g 52 2 /d / /g 52 4 /d "_" /g 52 5 /d "_" /w 10 /g 53 1 /d "_" /g 53 3 /d / /g 53 4 /d "_" /g 53 5 /d "_" /w 10 /g 54 1 /d "_" /g 54 2 /d / /g 54 3 /d "_" /g 54 4 /d "," /g 54 5 /d "_" /w 10 /g 55 3 /d / /g 55 5 /d / /w 10 /g 56 2 /d / /g 56 4 /d / /w 10 /g 57 1 /d "_" /g 57 3 /d / /w 10 /g 58 1 /d "_" /g 58 2 /d / /g 58 3 /d / /g 58 4 /d \ /w 10 /g 59 2 /d / /g 59 4 /d "_" /w 10 /g 60 1 /d "_" /g 60 3 /d / /g 60 4 /d "_" /w 10 /g 61 1 /d "_" /g 61 2 /d "_" /g 61 3 /d "_" /g 61 4 /d "_" /w 10 /g 62 1 /d "_" /g 62 2 /d "_" /g 62 3 /d "_" /g 62 4 /d / /w 10 /g 63 1 /d "_" /g 63 2 /d "_" /g 63 4 /d / /w 10 /g 64 1 /d "_" /g 64 2 /d / /g 64 3 /d / /g 64 4 /d "_" /w 10 /g 65 2 /d / /g 65 4 /d / /w 10 /g 66 1 /d / /g 66 3 /d / /w 10 /g 67 0 /d "_" /g 67 2 /d "_" /g 67 4 /d / /w 10 /g 68 0 /d "_" /g 68 1 /d / /g 68 2 /d "_" /g 68 3 /d / /g 68 4 /d "_" /w 10 /g 69 1 /d "_" /g 69 4 /d / /w 10 /g 70 2 /d \ /g 70 3 /d / /g 0 5 /d "Wersja %Version%" /c 0x02 /g 56 6 /d "By CreepyNinja_" /g 0 7 /c 0x0F || (call :batbox Fix&goto DB_DBMenu)
%Fn% Cursor 0
echo.
echo                         …ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕª
echo                         ∫%__DB_Menu0%∫
echo                         ÃÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕπ
echo                         ∫ 1) %__DB_Menu1%∫
echo                         ∫ 2) %__DB_Menu2%∫
echo                         ∫ 3) %__DB_Menu3%∫
echo                         ∫ Q) %__DB_MenuQ%∫
echo                         »ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕº
echo.
:DB_MenuGet
%BX% /k
if %errorlevel%==49 goto DB_DBCreate
if %errorlevel%==50 goto DB_DBLoad
if %errorlevel%==51 goto DB_DBDelete
if %errorlevel%==113 exit /b 0
goto DB_MenuGet

:DB_DBCreate
cls
%Fn% Cursor 1
%Logo%
set DBName=
set /p "DBName=%__DB_Create1%" || goto DB_Menu
if /i exist "BazaDanych_Files\%DBName%" echo %__DB_Error1%^^!&pause>nul&goto DB_DBCreate
cls
%Logo%
set Limit=20
echo %__DB_Create2%
echo.
echo %__DB_Create3% (max. %Limit%).
echo %__DB_Create4%
:DB_DBCreate1
for /l %%a in (1,1,%Limit%) do (
	echo.
	set DBItem%%a=
	set /p "DBItem%%a=%__DB_Create5a% %%a. %__DB_Create5b%: 
	if "!DBItem%%a!"=="" set /a DBCount=%%a-1&goto DB_DBCreate2
)
set DBCount=%Limit%
:DB_DBCreate2
if !DBCount! LSS 2 echo %__DB_Error2%&goto DB_DBCreate1
cls
%Logo%
echo %__DB_Create6a%
echo.
echo *** %__DB_Create6b% %DBName% ***
echo.
echo *** %__DB_Create6c% ***
for /l %%a in (1,1,%DBCount%) do echo  - !DBItem%%a! -
echo.
set /p "=%__Prompt%(Y/N) "<nul
:DB_DBCreate2a
%BX% /k
if %errorlevel%==121 goto DB_DBCreate3
if %errorlevel%==110 goto DB_DBCreate
goto DB_DBCreate2a

:DB_DBCreate3
cls
chcp 1250>nul
if /i exist "%DBName%" echo.&echo %__DB_Error1%^^!&pause>nul&goto DB_DBCreate
md "BazaDanych_Files\%DBName%"
>"BazaDanych_Files\%DBName%\database.cfg" (
	echo Name=%DBName%
	for /l %%a in (1,1,%DBCount%) do echo Item%%a=!DBItem%%a!
	for /l %%a in (1,1,%DBCount%) do echo Item%%aLength=20
	echo ItemCount=%DBCount%
	echo Color1=07
	echo Color2=0C
	echo Color3=0F
)
chcp 852>nul
%Logo%
echo %__DB_Create7%
echo.
set /p "=%__PressToContinue%"<nul
pause>nul
goto DB_Menu

:DB_DBDelete
cls
mode con cols=80 lines=30
%Fn% Cursor 1
%Logo%
echo %__DB_Menu1_2%
echo.
cd /d "BazaDanych_Files" 2>nul
set Names=
set /a a=0,d=0
for /R %%a in (database.cfg) do set b=&set c=&if defined a (set a=) else (if exist "%%a" (cd "%%~dpa"&for /f "tokens=1* delims==" %%A in (database.cfg) do (if "%%A"=="Name" set "b=%%~B"&set "c=%%~ta"&set /a d+=1&set "Names=!Names!"%%~B","))&if defined b echo * !b! ^(%__DB_Menu2_2% !c!^))
cd "%MDIR%"
if %D% EQU 0 echo - %__DB_Menu4_2% -
echo.
set cho=
set /p cho=%__Prompt%|| goto DB_Menu
for %%# in (%Names%) do if /i "%cho%"=="%%~#" pushd "BazaDanych_Files\%%~#" 2>nul || (echo.&echo %__DB_Error3%^^!&pause>nul&goto DB_DBDelete)&set Name=%%~#&goto DB_DBDelete1
goto DB_DBDelete
:DB_DBDelete1
echo.
set /p "=%__DB_AUS% (Y/N) "<nul
:DB_DBDelete1a
%BX% /k
if %errorlevel%==121 goto DB_DBDelete1b
if %errorlevel%==110 popd&goto DB_DBDelete
goto DB_DBDelete1a
:DB_DBDelete1b
cd ..
rmdir /S /Q "%Name%" >nul 2>&1
popd
echo.
set /p "=%__DB_Menu5_2%"<nul
pause>nul
goto DB_DBDelete


:::::::::::::::::::::::::::::::
:: G≥Ûwna sekcja bazy danych ::
:DB_DBLoad
cls
mode con cols=80 lines=30
%Fn% Cursor 1
%Logo%
echo %__DB_Menu3_2%
echo.
cd /d "BazaDanych_Files" 2>nul
set Names=
set /a a=0,d=0
for /R %%a in (database.cfg) do set b=&set c=&if defined a (set a=) else (if exist "%%a" (cd "%%~dpa"&for /f "tokens=1* delims==" %%A in (database.cfg) do (if "%%A"=="Name" set "b=%%~B"&set "c=%%~ta"&set /a d+=1&set "Names=!Names!"%%~B","))&if defined b echo * !b! ^(%__DB_Menu2_2% !c!^))
cd "%MDIR%"
if %D% EQU 0 echo - %__DB_Menu4_2% -
echo.
set cho=
set /p cho=%__Prompt%|| goto DB_Menu
for %%# in (%Names%) do if /i "%cho%"=="%%~#" pushd "BazaDanych_Files\%%~#" 2>nul || (echo.&echo %__DB_Error3%^^!&pause>nul&goto DB_DBDelete)&set Name=%%~#&goto DB_Start
goto DB_DBLoad

:DB_Reload
endlocal&if "%Warp%"=="Delete" (set min=%min%&set max=%max%&set prevp=%prevp%&set nextp=%nextp%&set Warp=%Warp%) else (set Warp=)
:DB_Start
if not exist "%MDIR%\Core\%BX%" call :Batbox&goto DB_Start
setlocal
chcp 1250>nul
set Color1=07
set Color2=0C
set Color3=0F
if exist database.cfg (for /f "tokens=*" %%# in (database.cfg) do set %%#) else (echo.&echo %__DB_Error3%^^!&pause>nul&chcp 852>nul&popd&goto DB_DBLoad)
title %Program% - %Name% - %Version%
call :DB_RecalcSize
set a=0
if exist data.cfg for /f "tokens=* delims=," %%X in (data.cfg) do (
 set /a a+=1
 set b=0
 for %%a in (%%X) do (
  set /a b+=1
  set Entity!a!Item!b!=%%~a
 )
)
set EntityCount=%a%
if not defined Entity1Item1 set Entity1Item1=Item 1&set EntityCount=1
chcp 852>nul
set "A=ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕ"
set "B=                                                  "
set FormAct=1
set s_on=
set SortedIn=
if "%Warp%"=="Delete" set Warp=&goto DB_Window

:DB_Recalc
set min=1
set max=!%s_on%EntityCount!
if %max% GTR 10 (set max=10&set nextp=1) else (set nextp=0)
set prevp=0


:DB_Window
set BGColor=%Color1:~0,1%F
%BX% /c 0x%Color1%
cls
chcp 852>nul
set /a len=(!%s_on%EntityCount!-%min%)*2+3
if %len% GTR 21 set len=21
if not "!%s_on%SortedIn!"=="" (set g_on=S_) else (set g_on=)
if "%Color3:~0,1%"=="0" (set AlterColor=%Color1:~0,1%%Color3:~1,1%) else set AlterColor=%Color3%
if "%Color2:~0,1%"=="0" (set AlterColor2=%Color1:~0,1%%Color2:~1,1%) else set AlterColor2=%Color2%
echo.
echo.
set line1=
for /l %%a in (1,1,%ItemCount%) do (
	set c=!Item%%aLength!
	for %%A in (!c!) do (
		set line1=!line1!!A:~0,%%A!À
	)
	if "!Item%%a!"=="" set Item%%a=ItemName %%a
)
set "line1=…%line1:~0,-1%ª"
echo  %line1%
set Line1=
for /l %%a in (1,1,%ItemCount%) do (
	set c=!Item%%aLength!
	for %%A in (!c!) do (
		set d= !Item%%a!!B:~0,%%A!
		set line1=!line1!!d:~0,%%A!∫
	)
)
set "line1=∫%line1:~0,-1%∫"
echo  %line1%
set Line1=
for /l %%a in (1,1,%ItemCount%) do (
	set c=!Item%%aLength!
	for %%A in (!c!) do (
		set line1=!line1!!A:~0,%%A!Œ
	)
)
set "line1=Ã%line1:~0,-1%π"
echo  %line1%
set Line1=
for /l %%a in (1,1,%ItemCount%) do (
	set c=!Item%%aLength!
	for %%A in (!c!) do (
		set line1=!line1!!B:~0,%%A!∫
	)
)
set "line1=∫%line1:~0,-1%∫"
for /l %%a in (1,1,%len%) do (echo  %Line1%)
set Line1=
for /l %%a in (1,1,%ItemCount%) do (
	set c=!Item%%aLength!
	for %%A in (!c!) do (
		set line1=!line1!!A:~0,%%A! 
	)
)
set "line1=»%line1:~0,-1%º"
echo  %Line1%
if "%s_on%"=="F_" echo   - %__DB_Search1% -

if not "%AlterColor2:~0,1%"=="%AlterColor2:~1,1%" (
if [%prevp%]==[1] (set "k1=1) Prev") else set "k1=   -   "
if [%nextp%]==[1] (set "k2=2) Next") else set "k2=   -   "

if "%s_on%"=="F_" (set c=26) else (set c=28)
%BX% /h 0 /g 0 !c! /c 0x%AlterColor2%
if "%s_on%"=="F_" (
	echo  …%A:~0,41%ª 
	echo  ∫%__DB_Search2%∫ 
)
echo …%A:~0,43%ª
echo ∫ R - Ref.   F - Find  S - Sort   O - Opcje ∫
echo ∫ Q - Quit   !k1!   !k2!    H - Help^^! ∫
set /p "=»%A:~0,43%º"<nul
)
chcp 1250>nul
set e=3
set com=/c 0x%AlterColor% /o %e% 6 /g 0 0
for /l %%# in (1,1,%ItemCount%) do (
	set d=0
	set /a f=!Item%%#Length!-1
	for /l %%a in (%min%,1,%max%) do (
		set "c=* N/A *"
		if not "!%g_on%%s_on%Entity%%aItem1!"=="" for %%A in (!f!) do (
			if not "!%g_on%%s_on%Entity%%aItem%%#!"=="" set c=!%g_on%%s_on%Entity%%aItem%%#:~0,%%A!
			set /a d+=2
			set com=!com! /d "!c:~0,%%A!" /g 0 !d!
		)
	)
	if not %%# EQU %ItemCount% (
		set /a e+=!Item%%#Length!+1
		set com=!com! /o !e! 6 /g 0 0
	)
)
%BX% %com%

:DB_KeyStroke
%BX% /h 0 /g 0 0 /c 0x%BGColor% /d " %min%-%max% /!%s_on%EntityCount!\\"
if defined Warp goto DB_%Warp%
:DB_KeyStroke-a
%BX% /k
set cho=%errorlevel%
if %cho%==49 goto DB_PrevP
if %cho%==327 goto DB_PrevP
if %cho%==50 goto DB_NextP
if %cho%==335 goto DB_NextP
if %cho%==113 endlocal&chcp 852>nul&popd&goto DB_DBStart
if %cho%==114 goto DB_Reload
if %cho%==115 goto DB_Sort
if %cho%==103 goto DB_Goto
if %cho%==27 if [%s_on%]==[F_] set s_on=&goto DB_Recalc
if %cho%==102 (if not [%s_on%]==[F_] (goto DB_Search) else (set s_on=&goto DB_Recalc))
if %cho%==111 goto DB_Options
if %cho%==97 if not [%s_on%]==[F_] goto DB_Add
if %cho%==101 if not [%s_on%]==[F_] goto DB_Edit
if %cho%==100 if not [%s_on%]==[F_] goto DB_Delete
if %cho%==9 goto DB_FormWindow
if %cho%==104 cls&echo.&(for %%a in (%__DB_Help%) do echo.%%~a)&pause>nul&goto DB_Window
goto DB_keystroke-a

:DB_PrevP
if [%prevp%]==[1] (set /a min-=10, max-=%max% %% 10&(if !max!==%max% set /a max-=10)&(if !max! LEQ 10 (set prevp=0) else (set prevp=1))&set nextp=1&goto DB_Window)
goto DB_KeyStroke-a
:DB_NextP
if [%nextp%]==[1] (set /a min+=10, max+=10&(if !max! GEQ !%s_on%EntityCount! (set max=!%s_on%EntityCount!&set nextp=0) else (set nextp=1))&set prevp=1&goto DB_Window)
goto DB_KeyStroke-a

:DB_SaveData
>data.cfg (for /l %%X in (1,1,%EntityCount%) do (
	set txta%%X=
	if defined Entity%%XItem1 (
		for /l %%a in (1,1,!ItemCount!) do (
			if not "!Item%%a!"=="" set txta%%X=!txta%%X!"!Entity%%XItem%%a!",
		)
		echo !txta%%X:~0,-1!
	)
))
copy database.cfg /B+ ,,/Y >nul
goto :EOF
:DB_SaveDataBase
set c=0
>database.cfg (
	echo Name=%Name%
	for /l %%# in (1,1,%ItemCount%) do (if not "!Item%%#!"=="" set /a c+=1&echo Item!c!=!Item%%#!)
	set c=0
	for /l %%# in (1,1,%ItemCount%) do (if not "!Item%%#!"=="" set /a c+=1&echo Item!c!Length=!Item%%#Length!)
	echo ItemCount=!c!
	echo Color1=%Color1%
	echo Color2=%Color2%
	echo Color3=%Color3%
)
copy data.cfg /B+ ,,/Y >nul
goto :EOF

:DB_Add
if not defined Warp (set /a EntityCount+=1&set max=!EntityCount!&set /a c=!max! %% 10&(if !c! EQU 0 (set /a min=!max!-10+1) else (set /a min=!max!-!c!+1))&set Nextp=0&(if !max! LEQ 10 (set prevp=0) else set prevp=1)&set Warp=Add&goto DB_Window)
set Warp=
set /a c=%len%+3
%BX% /g 0 1 /d "  -%__DB_Add%-" /g 3 %C% /c 0x%AlterColor% /h 1
set Nazwa=""
set /p Nazwa=
set Nazwa=%Nazwa:"=%
if not defined Nazwa %BX% /h 0 /c 0x0F&set /a EntityCount-=1&call :DB_RecalcAlt&goto DB_Window
set Entity%EntityCount%Item1=%Nazwa%
if defined g_on set S_Entity%EntityCount%Item1=%Nazwa%
call :DB_SaveData
goto DB_Window

:DB_Edit
%BX% /g 0 1 /d "  -%__DB_Edit%-" /h 1
set x=3
set y=6
set c=%min%
set d=1
set /a e=2+%Item1Length%
set f=1
:DB_Edit-1
if [%c%]==[%min%] (set e-up=0) else (set e-up=1)
if [%c%]==[%max%] (set e-down=0) else (set e-down=1)
if [%d%]==[1] (set e-prev=0) else (set e-prev=1)
if [%d%]==[%ItemCount%] (set e-next=0) else (set e-next=1)
%BX% /g %e% %y% /g %x% %y% /k
set cho=%errorlevel%
if %cho%==335 (if [%e-down%]==[1] (set /a y+=2&set /a c+=1) else (set c=%min%&set /a y=6))
if %cho%==327 (if [%e-up%]==[1] (set /a y-=2&set /a c-=1) else (set c=%max%&set /a "y=6+(max-min)*2"))
if %cho%==332 (if [%e-next%]==[1] (set /a x+=!Item%d%Length!+1&set /a d+=1) else (set x=3&set d=1))
if %cho%==332 (if [%e-next%]==[1] set /a e=!x!+!Item%d%Length!-1)
if %cho%==330 (if [%e-prev%]==[1] (set /a d-=1) else (set d=%ItemCount%&set /a x=%Cols%-!Item%ItemCount%Length!-1&set /a e=!x!+!Item%ItemCount%Length!-1))
if %cho%==330 (if [%e-prev%]==[1] set /a x-=!Item%d%Length!+1&set /a e=!x!+!Item%d%Length!-1)
if %cho%==13 goto DB_Edit-2
if %cho%==101 goto DB_Edit-0
if %cho%==27 goto DB_Edit-0
goto DB_Edit-1
:DB_Edit-2
set /a g=!Item%d%Length!-1
if not "!Entity%c%Item%d%!"=="" (set f=!Entity%c%Item%d%:~0,%e%!) else set f=* N/A *
%BX% /g %e% %y% /g %x% %y% /c 0x%Color1% /d "!B:~0,%g%!" /g %x% %y% /c 0x%AlterColor%
set Nazwa=""
set /p Nazwa=
set Nazwa=%Nazwa:"=%
if not defined Nazwa %BX% /g %x% %y% /c 0x%BGColor% /d "!B:~0,%g%!" /g %x% %y% /c 0x%AlterColor% /d "%F%"&goto DB_Edit-0
if "%g_on%"=="S_" set c=!Pla%c%!
set Entity%c%Item%d%=%Nazwa%
call :DB_SaveData
%BX% /g %x% %y% /c 0x%BGColor% /d "!B:~0,%g%!" /g %x% %y% /c 0x%AlterColor% /d "%Nazwa%"
goto DB_Edit-0
:DB_Edit-0
%BX% /g 0 1 /c 0x%BGColor% /d "               "
goto DB_KeyStroke

:DB_Delete
%BX% /g 0 1 /d "  -%__DB_Delete%-" /h 1
set y=6
set c=%min%
:DB_Delete-1
if [%c%]==[%min%] (set e-up=0) else (set e-up=1)
if [%c%]==[%max%] (set e-down=0) else (set e-down=1)
%BX% /g 3 %y% /k
set cho=%errorlevel%
if %cho%==335 (if [%e-down%]==[1] (set /a y+=2&set /a c+=1) else (set c=%min%&set /a y=6))
if %cho%==327 (if [%e-up%]==[1] (set /a y-=2&set /a c-=1) else (set c=%max%&set /a "y=6+(max-min)*2"))
if %cho%==13 if not "%EntityCount%"=="1" goto DB_Delete-2
if %cho%==100 goto DB_Delete-0
if %cho%==27 goto DB_Delete-0
goto DB_Delete-1
:DB_Delete-2
set /a d=%len%+6
%BX% /g 0 %d% /d "   %__DB_AUS% (Y/N) "
:DB_Delete-3
%BX% /k
set cho=%errorlevel%
if %cho%==121 goto DB_Delete-4
if %cho%==110 %BX% /g 3 %d% /d "                     "&goto DB_Delete-0
goto DB_Delete-3
:DB_Delete-4
if "%g_on%"=="S_" set c=!Pla%c%!
set Entity%c%Item1=
call :DB_SaveData
set /a EntityCount-=1
call :DB_RecalcAlt
set Warp=Delete
goto DB_Reload
:DB_Delete-0
%BX% /g 0 1 /c 0x%BGColor% /d "                "
goto DB_KeyStroke

:DB_Sort
cls
if %Cols% LSS 75 (%NoLogo%) else %Logo%
echo %__DB_Sort1%
echo.
for /l %%# in (1,1,%ItemCount%) do echo  %%#^) !Item%%#!
set /a c=ItemCount+1
echo  %c%^) %__DB_Sort2%
echo.
%BX% /h 1
set cho=
set /p cho=%__DB_Prompt%
if not defined cho goto DB_Window
for /l %%# in (1,1,%ItemCount%) do if "%cho%"=="%%#" set S_ItemName=!Item%%#!&set S_Item=%%#&goto DB_Sort-1
if "%cho%"=="%c%" set %s_on%SortedIn=&set %s_on%SortItem=0&goto DB_Window
goto DB_Sort
:DB_Sort-1
set c=0
for /l %%a in (1,1,%EntityCount%) do set SortGot%%a=&set Pl%%a=&set Pla%%a=
if "!%s_on%SortItem!"=="%S_Item%" (if "!%s_on%Sorting!"=="%__DB_Alphabet1%" (set %s_on%Sorting=%__DB_Alphabet2%) else set %s_on%Sorting=%__DB_Alphabet1%) else (set %s_on%Sorting=%__DB_Alphabet1%)

for %%A in (!%s_on%Sorting!) do (
	for /l %%a in (1,1,%EntityCount%) do (
		if /i "!%s_on%Entity%%aItem%S_Item%:~0,1!"=="%%A" set /a c+=1&set Pl%%a=!c!&set Pla!c!=%%a&set SortGot%%a=1
	)
)
for /l %%a in (1,1,!EntityCount!) do (
	if not [!SortGot%%a!]==[1] set /a c+=1&set Pl%%a=!c!&set Pla!c!=%%a
	for /l %%A in (1,1,%ItemCount%) do for %%# in (!Pl%%a!) do set S_%s_on%Entity%%#Item%%A=!%s_on%Entity%%aItem%%A!
)
set %s_on%SortItem=%S_Item%
set %s_on%SortedIn=Y
goto DB_Window

:DB_Search
cls
if %Cols% LSS 75 (%NoLogo%) else %Logo%
echo %__DB_Search3%:
echo.
for /l %%# in (1,1,%ItemCount%) do echo  %%#^) !Item%%#!
echo.
%BX% /h 1
set cho=
set /p cho=%__DB_Prompt%
if not defined cho goto DB_Window
for /l %%# in (1,1,%ItemCount%) do if "%cho%"=="%%#" set F_ItemName=!Item%%#!&set F_Item=%%#&goto DB_Search-1
goto DB_Search
:DB_Search-1
cls
if %Cols% LSS 75 (%NoLogo%) else %Logo%
echo !B:~0,%Length%!%__DB_Search3% %F_ItemName%:
chcp 852>nul
echo !B:~0,%Length%!…%A:~0,38%ª
echo !B:~0,%Length%!∫%B:~0,38%∫
echo !B:~0,%Length%!∫%B:~0,38%∫
echo !B:~0,%Length%!∫%B:~0,38%∫
echo !B:~0,%Length%!»%A:~0,38%º
chcp 1250>nul
%BX% /o 2 0 /g %Length% 11
set Nazwa=""
set /p Nazwa=
set Nazwa=%Nazwa:"=%
if not defined Nazwa goto DB_Window
set c=0
for /l %%a in (1,1,!EntityCount!) do (
	for /l %%# in (1,1,!ItemCount!) do set F_Entity%%aItem%%#=
	set Search=!Entity%%aItem%F_Item%!
	if not "!Search!"=="" if /i not "!Search:%Nazwa%=!"=="!Search!" (
		set /a c+=1
		for /l %%# in (1,1,!ItemCount!) do set F_Entity!c!Item%%#=!Entity%%aItem%%#!
	)
)
set F_EntityCount=%c%
if %c%==0 set F_Entity1Item1=%__DB_Search4%&set F_EntityCount=1
set s_on=F_
set F_SortItem=0
set F_SortedIn=
goto DB_Recalc

:DB_Goto
set /a str=(!%s_on%EntityCount!-1)/10 +1
if %str% EQU 1 goto DB_KeyStroke-a
cls
if %Cols% LSS 75 (%NoLogo%) else %Logo%
chcp 852>nul
echo !B:~0,%Length%!…%A:~0,38%ª
echo !B:~0,%Length%!∫%B:~0,38%∫
echo !B:~0,%Length%!∫%B:~0,38%∫
echo !B:~0,%Length%!∫%B:~0,38%∫
echo !B:~0,%Length%!»%A:~0,38%º
chcp 1250>nul
%BX% /o 3 0 /g %Length% 10 /d "%__DB_Goto% (1-%str%): " /h 1
set cho=
set /p cho=
if not defined cho goto DB_Window
for /f "delims=0123456789" %%A in ("%cho:"=%") do if not "%%A"=="" goto DB_Goto
if not %cho% LSS 1 if not %cho% GTR %str% (
	set /a min=^(%cho%-1^)*10+1
	set /a max=%cho%*10
	if !max! GEQ !%s_on%EntityCount! (set max=!%s_on%EntityCount!&set nextp=0) else set nextp=1
	if !min! EQU 1 (set prevp=0) else set prevp=1
	goto DB_Window
)
goto DB_Goto

:DB_Options
cls
if %Cols% LSS 75 (%NoLogo%) else %Logo%
chcp 852>nul
echo !B:~0,%Length%!…%A:~0,38%ª
echo !B:~0,%Length%!∫%__DB_Menu0_3%∫
echo !B:~0,%Length%!Ã%A:~0,38%π
echo !B:~0,%Length%!∫ 1) %__DB_Menu1_3%∫
echo !B:~0,%Length%!∫ 2) %__DB_Menu2_3%∫
echo !B:~0,%Length%!∫ 3) %__DB_Menu3_3%∫
echo !B:~0,%Length%!∫ Q) %__DB_MenuQ_3%∫
echo !B:~0,%Length%!»%A:~0,38%º
chcp 1250>nul
:DB_Options-0
%BX% /k
set cho=%errorlevel%
if %cho%==49 goto DB_Options-1
if %cho%==50 goto DB_Options-0a
if %cho%==51 goto DB_Options-4
if %cho%==113 goto DB_Window
goto DB_Options-0
:DB_Options-0a
cls
if %Cols% LSS 75 (%NoLogo%) else %Logo%
chcp 852>nul
echo !B:~0,%Length%!…%A:~0,38%ª
echo !B:~0,%Length%!∫%__DB_Menu0_4%∫
echo !B:~0,%Length%!Ã%A:~0,38%π
echo !B:~0,%Length%!∫ 1) %__DB_Menu1_4%∫
echo !B:~0,%Length%!∫ 2) %__DB_Menu2_4%∫
echo !B:~0,%Length%!∫ 3) %__DB_Menu3_4%∫
echo !B:~0,%Length%!∫ 4) %__DB_Menu4_4%∫
echo !B:~0,%Length%!∫ Q) %__DB_MenuQ_4%∫
echo !B:~0,%Length%!»%A:~0,38%º
chcp 1250>nul
:DB_Options-0b
%BX% /k
set cho=%errorlevel%
if %cho%==49 goto DB_Options-5
if %cho%==50 goto DB_Options-6
if %cho%==51 goto DB_Options-2
if %cho%==52 goto DB_Options-3
if %cho%==113 goto DB_Options
goto DB_Options-0b
:DB_Options-1
cls
if %Cols% LSS 75 (%NoLogo%) else %Logo%
chcp 852>nul
echo !B:~0,%Length%!…%A:~0,38%ª
echo !B:~0,%Length%!∫%B:~0,38%∫
echo !B:~0,%Length%!∫%B:~0,38%∫
echo !B:~0,%Length%!∫%B:~0,38%∫
echo !B:~0,%Length%!»%A:~0,38%º
chcp 1250>nul
%BX% /o 3 0 /g %Length% 10 /d "%__DB_Options1%" /h 1
set Nazwa=""
set /p Nazwa=
set Nazwa=%Nazwa:"=%
if not defined Nazwa goto DB_Window
set OldName=%Name%
set Name=%nazwa%
cd ..
ren "%OldName%" "%Name%" || (set Name=%OldName%&cd "!Name!"&goto DB_Options-1)
cd "%Name%"
call :DB_SaveDataBase
title Baza danych - %Name% - %Version%
goto DB_Window
:DB_Options-2
if not defined Warp set Warp=Options-2&goto DB_Window
set Warp=
%BX% /g 0 1 /d "  -%__DB_Options2%-" /h 1
set x=3
set c=1
set /a e=2+%Item1Length%
:DB_Options-2a
if [%c%]==[1] (set e-prev=0) else (set e-prev=1)
if [%c%]==[%ItemCount%] (set e-next=0) else (set e-next=1)
%BX% /g %e% 3 /g %x% 3 /k
set cho=%errorlevel%
if %cho%==332 (if [%e-next%]==[1] (set /a x+=!Item%c%Length!+1&set /a c+=1) else (set x=3&set c=1))
if %cho%==332 (if [%e-next%]==[1] set /a e=!x!+!Item%c%Length!-1)
if %cho%==330 (if [%e-prev%]==[1] (set /a c-=1) else (set c=%ItemCount%&set /a x=%Cols%-!Item%ItemCount%Length!-1&set /a e=!x!+!Item%ItemCount%Length!-1))
if %cho%==330 (if [%e-prev%]==[1] set /a x-=!Item%c%Length!+1&set /a e=!x!+!Item%c%Length!-1)
if %cho%==13 if "%d%"=="1" (goto DB_Options-2c) else (if "%d%"=="2" (goto DB_Options-6a) else goto DB_Options-2b)
if %cho%==111 goto DB_Options-2x
if %cho%==27 goto DB_Options-2x
goto DB_Options-2a
:DB_Options-2b
set /a g=!Item%c%Length!-1
%BX% /g %e% 3 /g %x% 3 /c 0x%Color1% /d "!B:~0,%g%!" /g %x% 3
set Nazwa=""
set /p Nazwa=
set Nazwa=%Nazwa:"=%
if not defined Nazwa %BX% /g %x% 3 /c 0x%Color1% /d "!Item%c%:~0,%g%!"&goto DB_Options-2x
set Item%c%=%Nazwa%
call :DB_SaveDataBase
%BX% /g %x% 3 /c 0x%Color1% /d "!B:~0,%g%!" /g %x% 3 /d "!Item%c%:~0,%g%!"
goto DB_Options-2x
:DB_Options-2c
set /a g=!Item%c%Length!-1
%BX% /g %e% 3 /g %x% 3 /c 0x%Color1% /d "!B:~0,%g%!" /g %x% 3 /d "(9-50)> "
set cho=""
set /p cho=
set cho=%cho:"=%
if not defined cho %BX% /g %x% 3 /d "!B:~0,%g%!" /g %x% 3 /d "!Item%c%:~0,%g%!"&goto DB_Options-2x
for /f "delims=0123456789" %%A in ("%cho%") do if not "%%A"=="" goto DB_Options-2c
if %cho% LSS 9 goto DB_Options-2c
if %cho% GTR 50 goto DB_Options-2c
set Item%c%Length=%cho%
call :DB_SaveDataBase
call :DB_RecalcSize
goto DB_Window
:DB_Options-2x
%BX% /g 0 1 /c 0x%BGColor% /d "                          "
goto DB_KeyStroke
:DB_Options-3
if not defined Warp set Warp=Options-3&goto DB_Window
set Warp=
%BX% /g 0 1 /d "  -%__DB_Options3%-" /h 1
set x=3
set c=1
set d=1
set /a e=2+%Item1Length%
goto DB_Options-2a
:DB_Options-4
cls
if %Cols% LSS 75 (%NoLogo%) else %Logo%
chcp 852>nul
echo !B:~0,%Length%!…%A:~0,38%ª
echo !B:~0,%Length%!∫%__DB_Menu0_5%∫
echo !B:~0,%Length%!Ã%A:~0,38%π
echo !B:~0,%Length%!∫ 1) %__DB_Menu1_5%∫
echo !B:~0,%Length%!∫ 2) %__DB_Menu2_5%∫
echo !B:~0,%Length%!∫ 3) %__DB_Menu3_5%∫
echo !B:~0,%Length%!∫ Q) %__DB_MenuQ_5%∫
echo !B:~0,%Length%!»%A:~0,38%º
chcp 1250>nul
:DB_Options-4a
set c=
%BX% /k
set cho=%errorlevel%
if %cho%==49 set c=1
if %cho%==50 set c=2
if %cho%==51 set c=3
if %cho%==113 goto DB_Options
if defined c goto DB_Options-4b
goto DB_Options-4a
:DB_Options-4b
cls
if %Cols% LSS 75 (%NoLogo%) else %Logo%
echo !B:~0,%Length%!%__DB_Options4a%!Color%c%!
chcp 852>nul
echo !B:~0,%Length%!…%A:~0,38%ª
echo !B:~0,%Length%!∫%B:~0,38%∫
echo !B:~0,%Length%!∫%B:~0,38%∫
echo !B:~0,%Length%!∫%B:~0,38%∫
echo !B:~0,%Length%!»%A:~0,38%º
chcp 1250>nul
%BX% /o 3 0 /g %Length% 11 /d "%__DB_Options4b%" /h 1
set cho=""
set /p cho=
set cho=%cho:"=%
if "%cho%"=="" goto DB_Window
set Color%c%=%cho%
call :DB_SaveDataBase
goto DB_Window
:DB_Options-5
if not defined Warp (
	set /a ItemCount+=1
	set "Item!ItemCount!= "
	call :DB_RecalcSize
	set Warp=Options-5
	goto DB_Window
)
set Warp=
set /a c=%Cols%-!Item%ItemCount%Length!-1
%BX% /g 0 1 /d "  -%__DB_Options5%-" /g %C% 3 /c 0x%Color1% /h 1
set Nazwa=""
set /p Nazwa=
set Nazwa=%Nazwa:"=%
if not defined Nazwa set /a ItemCount-=1&call :DB_RecalcAlt&call :DB_RecalcSize&goto DB_Window
set Item%ItemCount%=%Nazwa%
call :DB_SaveDataBase
call :DB_SaveData
goto DB_Window
:DB_Options-6
if not defined Warp set Warp=Options-6&goto DB_Window
set Warp=
%BX% /g 0 1 /d "  -%__DB_Options6%-" /h 1
set x=3
set c=1
set d=2
set /a e=2+%Item1Length%
goto DB_Options-2a
:DB_Options-6a
set /a d=%len%+6
%BX% /g 0 %d% /d "   %__DB_AUS% (Y/N) "
:DB_Options-6b
%BX% /k
set cho=%errorlevel%
if %cho%==121 goto DB_Options-6c
if %cho%==110 %BX% /g 0 %d% /d "                        "&goto DB_Delete-0
goto DB_Options-6b
:DB_Options-6c
set Item%c%=
call :DB_SaveDataBase
call :DB_SaveData
set Warp=Delete
goto DB_Reload



:DB_FormWindow
if %FormAct% GTR %EntityCount% set FormAct=1
if %FormAct% LSS 1 set FormAct=%EntityCount%
set /a Lines=2*ItemCount+11
cls
mode con cols=80 lines=%Lines%
chcp 852>nul
echo  /%__DB_Form%\
echo.
echo  …%A:~0,50%%A:~0,26%ª
echo  ∫%B:~0,50%%B:~0,26%∫
set c=4
set d=5
set com=
for /l %%# in (1,1,%ItemCount%) do (
	if not "!Entity%FormAct%Item%%#!"=="" (set Line1=!Item%%#!: !Entity%FormAct%Item%%#!) else (set Line1=!Item%%#!: * N/A *)
	if not "!Line1:~74!"=="" (set Line2=!Line1:~74,74!) else set Line2=
	echo  ∫!B:~0,50!!B:~0,26!∫
	echo  ∫!B:~0,50!!B:~0,26!∫
	set com=!com! /g 3 !c! /c 0x%AlterColor% /d "!Line1:~0,74!" /g 3 !d! /d "!Line2!" /g 3 !c! /c 0x%BGColor% /d "!Item%%#!: "
	set /a c+=2,d+=2
)
echo  ∫%B:~0,50%%B:~0,26%∫
set "Line=%B:~0,36%^< %FormAct%/%EntityCount% ^>%B:~0,39%"
echo  ∫%Line:~0,78%∫
echo  »%A:~0,50%%A:~0,26%º
echo.
%BX% /c 0x%AlterColor2%
echo …%A:~0,41%ª
echo ∫ ^< - Prev  ^> - Next  Tab - Ch. view mode ∫
set /p "=»%A:~0,41%º"<nul
chcp 1250>nul
%BX% %com% /o 0 0 /g 0 0 /c 0x%BGColor%
:DB_FormKeyStroke
%BX% /k
set cho=%errorlevel%
if %cho%==9 call :DB_RecalcSize&goto DB_Window
if %cho%==330 set /a FormAct-=1&goto DB_FormWindow
if %cho%==332 set /a FormAct+=1&goto DB_FormWindow
if %cho%==113 endlocal&chcp 852>nul&popd&goto DB_DBStart
if %cho%==114 goto DB_Reload
goto DB_FormKeyStroke

:DB_RecalcSize
set Cols=3
for /l %%a in (1,1,%ItemCount%) do ((if "!Item%%aLength!"=="" set Item%%aLength=20)&(if !Item%%aLength! GTR 50 set Item%%aLength=50)&(if !Item%%aLength! LSS 9 set Item%%aLength=9))&set /a Cols+=!Item%%aLength!+1
if %Cols% LSS 46 set Cols=46
mode con cols=%cols% lines=32
set /a Length=(Cols-40)/2
goto :EOF

:DB_RecalcAlt
if %EntityCount% LSS %max% (set max=%EntityCount%&set nextp=0) else (set nextp=1)
if %EntityCount% LSS %min% set /a min-=10,max=%EntityCount%
if %max% LEQ 10 (set prevp=0) else (set prevp=1)
goto :EOF

:: Koniec programu Baza Danych ::


:: Poczπtek programu PicEditor ::
:PE_Init
	setlocal enabledelayedexpansion enableextensions
	set Program=PicEditor
	%Macro_Loading:@=!%
	cd /d "%MDIR%"
	call :PE_var
:PE_New Project
	%disp% [0;1;40;31m
	%disp% [7;23H⁄ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒø
	%disp% [8;23H≥˛  New Project:  ˛≥€
	%disp% [9;23H√ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ¥€
	%disp% [10;23H≥Name:[           ]≥€
	%disp% [11;23H≥Type: [ ]    [ ]  ≥€
	%disp% [12;23H≥    Colours Simple≥€
	%disp% [13;23H√ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ¥€
	%disp% [14;23H≥˛      [Ok]      ˛≥€
	%disp% [15;23H¿ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒŸ€
	%disp% [16;23H ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ
	if !mode!==color (%disp% [11;31H*) else (%disp% [11;38H*)
	%disp% [10;30H!name!
	for /f "tokens=1,2,3" %%a in ('Core\%Fn% mouse') do set /a x=%%b+1,y=%%a+1
	if !y!==10 if !x! geq 30 if !x! leq 42 call :PE_input
	if !y!==11 (
	if !x!==31 set mode=color
	if !x!==38 set mode=simple
	)
	
	if !y!==14 if !x! geq 31 if !x! leq 34 (
	if not defined name goto PE_new
	<nul set/p "=[0;1;40;33m[1;4H!xxz!!p1!!p2!!mc.ds!"
		if !mode!==color (
			for /l %%a in (1,1,69) do set "space=!space![0;0;40;30m [;m"
			for /l %%a in (1,1,19) do set line[%%a]=!space!
			<nul set/p =!bar.color![27;5H!bar.cl![28;14H%pen%[;m
			%bs% p
	)
		if !mode!==simple (
			for /l %%b in (1,1,69) do set "space=!space! "
			for /l %%a in (1,1,19) do set line[%%a]=!space!
			%disp% [;m
			set pen=^^!tip^^!&%bs% p
	)
	goto PE_main
)
	goto PE_new
:PE_input
	%disp% [0;1;40;33m
	set name=
	set/p "name=[10;29H[           ][10;30H"
	if not defined name goto PE_input
	if exist "PicEditor_Files\sprites\!name!.pic" goto PE_input
	goto :eof
:PE_main
	for /f "tokens=1,2,3" %%a in ('Core\%Fn% mouse') do set/a x=%%b+1,y=%%a+1,z=%%c
	::title !x!,!y! [light bg:!col.bl!] [light fg:!col.fl!] [minx:!minx!]
	if !y! geq 4 if !y! leq 22 if !x! geq 2 if !x! leq 69 (
	if !z!    EQU 2 goto PE_menu
	if !mode! EQU color  call :PE_insert_1
	if !mode! EQU simple call :PE_insert_2
	<nul set/p =[!y!;!x!H%pen%
)
	if !y!==26 call :PE_bcolor b
	if !y!==27 call :PE_bcolor f
	if !y!==26 (
	if !x!==29 set tip=€
	if !x!==31 set tip=≤
	if !x!==33 set tip=±
	if !x!==35 set tip=∞
	if !x!==37 set tip=‹
	if !x!==39 set tip=ﬂ
	if !x!==41 set tip=
	if !x!==43 set tip=
	if !x!==45 set tip=
	if !x!==47 set tip=⁄
	if !x!==49 set tip=ƒ
	if !x!==51 set tip=ø
	if !x!==53 set tip=¿
	if !x!==55 set tip=Ÿ
	if !x!==57 set tip=©
	if !x!==59 set tip=∏
	if !x!==61 set tip=…
	if !x!==63 set tip=Õ
	if !x!==65 set tip=ª
	if !x!==67 set tip=Œ
	if !x!==69 set tip=»
	%bs% p
	)
	if !y!==27 (
	if !x!==29 set tip=
	if !x!==31 set tip=
	if !x!==33 set tip=
	if !x!==35 set tip=
	if !x!==37 set tip=
	if !x!==39 set tip=
	if !x!==41 set tip=
	if !x!==43 set tip=
	if !x!==45 set tip=
	if !x!==47 set tip=¡
	if !x!==49 set tip=¬
	if !x!==51 set tip=√
	if !x!==53 set tip=≈
	if !x!==55 set tip=¥
	if !x!==57 set tip=≥
	if !x!==59 set tip=Æ
	if !x!==61 set tip=Ø
	if !x!==63 set tip=π
	if !x!==65 set tip=∫
	if !x!==67 set tip=º
	if !x!==69 set tip= 
	%bs% p	
	)
	if !y!==28 (
	if !x!==29 set tip=
	if !x!==31 set tip=˛
	if !x!==33 set tip=ÿ
	if !x!==35 set tip=
	if !x!==37 set tip=
	if !x!==39 set tip=
	if !x!==41 set tip=
	if !x!==43 set tip=™
	if !x!==45 set tip=
	if !x!==47 set tip=
	if !x!==49 set tip=
	if !x!==51 set tip=
	if !x!==53 set tip=˜
	if !x!==55 set tip=Ó
	if !x!==57 set tip=Ô
	if !x!==59 set tip=
	if !x!==61 set tip=˘
	if !x!==63 set tip=˙
	if !x!==65 set tip=œ
	if !x!==67 set tip=Ã
	if !x!==69 set tip=À
	%bs% p
	)
	if !y!==25 if !x!==38 set tip= &set/a col.fl=0,col.bl=0,col.bg=0,col.fg=0&%bs% p
	if !y!==2 (
	if !x! geq 18 if !x! leq 22 call :PE_var&goto PE_new
	if !x! geq 33 if !x! leq 38 goto PE_open
	if !x! geq 41 if !x! leq 46 exit /b 0
	if !x! geq 25 if !x! leq 30 (
	del "PicEditor_Files\Sprites\!name!.pic" >nul 2>&1
	If !Mode!==color echo.!Head_Color!>>"PicEditor_Files\Sprites\!name!.pic"
	If !Mode!==simple echo.!Head_bw!>>"PicEditor_Files\Sprites\!name!.pic"

	for /l %%a in (1,1,19) do (
		if !mode!==color echo.!line[%%a]:~17!>>"PicEditor_Files\Sprites\!name!.pic"
		if !mode!==simple echo.!line[%%a]:~1!>>"PicEditor_Files\Sprites\!name!.pic"
		)
	)
)
	goto PE_main
:PE_insert_1
	set /a tmp.y=!y!-4+1,minx=!x!*17-17,maxx=!x!*17
	set "line[!tmp.y!]=!line[%tmp.y%]:~,%minx%!%pen%[;m!line[%tmp.y%]:~%maxx%!"
	goto :eof
:PE_insert_2
	set /a tmp.y=!y!-4+1,minx=!x!-1
	set "line[!tmp.y!]=!line[%tmp.y%]:~,%minx%!!tip!!line[%tmp.y%]:~%x%!"
	goto :eof
:PE_menu
	%Fn% Cursor 100
	!ui! sendkey esc press
	!ui! sendkey esc press
	set/a yy=!y!+1,og.y=!y!,og.x=!x!,max.x=!x!+19&%disp% [;m
	%disp% [!yy!;!x!H⁄ƒ¬ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒø &set/a yy+=1&set y1=!yy!
	%disp% [!yy!;!x!H≥˙≥Select Area     ≥€&set/a yy+=1&set y2=!yy!
	%disp% [!yy!;!x!H≥˙≥Copy Source code≥€&set/a yy+=1&set y3=!yy!
	%disp% [!yy!;!x!H≥˙≥Copy Pen color  ≥€&set/a yy+=1&set y4=!yy!
	%disp% [!yy!;!x!H≥˙≥Paste Here      ≥€&set/a yy+=1
	%disp% [!yy!;!x!H¿ƒ¡ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒŸ€&set/a yy+=1
	%disp% [!yy!;!x!H ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ
	%disp% [!Y!;!X!H
	:PE_menux
	for /f "tokens=1,2,3" %%a in ('Core\%Fn% mouse') do set/a x=%%b+1,y=%%a+1,z=%%c
	if !z!==1 (
	if !y!==!y1! if !x! geq !og.x! if !x! leq !max.x! call :PE_copy chr
	if !y!==!y2! if !x! geq !og.x! if !x! leq !max.x! call :PE_copy src
	if !y!==!y3! if !x! geq !og.x! if !x! leq !max.x! call :PE_copy pen
	if !y!==!y4! if !x! geq !og.x! if !x! leq !max.x! call :PE_paste
	call :PE_refresh&goto PE_main
)
	goto PE_menux
:PE_paste
	del "!tmp!\paste.txt" 2>nul
	!ui! clipboard writefile "!tmp!\paste.txt"
	for /f "tokens=1,* delims=[]" %%a in ('type "!tmp!\paste.txt"^|find /n /v ""') do (
	if [%%a]==[1] set "paste=%%b")
	if !mode!==simple call :PE_pt_simple
	if !mode!==color call :PE_pt_color
	call :PE_refresh
	goto PE_main
:PE_pt_color
	set "paste=!paste: = !"
echo.!paste!|find "">nul||(
	call :PE_countchr "!paste!"
	set "past="&set/a chrs-=1
	for /l %%a in (0,1,!chrs!) do (set "past=!past![!col.bl!;!col.fl!;4!col.bg!;3!col.fg!m!paste:~%%a,1![;m")
	set "paste=!past!"
)
	call :PE_countchr2 "!paste!"
	set /a tmp.y=!og.y!-4+1,minx=!og.x!*17-17,maxx=!og.x!*17+!chrs!-17
	set "line[!tmp.y!]=!line[%tmp.y%]:~,%minx%!!paste!!line[%tmp.y%]:~%maxx%!"
	set "line[!tmp.y!]=!line[%tmp.y%]:~0,1173!"
	goto :eof
:PE_pt_simple
	set "paste=!paste: = !"
	set "paste=!paste:=!"
	call :PE_countchr "!paste!"
	set /a tmp.y=!og.y!-4+1,minx=!og.x!-1,maxx=!og.x!+!chrs!-1
	set "line[!tmp.y!]=!line[%tmp.y%]:~,%minx%!!paste!!line[%tmp.y%]:~%maxx%!"
	set "line[!tmp.y!]=!line[%tmp.y%]:~0,69!"
	goto :eof
:PE_countchr [txt]
	set "txt_co=%~1"&set chrs=0
	:PE_l222
	if not defined txt_co goto :eof
	set "txt_co=!txt_co:~1!"
	set/a chrs+=1
	goto PE_l222
:PE_countchr2 [txt]
	set "txt_co=%~1"&set chrs=0
	:PE_l222_1
	if not defined txt_co (set/a "chrs*=17"&goto :eof)
	set "txt_co=!txt_co:~17!"
	set/a chrs+=1
	goto PE_l222_1
:PE_copy
	if [%1]==[chr] (
	call :PE_refresh
	chcp 1252 >nul
	!ui! sendmouse right click
	!ui! sendkey down press
	!ui! sendkey enter press
	PicEditor_Files\bg.exe sleep 800
	chcp 850 >nul
	)
if [%1]==[src] call :PE_ssrc
if [%1]==[pen] (
	if !mode!==color call :PE_dropp_1
	if !mode!==simple call :PE_dropp_2
	call :PE_refresh
)
	goto PE_main
:PE_ssrc
	%disp% [13;17H[0;1;40;36m[Press right click for options]
	title Press right click for options
	ping -n 2 localhost>nul& call :PE_refresh
	:PE_ssrcv
	set xpoint_i=&set ypoint_i=&set xpoint_f=&set ypoint_f=
	:PE_ssrcx
	for /f "tokens=1,2,3" %%a in ('Core\%Fn% mouse') do set/a x=%%b+1,y=%%a+1,z=%%c
	if !z!==1 (
	if !y! geq 4 if !y! leq 22 if !x! geq 2 if !x! leq 69 (
	if not defined xpoint_i set xpoint_i=!x!
	if not defined ypoint_i set ypoint_i=!y!
	set xpoint_f=!x!&set ypoint_f=!y!
	call :PE_refresh not
%disp% [!ypoint_i!;!xpoint_i!H[1;1;41;31m*^
[!ypoint_f!;!xpoint_f!H[1;1;41;31m*
))
	if !z!==2 goto PE_sscr_menu
	goto PE_ssrcx
:PE_sscr_menu
	%Fn% Cursor 100
	!ui! sendkey esc press
	!ui! sendkey esc press
	set /a yy=!y!+1,og.y=!y!,og.x=!x!,max.x=!x!+10&%disp% [;m
	%disp% [!yy!;!x!H⁄ƒ¬ƒƒƒƒƒƒø &set/a yy+=1&set y1=!yy!
	%disp% [!yy!;!x!H≥˙≥Retry ≥€&set/a yy+=1&set y2=!yy!
	%disp% [!yy!;!x!H≥˙≥Copy  ≥€&set/a yy+=1&set y3=!yy!
	%disp% [!yy!;!x!H≥˙≥Cancel≥€&set/a yy+=1
	%disp% [!yy!;!x!H¿ƒ¡ƒƒƒƒƒƒŸ€&set/a yy+=1
	%disp% [!yy!;!x!H ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ
	%disp% [!Y!;!X!H
	:PE_sscr_menux
	for /f "tokens=1,2,3" %%a in ('Core\%Fn% mouse') do set/a x=%%b+1,y=%%a+1,z=%%c
	if !z!==1 (
	if !y!==!y1! if !x! geq !og.x! if !x! leq !max.x! (call :PE_refresh &goto PE_ssrcv)
	if !y!==!y2! if !x! geq !og.x! if !x! leq !max.x! (call :PE_src_copy&goto PE_main)
	if !y!==!y3! if !x! geq !og.x! if !x! leq !max.x! (title !xxz!&call :PE_refresh &goto PE_main)
	call :PE_refresh
	title !xxz!
%disp% [!ypoint_i!;!xpoint_i!H[1;1;41;31m*^
[!ypoint_f!;!xpoint_f!H[1;1;41;31m*
	goto PE_ssrcx
	)
	goto PE_sscr_menux
:PE_src_copy
	del "!tmp!\paste.txt" 2>nul
	if !mode!==simple (
	set/a maxx=!xpoint_f!-!xpoint_i!+1,ypoint_i-=3,ypoint_f-=3,xpoint_i-=1
	)
	if !mode!==color (
	set/a xpoint_i*=17,xpoint_f*=17
	set/a maxx=!xpoint_f!-!xpoint_i!+17,ypoint_i-=3,ypoint_f-=3,xpoint_i-=17
	)
	for /l %%a in (!ypoint_i!,1,!ypoint_f!) do (
	echo !line[%%a]:~%xpoint_i%,%maxx%!>>"!tmp!\paste.txt")
	title !xxz!
	!ui! clipboard readfile "!tmp!\paste.txt"
	call :PE_refresh
	goto :eof
:PE_dropp_1
	set/a ox=!og.x!*17-17,oy=!og.y!-4+1
	set "tmp_var=!line[%oy%]:~%ox%,17!"
	for /f "tokens=1,2,3,4,5 delims=;" %%a in ('echo !tmp_var!') do (
	set col.bl=%%a&set col.bl=!col.bl:~2!
	set col.fl=%%b
	set col.bg=%%c&set col.bg=!col.bg:~1!
	set col.fg=%%d&set col.fg=!col.fg:~1,1!
	set    tip=%%d&set tip=!tip:~3,1!
)
	goto :eof
:PE_dropp_2
	set/a ox=!og.x!-1,oy=!og.y!-4+1
	set tip=!line[%oy%]:~%ox%,1!
	goto :eof
:PE_refresh [not]
	%Fn% Cursor 0
	set yy=4
	if not [%1]==[not] %disp% [0;1;40;33m[1;3H!xxz!!p1!!p2!!mc.ds!
	if !mode!==color (
	%disp% !bar.color!
	for /l %%a in (1,1,19) do (
	%disp% [!yy!;2H!line[%%a]:~17!!lf!
	set/a yy+=1
)) 
	if !mode!==simple (
	%disp% [;m
	for /l %%a in (1,1,19) do (
	%disp% [!yy!;2H!line[%%a]:~1!!lf!
	set/a yy+=1
))
	if not [%1]==[not] %bs% p
	goto :eof
:PE_bcolor
	if !x!==5  %bs%0 %1
	if !x!==6  %bs%1 %1
	if !x!==7  %bs%2 %1
	if !x!==8  %bs%3 %1
	if !x!==9  %bs%4 %1
	if !x!==10 %bs%5 %1
	if !x!==11 %bs%6 %1
	if !x!==12 %bs%7 %1
	if !x!==18 set col.%1l=0&%bs% p
	if !x!==21 set col.%1l=1&%bs% p
	if !x!==24 set col.%1l=5&%bs% p
	goto :eof
:PE_open
	%disp% [0;1;40;32m
	%disp% [07;25H⁄ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒø
	%disp% [08;25H≥˛Name of File: ˛≥€
	%disp% [09;25H≥[              ]≥€
	%disp% [10;25H¿ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒŸ€
	%disp% [11;25H ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ
	:PE_openx
	set/p "name=[09;27H              [09;27H" || goto PE_openx
	if not exist "PicEditor_Files\Sprites\!name!.pic" goto PE_openx
	set "ln_h=[0;1;40;34m [;m"& set mode=color
	type "PicEditor_Files\sprites\!name!.pic"|find "!Head_color!" >nul||(
		set "ln_h= "
		set mode=simple
		Set Space=
			for /l %%b in (1,1,69) do set "space=!space! "
			for /l %%a in (1,1,19) do set line[%%a]=!space!
	)
	for /f "Tokens=1,* Skip=1 Delims=[]" %%a in ('type "PicEditor_Files\sprites\!name!.pic"^|find /n /v ""') do (
	Set/a _Tmp_=%%a-1
	set "line[!_Tmp_!]=!ln_h!%%b"
	)
	For /l %%Y in (1,1,19) Do set "line[%%Y]=!line[%%Y]: = !"
	if !mode!==simple (
		%disp% [;m
		set pen=^^!tip^^!&%bs% p
)
	if !mode!==color (
		set pen=[^^!col.bl^^!;^^!col.fl^^!;4^^!col.bg^^!;3^^!col.fg^^!m^^!tip^^!
		)
	call :PE_refresh
	goto PE_main
:PE_var
	md "!cd!\PicEditor_Files\Sprites\" 2>nul
	mode con cols=70 lines=30
	set "xxz=.::{Pic Editor: Map & Sprite Editor in Batch By Honguito98}::."
	title !xxz!
	set mode=color
	Set "Head_Color=Pic Editor, Developed By Honguito98, 2013 - ANSI Color Sequences File"
	Set "Head_Bw=Pic Editor, Developed By Honguito98, 2013 - ASCII File"
	set pen=[^^!col.bl^^!;^^!col.fl^^!;4^^!col.bg^^!;3^^!col.fg^^!m^^!tip^^!
	set "bs=call :PE_base "
	set tip=±
	set "disp=<nul set/p = "
	set space=&set p2=&set bar.cl=
	set sp=&  set mc.ds=&set name=
	set ui=ui.dll
	set lf=^


	set /a bg=9,fg=11,col.bg=0,col.fg=0,col.fl=0,col.bl=0
	set "p1=[2;18H[0;1;40;36m[New]  [Save]  [Open]  [Exit]"
	for /l %%a in (0,1,7) do (
	call :PE_base %%a b
	set "bar.cl=!bar.cl![0;!col.bl!;40;3!col.bg!m˛[;m"
)
	set /a col.bl=5,col.fl=1
	%bs% 1 f & %bs% 3 b
	for %%c in (
	"[24;1H[;m"
	"⁄ƒƒƒƒƒƒƒƒƒƒƒƒƒƒ¬ƒƒƒƒƒƒƒƒƒƒø⁄ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒø"
	"≥Colors:       ≥Brightness≥≥Brushes:[#]                              ≥"
	"≥BG:        [ ]≥[ ][ ][ ] ≥≥€ ≤ ± ∞ ‹ ﬂ    ⁄ ƒ ø ¿ Ÿ © ∏ … Õ ª Œ »≥"
	"≥FG:        [ ]≥[ ][ ][ ] ≥≥         ¡ ¬ √ ≈ ¥ ≥ Æ Ø π ∫ º  ≥"
	"≥BF:-  -  - [ ]≥ 0  1  5  ≥≥ ˛ ÿ     ™     ˜ Ó Ô  ˘ ˙ œ Ã À≥"
	"¿ƒƒƒƒƒƒƒƒƒƒƒƒƒƒ¡ƒƒƒƒƒƒƒƒƒƒŸ¿ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒŸ"
	) do set "p2=!p2!%%~c"
	set "bar.color=[26;5H!bar.cl![27;5H!bar.cl!"
	for /l %%a in (1,1,19) do set "sp=!sp!≥                                                                    ≥"
	for %%a in (
	"[3;1H[0;1;40;32m"
	"⁄ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒø"
	"!sp!"
	"¿ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒŸ"
	) do set "mc.ds=!mc.ds!%%~a"
	<nul set/p "=[0;1;40;33m[1;4H!xxz!!p1!!p2!!mc.ds!"
	if !mode!==color (<nul set/p =!bar.color![27;5H!bar.cl![28;14H%pen%[;m)
	if !mode!==simple (%disp% [28;14H!tip!)
	goto :eof

:PE_base [n] [b\f] [p]
	if !mode!==simple (%disp% [28;14H!tip!&goto :eof)
	if %1==p goto PE_ppp
	if %1==0 set/a col.%2g=0
	if %1==1 set/a col.%2g=4
	if %1==2 set/a col.%2g=2
	if %1==3 set/a col.%2g=6
	if %1==4 set/a col.%2g=1
	if %1==5 set/a col.%2g=5
	if %1==6 set/a col.%2g=3
	if %1==7 set/a col.%2g=7
	:PE_ppp
<nul set/p =[26;14H[0;!col.bl!;4!col.bg!;30m!tip!^
[27;14H[0;!col.fl!;40;3!col.fg!m!tip!^
[;m[28;14H%pen%[;m
%disp% [26;18Hˇ[26;21Hˇ[26;24Hˇ^
[27;18Hˇ[27;21Hˇ[27;24Hˇ
	if !col.bl!==0 %disp% [26;18H*
	if !col.bl!==1 %disp% [26;21H*
	if !col.bl!==5 %disp% [26;24H*
	if !col.fl!==0 %disp% [27;18H*
	if !col.fl!==1 %disp% [27;21H*
	if !col.fl!==5 %disp% [27;24H*
	goto :eof
:: Koniec programu PicEditor ::


:: Poczπtek programu ZbiÛr szyfrÛw ::
:SZ_Init
setlocal enabledelayedexpansion
set Program=%__SZ_Name%
%Macro_Loading:@=!%
mode con cols=80 lines=30
set ver=wersja 1.1
set ABName1=%__SZ_ABType1%
set ABName2=%__SZ_ABType2%
:SZ_Menu
cls
title %Program% - %ver%
echo %Program% - %ver%
echo.[0;1;40;37m
echo %__SZ_Menu01%^^!
echo %__SZ_Menu02%^^! ^^^^^^^^
echo %__SZ_Menu03%
echo.
echo [0;1;40;31m-= %__SZ_Menu04% =-[0;40;37m
echo.
echo   1) %__SZ_Menu1%
echo   2) %__SZ_Menu2%
echo   3) %__SZ_Menu3%
echo   4) %__SZ_Menu4%
echo.
echo [0;1;40;33m-= %__SZ_Menu05% =-[0;40;37m
echo.
echo   5) %__SZ_Menu5%
echo   6) %__SZ_Menu6%
echo.
echo [0;1;40;36m-= %__SZ_Menu06% =-[0;40;37m
echo.
echo   7) %__SZ_Menu7%
echo.[0;1;40;37m
echo   ?) %__SZ_MenuX%
echo   Q) %__SZ_MenuQ%
echo.
set CodeType=
set /p "CodeType=> "
if "%CodeType%"=="1" set title=%__SZ_Menu1%&call :SZ_Code
if "%CodeType%"=="2" set title=%__SZ_Menu2%&call :SZ_Code
if "%CodeType%"=="3" set title=%__SZ_Menu3%&call :SZ_3Code
if "%CodeType%"=="4" set title=%__SZ_Menu4%&call :SZ_Code
if "%CodeType%"=="5" set title=%__SZ_Menu5%&call :SZ_5Code
if "%CodeType%"=="6" set title=%__SZ_Menu6%&call :SZ_Code
if "%CodeType%"=="7" set title=%__SZ_Menu7%&call :SZ_7Code
if "%CodeType%"=="?" start http://cmdteam.esy.es/index.php?/topic/99-zbi%C3%B3r-szyfr%C3%B3w-7-szyfr%C3%B3w-i-wci%C4%85%C5%BC-ro%C5%9Bnie/
if /i "%CodeType%"=="Q" endlocal&exit /b 0
goto SZ_Menu
:SZ_Code
cls
set ABType=2
title %title% - %ver%
echo %title% - %ver%
echo.
echo %__SZ_ABType0%
echo.
echo 1) %ABName1% [A§BCèD...UWYZçΩ]
echo 2) %ABName2% [0;1;40;36m(%__SZ_Default%) [0;1;40;37m[ABCDEF...UVWXYZ]
echo.
set /p "ABType=> "
if "%AbType%"=="1" set "CharSet1=A§BCèDE®FGHIJKLùMN„O‡PRSóTUWYZΩç"&set "CharSet1a=a•bcÜde©fghijklàmn‰o¢prsòtuwyzæ´"&set Chars=32&goto SZ_%CodeType%Code2
if "%AbType%"=="2" set "CharSet1=ABCDEFGHIJKLMNOPQRSTUVWXYZ"&set "CharSet1a=abcdefghijklmnopqrstuvwxyz"&set Chars=26&goto SZ_%CodeType%Code2
goto SZ_1Code

:SZ_1Code2
echo.
set Num=
set /p "Num=%__SZ_Code1%"
if /i "%Num%"=="brute" (set brute=on) else (
	set brute=
	set /a Num+=0
	if !Num! EQU 0 goto SZ_1Code2
)
:SZ_1Code2a
set /a "Num=Num%%Chars"
set CharSet2=!CharSet1:~%Num%!!CharSet1:~0,%Num%!
set CharSet2a=!CharSet1a:~%Num%!!CharSet1a:~0,%Num%!
if "%brute%"=="onwork" goto SZ_1CodeProcess0
:SZ_1Code3
cls
echo %__SZ_Code2%
set Text=
set /p "Text=> " || goto SZ_1Code3
set "Text=%Text:!=#%"
set "Text=%Text:"=%"
cls
echo %__SZ_Code3%
echo - %__SZ_Code4% %title%
echo - %__SZ_Code5% %ABType% (!ABName%ABType%!)
if "%CodeType%"=="1" echo - %__SZ_Code6a% %Num% %__SZ_Code6b%
if "%brute%"=="on" goto SZ_1Code5
:SZ_1CodeProcess0
set c=0
set d=0
for /l %%a in (0,100,8100) do (
	if "!Text:~%%a,100!"=="" goto SZ_1CodeProcess1
	set /a d+=1
	set "Str!d!=!Text:~%%a,100!"
)
:SZ_1CodeProcess1
echo.
for /l %%a in (1,1,%d%) do (
	set CStr%%a=
	if not defined brute (
		set /a e=%%a*100-99
		set /a f=%%a*100
		echo  [0;40;33m%__SZ_Code7a% !e! %__SZ_Code7b% !f!...[0;1;40;37m
	)
	for /l %%# in (0,1,99) do (
		set "a=!Str%%a:~%%#,1!"
		if "!a!"=="" goto SZ_1CodeProcess3
		call :SZ_1CodeProcess1a
		set "CStr%%a=!CStr%%a!!a!"
	)
)
goto SZ_1CodeProcess3

:SZ_1CodeProcess1a
for /f "tokens=1* delims=%CharSet1%" %%A in ("0%a%") do if "0"=="%%A" call :SZ_1CodeProcess2a
for /f "tokens=1* delims=%CharSet1a%" %%A in ("0%a%") do if "0"=="%%A" call :SZ_1CodeProcess2b
goto :EOF

:SZ_1CodeProcess2a
if "%a%"=="!CharSet1:~%c%,1!" (
	set "a=!CharSet2:~%c%,1!"
) else (
	set /a c+=1
	if !c! GEQ %Chars% set c=0
	goto SZ_1CodeProcess2a
)
goto :EOF

:SZ_1CodeProcess2b
if "%a%"=="!CharSet1a:~%c%,1!" (
	set "a=!CharSet2a:~%c%,1!"
) else (
	set /a c+=1
	if !c! GEQ %Chars% set c=0
	goto SZ_1CodeProcess2b
)
goto :EOF

:SZ_1CodeProcess3
set CText=
for /l %%a in (1,1,%d%) do set "CText=!Ctext!!CStr%%a!"
if defined brute echo %__SZ_Code6a% %Num%: "%CText%"&goto :EOF
chcp 1250>nul
(echo %__SZ_Code14% "%Text%"
echo %__SZ_Code15% "%CText%"
if "%CodeType%"=="1" echo %__SZ_Code6a% %Num% %__SZ_Code6b%
echo.
echo %title% - %__SZ_Code8% "%Program%" by CreepyNinja_
)>Wynik.txt
goto SZ_Done

:SZ_1Code5
set brute=onwork
for /l %%a in (2,1,%Chars%) do (
	set /a Num=%%a-1
	set Num=-!Num!
	call :SZ_1Code2a
)
echo.
echo %__SZ_Code9%^^!
echo.
pause
goto :EOF

:SZ_5Code
title %title% - %ver%
set ABType=2
set Pass=ABCDEFGHIJKLMNOPQRSTUVWXYZ
for /l %%# in (0,1,25) do set Ch%%#=%%#
set PassL=26
set CharSet1=ABCDEFGHIJKLMNOPQRSTUVWXYZ
set CharSet1a=abcdefghijklmnopqrstuvwxyz
set Chars=26
goto SZ_2Code3

:SZ_6Code2
set CharSet2=&set CharSet2a=
for /l %%# in (-1,-1,-%Chars%) do set CharSet2=!CharSet2!!CharSet1:~%%#,1!&set CharSet2a=!CharSet2a!!CharSet1a:~%%#,1!
goto SZ_2Code2

:SZ_2CodeProcess2c
if /i "%a%"=="!CharSet1:~%c%,1!" (
	goto :EOF
) else (
	set /a c+=1
	if !c! GEQ %Chars% set c=0
)
goto SZ_2CodeProcess2c

:SZ_2Code2
echo.
set Pass=
set /p "Pass=%__SZ_Code10%" || goto SZ_2Code2
set "Pass=%Pass:!=#%"
set "Pass=%Pass:"=%"
for /f "tokens=1* delims=%CharSet1%%CharSet1a%" %%A in ("0a%Pass%") do if not ""=="%%B" echo %__SZ_Code11%&goto SZ_2Code2
echo %__SZ_Code12%
set c=0
for /l %%# in (0,1,8196) do (
	set "a=!Pass:~%%#,1!"
	if "!a!"=="" set PassL=%%#&goto SZ_2Code3
	call :SZ_2CodeProcess2c
	set "Ch%%#=!c!"
)
:SZ_2Code3
cls
echo %__SZ_Code2%
set Text=
set /p "Text=> " || goto SZ_2Code3
set "Text=%Text:!=#%"
set "Text=%Text:"=%"
:SC_2Code4
cls
echo %__SZ_Code3%
echo - %__SZ_Code4% %title% 
echo - %__SZ_Code5% %ABType% (!ABName%ABType%!)
if not "%CodeType%"=="5" echo - %__SZ_Code13% %Pass%
if "%CodeType%"=="6" set CharSet1=%CharSet2%&set CharSet1a=%CharSet2a%
:SZ_2CodeProcess0
set b=0
set c=0
set d=0
for /l %%a in (0,100,8100) do (
	if "!Text:~%%a,100!"=="" goto SZ_2CodeProcess1
	set /a d+=1
	set "Str!d!=!Text:~%%a,100!"
)
:SZ_2CodeProcess1
echo.
for /l %%a in (1,1,%d%) do (
	set CStr%%a=
	set /a e=%%a*100-99
	set /a f=%%a*100
	echo  [0;40;33m%__SZ_Code7a% !e! %__SZ_Code7b% !f!...[0;1;40;37m
	for /l %%# in (0,1,99) do (
		set "a=!Str%%a:~%%#,1!"
		if "!a!"=="" goto SZ_2CodeProcess3
		call :SZ_2CodeProcess1a
		set "CStr%%a=!CStr%%a!!a!"
	)
)
goto SZ_2CodeProcess3

:SZ_2CodeProcess1a
for /f "tokens=1* delims=%CharSet1%" %%A in ("0%a%") do if "0"=="%%A" call :SZ_2CodeProcess2a
for /f "tokens=1* delims=%CharSet1a%" %%A in ("0%a%") do if "0"=="%%A" call :SZ_2CodeProcess2b
goto :EOF

:SZ_2CodeProcess2a
if "%a%"=="!CharSet1:~%c%,1!" (
	set /a a=!Ch%b%!+!c!
	set /a a=!a!%%Chars
) else (
	set /a c+=1
	if !c! GEQ %Chars% set c=0
	goto SZ_2CodeProcess2a
)
set "a=!CharSet1:~%a%,1!"
set /a b+=1
if %b% GEQ %PassL% set b=0
goto :EOF

:SZ_2CodeProcess2b
if "%a%"=="!CharSet1a:~%c%,1!" (
	set /a a=!Ch%b%!+!c!
	set /a a=!a!%%Chars
) else (
	set /a c+=1
	if !c! GEQ %Chars% set c=0
	goto SZ_2CodeProcess2b
)
set "a=!CharSet1a:~%a%,1!"
set /a b+=1
if %b% GEQ %PassL% set b=0
goto :EOF

:SZ_2CodeProcess3
set CText=
for /l %%a in (1,1,%d%) do set "CText=!CText!!CStr%%a!"
chcp 1250>nul
(echo %__SZ_Code14% "%Text%"
if not "%CodeType%"=="5" echo %__SZ_Code13% "%Pass%"
echo %__SZ_Code15% "%CText%"
echo.
echo %title% - %__SZ_Code8% "%Program%" by CreepyNinja_
)>Wynik.txt
goto SZ_Done

:SZ_3Code
cls
title %title% - %ver%
echo %title% - %ver%
echo.
echo %__SZ_Code16%
echo %__SZ_Code17%
set Text=
set /p "Text=> " || goto SZ_3Code
if /i "%Text%"=="decode" goto SZ_3Code2
set "Text=%Text:!=#%"
set "Text=%Text:"=%"
cls
echo %__SZ_Code3%
echo - %__SZ_Code4% %title%
set "CText=%Text%"
set "CText=!CText:A=aaaaa!"
set "CText=!CText:B=aaaab!"
set "CText=!CText:C=aaaba!"
set "CText=!CText:D=aaabb!"
set "CText=!CText:E=aabaa!"
set "CText=!CText:F=aabab!"
set "CText=!CText:G=aabba!"
set "CText=!CText:H=aabbb!"
set "CText=!CText:I=abaaa!"
set "CText=!CText:J=abaaa!"
set "CText=!CText:K=abaab!"
set "CText=!CText:L=ababa!"
set "CText=!CText:M=ababb!"
set "CText=!CText:N=abbaa!"
set "CText=!CText:O=abbab!"
set "CText=!CText:P=abbba!"
set "CText=!CText:Q=abbbb!"
set "CText=!CText:R=baaaa!"
set "CText=!CText:S=baaab!"
set "CText=!CText:T=baaba!"
set "CText=!CText:U=baabb!"
set "CText=!CText:V=baabb!"
set "CText=!CText:W=babaa!"
set "CText=!CText:X=babab!"
set "CText=!CText:Y=babba!"
set "CText=!CText:Z=babbb!"
chcp 1250>nul
(echo %__SZ_Code14% "%Text%"
echo %__SZ_Code15% "%CText%"
echo - %__SZ_Code20% -
echo.
echo %title% - %__SZ_Code8% "%Program%" by CreepyNinja_
)>Wynik.txt
goto SZ_Done

:SZ_3Code2
cls
title %title% - %ver%
echo %title% - %ver%
echo.
echo %__SZ_Code18%
echo %__SZ_Code19%
set Text=
set /p "Text=> " || goto SZ_3Code2
if /i "%Text%"=="code" goto SZ_3Code
set "Text=%Text:!=#%"
set "Text=%Text:"=%"
set "CText=%Text%"
set CharSet1=abcdefghijklmnopqrstuvwxyz
set CharSet2=aaaaaaaaabaaabaaaabbaabaaaababaabbaaabbbabaaaabaaaabaabababaababbabbaaabbababbbaabbbbbaaaabaaabbaababaabbbaabbbabaabababbabbababbb
cls
echo %__SZ_Code3%
echo - %__SZ_Code4% %title%
set FCText=
set /a c=0,d=0,e=0
for /l %%a in (0,1,8192) do (
	for %%# in (!e!) do (
		set "a=!CText:~%%#,5!"
		if "!a!"=="" goto SZ_3Code2b
		for /f "tokens=1* delims=AaBb" %%A in ("0a!CText:~%%#,5!") do (
			if ""=="%%B" (call :SZ_3Code2a&set /a e+=5) else (set /a e+=1)
		set FCText=!FCText!!a:~0,1!
		)
	)
)
goto SZ_3Code2b
:SZ_3Code2a
if /i "!CText:~%e%,5!"=="!CharSet2:~%d%,5!" (
	set "a=!CharSet1:~%c%,1!"
) else (
	set /a c+=1
	set /a d+=5
	if !c! GEQ 26 set c=0&set d=0
	goto SZ_3Code2a
)
goto :EOF

:SZ_3Code2b
set "CText=!FCText!"
chcp 1250>nul
(echo %__SZ_Code14% "%Text%"
echo %__SZ_Code15% "%CText%"
echo - %__SZ_Code21% -
echo.
echo %title% - %__SZ_Code8% "%Program%" by CreepyNinja_
)>Wynik.txt
goto SZ_Done

:SZ_4Code2
cls
echo %__SZ_Code2%:
set Text=
set /p "Text=> " || goto SZ_4Code2
set "Text=%Text:!=#%"
set "Text=%Text:"=%"
set CharSet2=&set CharSet2a=
for /l %%# in (-1,-1,-%Chars%) do set CharSet2=!CharSet2!!CharSet1:~%%#,1!&set CharSet2a=!CharSet2a!!CharSet1a:~%%#,1!
cls
echo %__SZ_Code3%
echo - %__SZ_Code4% %title% 
echo - %__SZ_Code5% %ABType% (!ABName%ABType%!)
goto SZ_1CodeProcess0

:SZ_7Code
cls
set Pass=
set /p "Pass=%__SZ_Code22%" || goto SZ_7Code
set "Pass=%Pass:!=#%"
set "Pass=%Pass:"=%"
for /f "tokens=1* delims=A§BCèDE®FGHIJKLùMN„O‡PQRSóTUVWXYZΩça•bcÜde©fghijklàmn‰o¢pqrsòtuvwxyzæ´" %%A in ("0A%Pass%") do if not "%%B"=="" goto SZ_7Code
echo %__SZ_Code23%
set VPass=
for /l %%# in (0,1,8196) do (
	set "a=!Pass:~%%#,1!"
	if "!a!"=="" goto SZ_7Code2
	set "VPass=!VPass!!a! "
)
:SZ_7Code2
for /l %%# in (0,1,8196) do (
	set "a=!Pass:~%%#,1!"
	if "!a!"=="" goto SZ_7Code3
	set b=0
	for %%A in (!VPass!) do (
		if /i "%%A"=="!a!" set /a b+=1
	)
	if !b! GTR 1 goto SZ_7Code
)
:SZ_7Code3
cls
echo %__SZ_Code2%
set Text=
set /p "Text=> " || goto SZ_7Code3
set "Text=%Text:!=#%"
set "Text=%Text:"=%"
cls
echo %__SZ_Code3%
echo - %__SZ_Code4% %title% 
echo - %__SZ_Code13% %Pass%
set VPass=
for /l %%# in (0,2,8196) do (
	set "a=!Pass:~%%#,2!"
	if "!a!"=="" goto SZ_7Code4
	if "!a:~1,1!"=="" goto SZ_7Code4
	set "VPass=!VPass!!a! "
)
:SZ_7Code4
set d=0
for /l %%a in (0,100,8100) do (
	if "!Text:~%%a,100!"=="" goto SZ_7Code5
	set /a d+=1
	set "Str!d!=!Text:~%%a,100!"
)
:SZ_7Code5
echo.
for /l %%a in (1,1,%d%) do (
	set CStr%%a=
	if not defined brute (
		set /a e=%%a*100-99
		set /a f=%%a*100
		echo  [0;40;33m%__SZ_Code7a% !e! %__SZ_Code7b% !f!...[0;1;40;37m
	)
	for /l %%# in (0,1,99) do (
		set "a=!Str%%a:~%%#,1!"
		if "!a!"=="" goto SZ_7Code6
		call :SZ_7Code7
		set "CStr%%a=!CStr%%a!!a!"
	)
)
:SZ_7Code6
set CText=
for /l %%a in (1,1,%d%) do set "CText=!CText!!CStr%%a!"
chcp 1250>nul
(echo %__SZ_Code14%: "%Text%"
echo %__SZ_Code13% "%Pass%"
echo %__SZ_Code15% "%CText%"
echo.
echo %title% - %__SZ_Code8% "%Program%" by CreepyNinja_
)>Wynik.txt
goto SZ_Done

:SZ_7Code7
for %%A in (!VPass!) do (
	set b=%%A
	if not "!b!"=="!b:%a%=!" set "a=!b:%a%=!"&goto :EOF
)
goto :EOF

:SZ_Done
chcp 852>nul
echo.
echo %__SZ_Code9%^^! %__SZ_Code24%
echo.
echo [0;1;40;33m"%CText%"[0;1;40;37m
echo.
pause
goto :EOF
:: Koniec programu ZbiÛr szyfrÛw ::


:: Poczπtek programu KÛ≥ko i Krzyøyk ::
:KK_Init
setlocal enabledelayedexpansion
mode con cols=43 lines=31
title %__KK_Name% by Szagajew
set ansicolor=37
set playerX=0
set playerO=0
set remis=0

:KK_NowaGra
REM Losowanie pierwszego gracza
set "str=XO"
set /a R=!random!%%2
set gracz=!str:~%R%,1!

REM Przypisywanie zmiennych pÛl
for /l %%a in (1,1,9) do set "pole_%%a=%%a"
for /l %%p in (0,1,10) do ( for /l %%d in (0,1,7) do ( set "_%%d%%p=        ") )

REM Rysowanie planszy
call :KK_Plansza !gracz!

:KK_GlownaPetla
call :KK_Ruch !gracz! || exit /b
call :KK_Plansza !gracz!
goto :KK_Sprawdzenie

:KK_Ruch
set "key="
%Fn% Kbd
set "key=%errorlevel%" 
If !key! Equ %__KK_Num1% endlocal&exit /b 1
If !key! Equ %__KK_Num2% endlocal&exit /b 1
If !key! Equ 110 goto :KK_NowaGra
If !key! Equ 78 goto :KK_NowaGra
set /a key-=48
for /l %%b in (1;1;9) do ( if /i not "!pole_%%b!" equ "X" ( if /i not "!pole_%%b!" equ "O" ( If "!key!" Equ "%%b" call :KK_Znak_%1 %%b & exit /b 0)))
goto KK_Ruch

:KK_Sprawdzenie
::poziome
if %pole_1%==%pole_2% (if %pole_2%==%pole_3% (goto :KK_Wygrana))
if %pole_4%==%pole_5% (if %pole_5%==%pole_6% (goto :KK_Wygrana))
if %pole_7%==%pole_8% (if %pole_8%==%pole_9% (goto :KK_Wygrana))
::pionowe
if %pole_1%==%pole_4% (if %pole_4%==%pole_7% (goto :KK_Wygrana))
if %pole_2%==%pole_5% (if %pole_5%==%pole_8% (goto :KK_Wygrana))
if %pole_3%==%pole_6% (if %pole_6%==%pole_9% (goto :KK_Wygrana))
::ukoúne
if %pole_1%==%pole_5% (if %pole_5%==%pole_9% (goto :KK_Wygrana))
if %pole_3%==%pole_5% (if %pole_5%==%pole_7% (goto :KK_Wygrana))
::remis
if not %pole_1%==1 (if not %pole_2%==2 (if not %pole_3%==3 (
if not %pole_4%==4 (if not %pole_5%==5 (if not %pole_6%==6 (
if not %pole_7%==7 (if not %pole_8%==8 (if not %pole_9%==9 (
call :KK_Ramka %__KK_Label9%
goto :KK_NowaGra)))))))))
goto :KK_GlownaPetla

 :KK_Plansza
cls
color %color%
echo.                               
echo  %_17% ∫%_18% ∫%_19%   ⁄ƒƒƒƒƒƒƒƒø
echo  %_27% ∫%_28% ∫%_29%   ≥[0;40;%ansicolor%m%__KK_Label1:~0,1%[0;1;40;%ansicolor%m%__KK_Label1:~1,7%≥
echo  %_37% ∫%_38% ∫%_39%   ¿ƒƒƒƒƒƒƒƒŸ
echo  %_47% ∫%_48% ∫%_49%   ⁄ƒƒƒƒƒƒƒƒø
echo  %_57% ∫%_58% ∫%_59%   ≥[0;40;%ansicolor%m%__KK_Label2:~0,1%[0;1;40;%ansicolor%m%__KK_Label2:~1,7%≥
echo  %_67% ∫%_68% ∫%_69%   ¿ƒƒƒƒƒƒƒƒŸ
echo  ÕÕÕÕÕÕÕÕÕŒÕÕÕÕÕÕÕÕÕŒÕÕÕÕÕÕÕÕÕ
echo  %_14% ∫%_15% ∫%_16%   
echo  %_24% ∫%_25% ∫%_26%   [0;1;40;33m%__KK_Label3%[0;1;40;%ansicolor%m
echo  %_34% ∫%_35% ∫%_36%   [0;1;40;33m%__KK_Label4% %1[0;1;40;%ansicolor%m
echo  %_44% ∫%_45% ∫%_46%   
echo  %_54% ∫%_55% ∫%_56%   
echo  %_64% ∫%_65% ∫%_66%   
echo  ÕÕÕÕÕÕÕÕÕŒÕÕÕÕÕÕÕÕÕŒÕÕÕÕÕÕÕÕÕ
echo  %_11% ∫%_12% ∫%_13%    
echo  %_21% ∫%_22% ∫%_23%   [0;1;40;37m%__KK_Label5%[0;1;40;%ansicolor%m
echo  %_31% ∫%_32% ∫%_33%   [0;1;40;31mX - %playerX%[0;1;40;%ansicolor%m
echo  %_41% ∫%_42% ∫%_43%   [0;1;40;32mO - %playerO%[0;1;40;%ansicolor%m
echo  %_51% ∫%_52% ∫%_53%   [0;1;40;37m%__KK_Label6%[0;1;40;%ansicolor%m
echo  %_61% ∫%_62% ∫%_63%   [0;1;40;33m%remis%[0;1;40;%ansicolor%m

goto :EOF

:KK_Znak_O
set pole_%1=O
	set "_1%1= ∞∞∞∞∞∞∞"
	set "_2%1= ∞     ∞"
	set "_3%1= ∞     ∞"
	set "_4%1= ∞     ∞"
	set "_5%1= ∞     ∞"
	set "_6%1= ∞∞∞∞∞∞∞"
	set gracz=X
	set color=0a
	set ansicolor=32
goto :EOF
:KK_Znak_X
set pole_%1=X
	set "_1%1= ∞     ∞"
	set "_2%1=  ∞   ∞ "
	set "_3%1=   ∞∞∞  "
	set "_4%1=   ∞∞∞  "
	set "_5%1=  ∞   ∞ "
	set "_6%1= ∞     ∞"
	set gracz=O
	set color=0c
	set ansicolor=31
goto :EOF

:KK_Wygrana
if !gracz!==X (
	set /a playerO+=1
	call :KK_ramka %__KK_Label7%
	goto :KK_NowaGra) 

if !gracz!==O (
	set /a playerX+=1 
	call :KK_ramka %__KK_Label8%
	goto :KK_NowaGra) 

:KK_Ramka 
echo.
echo  …ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕª
echo  ∫                                      ∫
echo  ∫              %1 %2                ∫
echo  ∫                                      ∫
echo  ∫%__KK_Label10%∫
echo  ∫                                      ∫
echo  »ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕº
if /i "%1"=="%__KK_Label9%" set /a remis+=1
pause>nul
exit /b 0
:: Koniec programu KÛ≥ko i Krzyøyk ::



:: Poczπtek programu CreepyCraft ::
:CB_Init
set Program=CreepyCraft by Creepy
%Macro_Loading:@=!%
cd /d "%MDIR%"
title CraftBatcher Remake by CreepyNinja_
	Setlocal DisableDelayedExpansion EnableExtensions
	set Ver=v1.1
	Set "Game=%~nx0"
	Set disp=echo.
	Set Accuracy=400
	Set AccuracyBar=3
	Set Saves=CreepyCraft_Saves
	Set LF=^


	Set "Mouse="
	For /F "Skip=3 Tokens=1,* Delims=:" %%a in ('Find "@1:" "%Game%"') Do (
	Call Set "Mouse=%%Mouse%%%%b[#LineFeed#]"
	)

	SetLocal EnableDelayedExpansion EnableExtensions
	Set ^"Mouse=!Mouse:[#LineFeed#]=^%LF%%LF%!"

if not exist %Saves% md %Saves%

color 0F&cls
%Fn% Enablem
%Fn% Cursor 0
mode 35,31

:CB_Menu
call :CB_Shade
color 0F
cls
set MBar1=⁄ƒƒƒƒƒƒƒƒƒƒƒƒƒƒø
set MBar2=≥     Play     ≥
set MBar3=≥   Settings   ≥
set MBar4=≥   Controls   ≥
set MBar5=≥   Credits    ≥
set MBar6=≥     Exit     ≥
set MBar7=¿ƒƒƒƒƒƒƒƒƒƒƒƒƒƒŸ
%disp%[1;11HCreepyCraft %Ver%
set Print1=[4;11H%MBar1%[5;11H%MBar2%[6;11H%MBar7%
set Print2=[8;11H%MBar1%[9;11H%MBar3%[10;11H%MBar7%
set Print3=[12;11H%MBar1%[13;11H%MBar4%[14;11H%MBar7%
set Print4=[16;11H%MBar1%[17;11H%MBar5%[18;11H%MBar7%
set Print5=[20;11H%MBar1%[21;11H%MBar6%[22;11H%MBar7%
for /l %%a in (1,1,5) do set HL%%a=0
%disp%!Print1!!Print2!!Print3!!Print4!!Print5!
set /a X=1,Y=1
:CB_MenuDisplay
(
%Mouse%
)
for /l %%a in (1,1,5) do set Err%%a=0

	If !X! Geq 11 If !X! Leq 25 (

		If !Y! Geq 4 If !Y! Leq 6 (
		If !M! Equ 1 Goto :CB_Play
			if not "!HL1!"=="1" %Disp%[0;5;30;47m!Print1!&set HL1=1
			Set Err1=1
		)
		If !Y! Geq 8 If !Y! Leq 10 (
		If !M! Equ 1 Goto :CB_Settings
			if not "!HL2!"=="1" %Disp%[0;5;30;47m!Print2!&set HL2=1
			Set Err2=1
		)
		If !Y! Geq 12 If !Y! Leq 14 (
		If !M! Equ 1 Goto :CB_Controls
			if not "!HL3!"=="1" %Disp%[0;5;30;47m!Print3!&set HL3=1
			Set Err3=1
		)
		If !Y! Geq 16 If !Y! Leq 18 (
		If !M! Equ 1 Goto :CB_Credits
			if not "!HL4!"=="1" %Disp%[0;5;30;47m!Print4!&set HL4=1
			Set Err4=1
		)
		If !Y! Geq 20 If !Y! Leq 22 (
		If !M! Equ 1 Goto :CB_Exit
			if not "!HL5!"=="1" %Disp%[0;5;30;47m!Print5!&set HL5=1
			Set Err5=1
		)
	)
	If !Hl1! Equ 1 If !Err1! Equ 0 (
	%Disp%[1;37;25;40m!Print1!
	Set HL1=0
	)
	If !Hl2! Equ 1 If !Err2! Equ 0 (
	%Disp%[1;37;25;40m!Print2!
	Set HL2=0
	)
	If !Hl3! Equ 1 If !Err3! Equ 0 (
	%Disp%[1;37;25;40m!Print3!
	Set HL3=0
	)
	If !Hl4! Equ 1 If !Err4! Equ 0 (
	%Disp%[1;37;25;40m!Print4!
	Set HL4=0
	)
	If !Hl5! Equ 1 If !Err5! Equ 0 (
	%Disp%[1;37;25;40m!Print5!
	Set HL5=0
	)

If "%KeyCode%"=="27" goto :CB_Exit
goto CB_MenuDisplay

:CB_Credits
call :CB_Shade
cls
echo.
echo CraftBacher Remake
echo (a.k.a. CreepyCraft) %Ver%
echo.
echo %__CB_Credits1%
echo.
echo %__CB_Credits2%
echo %__CB_Credits3%
echo %__CB_Credits4%
echo %__CB_Credits5%
echo.
echo %__CB_Credits6%
echo %__CB_Credits7%
echo %__CB_Credits8%
echo.[30;1H
set /p "=%__CB_CTC%"<nul
pause>nul
goto :CB_Menu

:CB_Controls
call :CB_Shade
cls
echo.
echo %__CB_Controls1%
echo.
echo %__CB_Controls2%
echo.
echo %__CB_Controls3%
echo %__CB_Controls4%
echo.
echo %__CB_Controls5%
echo.
echo %__CB_Controls6%
echo.
echo %__CB_Controls7%
echo.
echo %__CB_Controls8%
echo.[30;1H
set /p "=%__CB_CTC%"<nul
pause>nul
goto :CB_Menu

:CB_Settings
call :CB_Shade
cls
echo.
echo %__CB_Settings1%
echo %__CB_Settings2%
echo.
echo %__CB_Settings3%
echo %__CB_Settings4%
:CB_Settings2
%disp%[8;3HLow        High
%disp%[9;3H €----------€ 
set /a X=14-AccuracyBar
%disp%[9;%X%H^|
%Fn% Kbd
set cho=%errorlevel%
if %cho%==27 goto :CB_Menu
set /a cho-=48
If %cho% Geq 0 If %cho% Leq 9 set /a AccuracyBar=9-%cho%,Accuracy=(%cho%+1)*100
goto :CB_Settings2


:CB_Exit
Call :CB_Shade
cls
color 07
endlocal
endlocal
exit /b

:CB_Play
call :CB_Shade
cls
set /a Accuracy=(10-%AccuracyBar%)*100
set Select=
set A1=1
set /a A2=A1+1,A3=A1+2
set Exist1=0
for /f "delims==" %%a in ('set Exist') do set %%a=
for /l %%a in (%A1%,1,%A3%) do set "Name%%a=                     "&set "Date%%a=                     "
cd %Saves%
set /a C=0
for /f "tokens=*" %%a in ('dir /b') do (if exist "%%~a/world.cfg" (set /a C+=1&(for %%A in ("%%~a\world.cfg") do set "Date!C!=%%~tA                     ")&set Exist!C!=1&set "Name!C!=%%~a                     "&set "Name!C!a=%%~a"))
cd "%MDIR%"
set MBar1=…ÕÕÕÕÕÕª
set MBar2=∫ New  ∫
set MBar3=∫ Load ∫
set MBar4=∫Delete∫
set MBar5=∫ Back ∫
set MBar6=»ÕÕÕÕÕÕº
set Print04=[18;7H%MBar1%[19;7H%MBar2%[20;7H%MBar6%
set Print05=[18;22H%MBar1%[19;22H%MBar3%[20;22H%MBar6%
set Print06=[21;7H%MBar1%[22;7H%MBar4%[23;7H%MBar6%
set Print07=[21;22H%MBar1%[22;22H%MBar5%[23;22H%MBar6%
set Print08=[4;30H…ÕÕÕÕª[5;30H∫ Up ∫[6;30H»ÕÕÕÕº
set Print09=[7;30H…ÕÕÕÕª[8;30H∫Down∫[9;30H»ÕÕÕÕº
%disp%[1;12H%__CB_Start1%
%disp%[4;7H…ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕª!Print08!
%disp%[5;7H∫                     ∫
%disp%[6;7H∫                     ∫
%disp%[7;7H∫                     ∫!Print09!
%disp%[8;7H∫ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ∫
%disp%[9;7H∫                     ∫
%disp%[10;7H∫                     ∫
%disp%[11;7H∫                     ∫
%disp%[12;7H∫ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ∫
%disp%[13;7H∫                     ∫
%disp%[14;7H∫                     ∫
%disp%[15;7H∫                     ∫
%disp%[16;7H»ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕº
%disp%!Print04!
%disp%!Print05!
%disp%!Print06!
%disp%!Print07!
for /l %%a in (1,1,7) do set HL%%a=0
:CB_Play2
set /a A2=A1+1,A3=A1+2
set Print%A1%=[5;8H!Name%A1%:~0,21![6;8H                     [7;8H!Date%A1%:~0,21!
set Print%A2%=[9;8H!Name%A2%:~0,21![10;8H                     [11;8H!Date%A2%:~0,21!
set Print%A3%=[13;8H!Name%A3%:~0,21![14;8H                     [15;8H!Date%A3%:~0,21!
%disp%[1;37;25;40m!Print%A1%!
%disp%!Print%A2%!
%disp%!Print%A3%!
If !Select! GEQ !A1! If !Select! LEQ !A3! %Disp%[0;5;30;47m!Print%Select%!

set /a X=1,Y=1
:CB_PlayDisplay
(
%Mouse%
)
for /l %%a in (1,1,7) do set Err%%a=0
	If !X! Geq 7 If !X! Leq 29 (

		If !Y! Geq 5 If !Y! Leq 7 (
		If !M! Equ 1 If !Exist%A1%! Equ 1 Set Select=%A1%&%Disp%[0;5;30;47m!Print%A1%!&Set HL1=1
			if not "!HL1!"=="1" If not "%Select%"=="%A1%" %Disp%[0;5;30;40m!Print%A1%!&Set HL1=1
			Set Err1=1
		)
		If !Y! Geq 9 If !Y! Leq 11 (
		If !M! Equ 1 If !Exist%A2%! Equ 1 Set Select=%A2%&%Disp%[0;5;30;47m!Print%A2%!&Set HL2=1
			if not "!HL2!"=="1" If not "%Select%"=="%A2%" %Disp%[0;5;30;40m!Print%A2%!&Set HL2=1
			Set Err2=1
		)
		If !Y! Geq 13 If !Y! Leq 15 (
		If !M! Equ 1 If !Exist%A3%! Equ 1 Set Select=%A3%&%Disp%[0;5;30;47m!Print%A3%!&Set HL3=1
			if not "!HL3!"=="1" If not "%Select%"=="%A3%" %Disp%[0;5;30;40m!Print%A3%!&Set HL3=1
			Set Err3=1
		)
		
		If !X! Geq 8 If !X! Leq 14 If !Y! Geq 18 If !Y! Leq 20 (
		If !M! Equ 1 goto :CB_New
			if not "!HL4!"=="1" %Disp%[0;5;30;47m!Print04!&set HL4=1
			set Err4=1
		)
		If !X! Geq 22 If !X! Leq 29 If !Y! Geq 18 If !Y! Leq 20 (
		If !M! Equ 1 If defined Select goto :CB_Load
			if not "!HL5!"=="1" %Disp%[0;5;30;47m!Print05!&set HL5=1
			set Err5=1
		)
		If !X! Geq 8 If !X! Leq 14 If !Y! Geq 21 If !Y! Leq 23 (
		If !M! Equ 1 If defined Select goto :CB_Delete
			if not "!HL6!"=="1" %Disp%[0;5;30;47m!Print06!&set HL6=1
			set Err6=1
		)
		If !X! Geq 22 If !X! Leq 29 If !Y! Geq 21 If !Y! Leq 23 (
		If !M! Equ 1 goto :CB_Menu
			if not "!HL7!"=="1" %Disp%[0;5;30;47m!Print07!&set HL7=1
			set Err7=1
		)
	)
	If !X! Geq 30 If !X! Leq 36 (
		If !Y! Geq 4 If !Y! Leq 6 (
		If !M! Equ 1 If not !A1! Leq 1 set /a A1-=1&goto :CB_Play2
		)
		If !Y! Geq 7 If !Y! Leq 9 (
		If !M! Equ 1 If not !A3! Geq !C! set /a A1+=1&goto :CB_Play2
		)
	)
	If !Hl1! Equ 1 If !Err1! Equ 0 If !Select! Neq %A1% (
	%Disp%[1;37;25;40m!Print%A1%!
	Set HL1=0
	)
	If !Hl2! Equ 1 If !Err2! Equ 0 If !Select! Neq %A2% (
	%Disp%[1;37;25;40m!Print%A2%!
	Set HL2=0
	)
	If !Hl3! Equ 1 If !Err3! Equ 0 If !Select! Neq %A3% (
	%Disp%[1;37;25;40m!Print%A3%!
	Set HL3=0
	)
	If !Hl4! Equ 1 If !Err4! Equ 0 (
	%Disp%[1;37;25;40m!Print04!
	Set HL4=0
	)
	If !Hl5! Equ 1 If !Err5! Equ 0 (
	%Disp%[1;37;25;40m!Print05!
	Set HL5=0
	)
	If !Hl6! Equ 1 If !Err6! Equ 0 (
	%Disp%[1;37;25;40m!Print06!
	Set HL6=0
	)
	If !Hl7! Equ 1 If !Err7! Equ 0 (
	%Disp%[1;37;25;40m!Print07!
	Set HL7=0
	)

If "%KeyCode%"=="27" goto :CB_Menu
if "%KeyCode%"=="13" If defined Select goto :CB_Load
goto CB_PlayDisplay

:CB_New
call :CB_Shade
cls
%disp%[5;4H%__CB_Start2%
%disp%[6;4H…ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕª
%disp%[7;4H∫                           ∫
%disp%[8;4H»ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕº
set Print1=[10;4H…ÕÕÕÕª[11;4H∫Back∫[12;4H»ÕÕÕÕº
set Print2=[10;24H…ÕÕÕÕÕÕª[11;24H∫Create∫[12;24H»ÕÕÕÕÕÕº
%disp%[14;2H%__CB_Start3%
%disp%%Print1%
%disp%%Print2%
set NewName=
set HL1=0
set HL2=0
set /a Accuracy=(10-%AccuracyBar%)*10
set /a X=1,Y=1
:CB_NewDisplay
(
%Mouse%
)
set Err1=0
set Err2=0

if defined KeyCode (
if "%KeyCode%"=="8" (if defined NewName set "NewName=!NewName:~0,-1!"&<nul set /p "=[1;37;25;40m[7;5H!NewName! ") else (
if "%KeyCode%"=="32" (set "NewName=!NewName! "&<nul set /p "=[1;37;25;40m[7;5H!NewName! ") else (
if "%KeyCode%"=="13" (if defined NewName goto :CB_NewCreate) else (
if "%KeyCode%"=="27" (goto :CB_Play) else (
for /f "delims=][/\?<>:;'}{}" %%a in ("%KeyChar%") do set "NewName=!NewName!%%a"&<nul set /p "=[1;37;25;40m[7;5H!NewName!"
)))))
	If !X! Geq 4 If !X! Leq 9 (
	If !Y! Geq 10 If !Y! Leq 12 (
	If !M! Equ 1 goto :CB_Play
			if not "!HL1!"=="1" %Disp%[0;5;30;47m!Print1!&Set HL1=1
			Set Err1=1
	))
	If !X! Geq 24 If !X! Leq 30 (
	If !Y! Geq 10 If !Y! Leq 12 (
	If !M! Equ 1 if defined NewName goto :CB_NewCreate
			if not "!HL2!"=="1" %Disp%[0;5;30;47m!Print2!&Set HL2=1
			Set Err2=1
	))
	If !Err1! Equ 0 If !Hl1! Neq 0 (
	%Disp%[1;37;25;40m!Print1!
	Set HL1=0
	)
	If !Err2! Equ 0 If !Hl2! Neq 0 (
	%Disp%[1;37;25;40m!Print2!
	Set HL2=0
	)
goto CB_NewDisplay

:CB_Delete
%disp%[1;37;25;40m[17;9HAre you sure? (Y/N) 
%Fn% Kbd
if %errorlevel%==121 rd "%CD%/%Saves%/!Name%Select%a!/" /S /Q 2>nul&goto :CB_Play
if %errorlevel%==89 rd "%CD%/%Saves%/!Name%Select%a!/" /S /Q 2>nul&goto :CB_Play
if %errorlevel%==110 goto :CB_Play
if %errorlevel%==78 goto :CB_Play
goto CB_Delete

:CB_Load
if not exist "%Saves%/!Name%Select%a!/world.cfg" goto :CB_PlayDisplay
if not exist "%Saves%/!Name%Select%a!/config.cfg" goto :CB_PlayDisplay
setlocal
cd "%Saves%/!Name%Select%a!" || (endlocal&goto :CB_PlayDisplay)
set /p X=<world.cfg
if not "%X%"=="CreepyCraft Save File" %disp%[1;37;25;40m[25;8HWorld was not saved.[26;6HYou need to delete it :(&endlocal&goto :CB_PlayDisplay

:CB_Load2
call :CB_Shade
cls
%disp%[14;6H%__CB_Start6%
set Name=!Name%Select%a!
set SY=-1
for /f "skip=1 delims=" %%Y in (world.cfg) do (
	set /a SY+=2,SX=-2
	for %%X in (%%~Y) do (
		set /a SX+=3
		set X!SX!Y!SY!Type=%%~X
))
for /f "skip=1 delims=" %%# in (config.cfg) do set "%%~#"
set Y1=!Y!
set X1=!X!

Call :CB_ModelLoad

set /a Xmin=!X1!-15
set /a YMin=!Y1!-10
set OldXMin=
set OldYMin=

for /l %%X in (1,3,%XLimit%) do (
for /l %%Y in (1,2,%YLimit%) do (
set /a Y2=%%Y+1
Call Set X%%XY%%Y=%%Model!X%%XY%%YType!a%%
Call Set X%%XY!Y2!=%%Model!X%%XY%%YType!b%%
)
)
set ActiveItem=1
set ActiveToolbarItem=1
set Pickaxe=0
call :CB_PickaxeSwitch

cd "%MDIR%"
goto :CB_Game

:CB_Save
call :CB_Shade
cls
%disp%[14;5H%__CB_Start7%
>"%Saves%/%Name%/world.cfg" (
echo CreepyCraft Save File
set /a SY=YLimit-1,SX=Xlimit
for /l %%Y in (1,2,!SY!) do (
	set "Line0=!X1Y%%YType!;!X4Y%%YType!;!X7Y%%YType!;!X10Y%%YType!;!X13Y%%YType!;!X16Y%%YType!;!X19Y%%YType!;!X22Y%%YType!;!X25Y%%YType!;!X28Y%%YType!;!X31Y%%YType!;!X34Y%%YType!;!X37Y%%YType!;!X40Y%%YType!;!X43Y%%YType!;!X46Y%%YType!;!X49Y%%YType!;!X52Y%%YType!;!X55Y%%YType!;!X58Y%%YType!;!X61Y%%YType!;!X64Y%%YType!;!X67Y%%YType!;!X70Y%%YType!;!X73Y%%YType!;!X76Y%%YType!;!X79Y%%YType!;!X82Y%%YType!;!X85Y%%YType!;!X88Y%%YType!;!X91Y%%YType!;!X94Y%%YType!;!X97Y%%YType!;!X100Y%%YType!;!X103Y%%YType!;!X106Y%%YType!;!X109Y%%YType!;!X112Y%%YType!;!X115Y%%YType!;!X118Y%%YType!;!X121Y%%YType!;!X124Y%%YType!;!X127Y%%YType!;!X130Y%%YType!;!X133Y%%YType!;!X136Y%%YType!;!X139Y%%YType!;!X142Y%%YType!;!X145Y%%YType!;!X148Y%%YType!"
	echo !Line0!
)
)
>"%Saves%/%Name%/config.cfg" (
echo CreepyCraft Save File
echo X=!X1!
echo Y=!Y1!
for /l %%# in (1,1,8) do echo Eq%%#=!Eq%%#!
echo XSize=!XSize!
echo YSize=!YSize!
for /l %%# in (6,1,8) do echo PickDur%%#=!PickDur%%#!
)
goto :EOF

:: Stara metoda zapisywania ::
set /a SY=YLimit-1,SX=Xlimit
for /l %%Y in (1,2,!SY!) do (
	set Line0=
	for /l %%X in (1,3,!SX!) do set "Line0=!Line0!!X%%XY%%YType!;"
	set "Line0=!Line0:~0,-1!
	echo !Line0!
))


:CB_ModelLoad
set Model0a=[0;0;37;40m   
set Model0b=[0;0;37;40m   
set Model1a=[0;0;33;42m ‹ 
set Model1b=[0;0;33;42m ﬂ 
set Model2a=[0;5;37;40m   
set Model2b=[0;5;37;40m   
set Model3a=[0;5;30;40m 
set Model3b=[0;5;30;40m  
set Model4a=[0;5;37;40m 
set Model4b=[0;5;37;40m 
set Model5a=[0;5;30;43m±±±
set Model5b=[0;0;30;43m±±±
set Model6a=[0;0;33;40m⁄¬ø
set Model6b=[0;0;33;40m ≥ 
set Model7a=[0;0;37;40m⁄¬ø
set Model7b=[0;0;33;40m ≥ 
set Model8a=[0;1;37;40m⁄¬ø
set Model8b=[0;0;33;40m ≥ 
set ModelMorea=[0;5;30;47m ‹‹‹ 
set ModelMoreb=[0;5;30;47m  ﬂ  
set /a XLimit=XSize *3-2
set /a YLimit=YSize *2
set /a XWMax=XLimit-15
set /a YWMax=YLimit-11

set PickDurMax6=15
set PickDurMax7=33
set PickDurMax8=62
goto :EOF

:CB_MapReload
for /l %%Y in (!YMin!,1,!YMax!) do (
set Line%%Y=
for /l %%X in (!XMin!,3,!XMax!) do (
	set Line%%Y=!Line%%Y!!X%%XY%%Y!
))
if /i "%~1"=="Display" (
%disp%[1;1H
for /l %%# in (!YMin!,1,!YMax!) do (
	%disp%[0;37;40m≥!Line%%#!

)
%disp%[0;37;40m[!DY1!;!DX1!H__[!DY2!;!DX1!H⁄¡ø
)
goto :EOF

:CB_NewCreate
set Name=%NewName%
if /i exist "%Saves%/%Name%" %disp%[16;5H%__CB_Start4%^^!&goto :CB_NewDisplay
md "%Saves%/%Name%"
echo World already not saved.>"%Saves%/%Name%/world.cfg"
echo World already not saved.>"%Saves%/%Name%/config.cfg"
call :CB_Shade
cls
%disp%[14;5H%__CB_Start5%
set /a Accuracy=(10-%AccuracyBar%)*100
setlocal

set XSize=50
set YSize=50

:: Nie modyfikuj tego!!
call :CB_ModelLoad

for /l %%X in (1,3,%XLimit%) do (
for /l %%Y in (1,2,%YLimit%) do (
set /a Rand=!random! %% 25
if !Rand! Geq 0 If !Rand! Leq 13 set X%%XY%%YType=0
if !Rand! Geq 14 If !Rand! Leq 18 set X%%XY%%YType=1
if !Rand! Geq 19 If !Rand! Leq 21 set X%%XY%%YType=2
if !Rand! Geq 22 If !Rand! Leq 23 set X%%XY%%YType=3
if !Rand! Geq 24 If !Rand! Leq 24 set X%%XY%%YType=4
)
)
for /l %%X in (1,3,%XLimit%) do (
for /l %%Y in (1,2,%YLimit%) do (
set /a Y2=%%Y+1
Call Set X%%XY%%Y=%%Model!X%%XY%%YType!a%%
Call Set X%%XY!Y2!=%%Model!X%%XY%%YType!b%%
)
)
set /a XMin=(XSize+1)/2*3-17
set /a YMin=(YSize+1)/2*2-11
set /a X1=(XSize+1)/2*3-2
set /a Y1=(YSize+1)/2*2-1
for /l %%a in (1,1,8) do set Eq%%a=0
for /l %%# in (6,1,8) do set PickDur%%#=!PickDurMax%%#!
set ActiveItem=1
set ActiveToolbarItem=1
set PlayerPower=0
set Pickaxe=0
set PickDur=N 
set PickDurMax= A
set OldXMin=
set OldYMin=
:CB_Game
call :CB_Shade
cls
%disp%[1;1H⁄ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒø
%disp%[2;1H≥                                 ≥
%disp%[3;1H≥                                 ≥
%disp%[4;1H≥                                 ≥
%disp%[5;1H≥                                 ≥
%disp%[6;1H≥                                 ≥
%disp%[7;1H≥                                 ≥
%disp%[8;1H≥                                 ≥
%disp%[9;1H≥                                 ≥
%disp%[10;1H≥                                 ≥
%disp%[11;1H≥                                 ≥
%disp%[12;1H≥                                 ≥
%disp%[13;1H≥                                 ≥
%disp%[14;1H≥                                 ≥
%disp%[15;1H≥                                 ≥
%disp%[16;1H≥                                 ≥
%disp%[17;1H≥                                 ≥
%disp%[18;1H≥                                 ≥
%disp%[19;1H≥                                 ≥
%disp%[20;1H≥                                 ≥
%disp%[21;1H≥                                 ≥
%disp%[22;1H≥                                 ≥
%disp%[23;1H≥                                 ≥
%disp%[24;1H¿ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒŸ
call :CB_ToolBar
:CB_Game2
set /a Y2=Y1+1
set /a DX1=16+1,DY1=11+1,DY2=12+1
if %XMin% Lss 1 set /a XMin=1,DX1=%X1%+1
if %YMin% Lss 1 set /a YMin=1,DY1=%Y1%+1,DY2=%Y2%+1
if %X1% Leq 16 set /a XMin=1,DX1=%X1%+1
if %Y1% Leq 11 set /a YMin=1,DY1=%Y1%+1,DY2=%Y2%+1
set /a XMax=XMin+30,YMax=YMin+21
if %XMax% Gtr %XLimit% set /a XMax=%XLimit%&set /a XMin=!XMax!-30,DX1=32-(%XLimit%-%X1%)
if %YMax% Gtr %YLimit% set /a YMax=%YLimit%&set /a YMin=!YMax!-21,DY1=23-(%YLimit%-%Y1%)&set /a DY2=DY1+1
if %X1% Geq %XWMax% set /a XMax=%XLimit%&set /a XMin=!XMax!-30,DX1=32-(%XLimit%-%X1%)
if %Y1% Geq %YWMax% set /a YMax=%YLimit%&set /a YMin=!YMax!-21,DY1=23-(%YLimit%-%Y1%)&set /a DY2=DY1+1

If not defined OldXMin call :CB_MapReload Display&set /a OldXMin=XMin,OldYMin=YMin&goto :CB_GameInput
set /a NY1=YMax-1
If %YMin% Gtr %OldYMin% set Line%YMax%=&set Line%NY1%=&(for /l %%X in (!XMin!,3,!XMax!) do set Line%NY1%=!Line%NY1%!!X%%XY%NY1%!&set Line%YMax%=!Line%YMax%!!X%%XY%YMax%!)
set /a NY1=YMin+1
If %YMin% Lss %OldYMin% set Line%YMin%=&set Line%NY1%=&(for /l %%X in (!XMin!,3,!XMax!) do set Line%YMin%=!Line%YMin%!!X%%XY%YMin%!&set Line%NY1%=!Line%NY1%!!X%%XY%NY1%!)
If %XMin% Gtr %OldXMin% for /l %%Y in (!YMin!,1,!YMax!) do set Line%%Y=!Line%%Y:~15!!X%XMax%Y%%Y!
If %XMin% Lss %OldXMin% for /l %%Y in (!YMin!,1,!YMax!) do set Line%%Y=!X%XMin%Y%%Y!!Line%%Y:~0,-15!

%disp%[1;1H
for /l %%# in (!YMin!,1,!YMax!) do (
	%disp%[0;37;40m≥!Line%%#!
)
%disp%[0;37;40m[!DY1!;!DX1!H__[!DY2!;!DX1!H⁄¡ø
set /a OldXMin=XMin,OldYMin=YMin
goto :CB_GameInput


:CB_GameInput
(
%Mouse%
)
if defined KeyCode (
if "%KeyCode%"=="27" goto :CB_Pause
for /f "delims=][/\?<>:;'}{}" %%a in ("%KeyChar%") do (
	if /i "%%a"=="P" goto :CB_Pause
	if /i "%%a"=="W" set /a NY1=Y1-2,NYMin=YMin-2,NX1=X1,NXMin=XMin&goto :CB_GameDo
	if /i "%%a"=="A" set /a NX1=X1-3,NXMin=XMin-3,NY1=Y1,NYMin=YMin&goto :CB_GameDo
	if /i "%%a"=="S" set /a NY1=Y1+2,NYMin=YMin+2,NX1=X1,NXMin=XMin&goto :CB_GameDo
	if /i "%%a"=="D" set /a NX1=X1+3,NXMin=XMin+3,NY1=Y1,NYMin=YMin&goto :CB_GameDo
	if /i "%%a"=="E" goto :CB_Inventory
	if "%%a"=="1" set /a ActiveItem=1,ActiveToolbarItem=1&call :CB_ToolBar
	if "%%a"=="2" set /a ActiveItem=2,ActiveToolbarItem=2&call :CB_ToolBar
	if "%%a"=="3" set /a ActiveItem=3,ActiveToolbarItem=3&call :CB_ToolBar
	if "%%a"=="4" set /a ActiveItem=4,ActiveToolbarItem=4&call :CB_ToolBar
	if "%%a"=="5" set /a ActiveItem=5,ActiveToolbarItem=5&call :CB_ToolBar
))
If not !M! Equ 0 If !X! Geq 2 If !X! Leq 34 (
	If !Y! Geq 2 If !Y! Leq 23 (
		If !M! Equ 2 goto :CB_GamePlace
		If !M! Equ 1 goto :CB_GameBreak
	)
	If !Y! Geq 26 If !Y! Leq 28 (
		If !X! Gtr 1 If !X! Lss 5 set /a ActiveItem=1,ActiveToolbarItem=1&call :CB_ToolBar
		If !X! Gtr 5 If !X! Lss 9 set /a ActiveItem=2,ActiveToolbarItem=2&call :CB_ToolBar
		If !X! Gtr 9 If !X! Lss 13 set /a ActiveItem=3,ActiveToolbarItem=3&call :CB_ToolBar
		If !X! Gtr 13 If !X! Lss 17 set /a ActiveItem=4,ActiveToolbarItem=4&call :CB_ToolBar
		If !X! Gtr 17 If !X! Lss 21 set /a ActiveItem=5,ActiveToolbarItem=5&call :CB_ToolBar
		If !X! Gtr 23 If !X! Lss 29 Call :CB_PickaxeSwitch&call :CB_Toolbar
		If !X! Gtr 29 If !X! Lss 35 goto :CB_Inventory
	)
)
goto :CB_GameInput

:CB_GameDo
if "!X%NX1%Y%NY1%Type!"=="0" set /a Xmin=NXmin,YMin=NYMin,X1=NX1,Y1=NY1&goto :CB_Game2
goto :CB_GameInput

:CB_GameBreak
	set /a DX=(X+1)/3*3+XMin-3,DY=Y/2*2+YMin-2
	set /a NX=!DX!-Xmin+2,NY=!DY!-Ymin+3,NY2=!DY!-YMin+2,DY2=!DY!+1
	set /a RX1=!X1!-6,RX2=!X1!+8,RY1=!Y1!-4,RY2=!Y1!+5
	set /a CX1=((X+1)/3-1)*15,CX2=((X+1)/3)*15
	if %DX% Lss %RX1% goto :CB_GameInput
	if %DX% Gtr %RX2% goto :CB_GameInput
	if %DY% Lss %RY1% goto :CB_GameInput
	if %DY% Gtr %RY2% goto :CB_GameInput
set Break=0
set Type=!X%DX%Y%DY%Type!
If %Type% Equ 1 set Break=1
if %Type% Equ 5 set Break=1
if %PlayerPower% Geq 1 (
	if %PlayerPower% Geq 2 (
		if %Type% Equ 4 set Break=1
	)
	if %Type% Equ 2 set Break=1
	if %Type% Equ 3 set Break=1
)
if %Break% Equ 1 (
	set X%DX%Y%DY%=!Model0a!&set X%DX%Y%DY2%=!Model0b!
	set X%DX%Y%DY%Type=0
	%disp%[%NY%;%NX%H!Model0a!
	%Fn% Sleep 50
	%disp%[%NY2%;%NX%H!Model0b!
	%Fn% Sleep 50
	set "Line%DY%=!Line%DY%:~0,%CX1%!!Model0a!!Line%DY%:~%CX2%!"
	set "Line%DY2%=!Line%DY2%:~0,%CX1%!!Model0b!!Line%DY2%:~%CX2%!"
	set /a Eq%Type%+=1
	if !Eq%Type%! Gtr 999 set Eq%Type%=999
	if not %Pickaxe% Equ 0 (set /a PickDur-=1&set /a PickDur%Pickaxe%-=1&if !PickDur! Leq 0 call :CB_PickaxeBreak)
	call :CB_ToolBar
)
goto :CB_GameInput

:CB_GamePlace
If !Eq%ActiveItem%! Lss 1 goto :CB_GameInput
	set /a DX=(X+1)/3*3+XMin-3,DY=Y/2*2+YMin-2
	set /a NX=!DX!-Xmin+2,NY=!DY!-Ymin+3,NY2=!DY!-YMin+2,DY2=!DY!+1
	set /a RX1=!X1!-6,RX2=!X1!+8,RY1=!Y1!-4,RY2=!Y1!+5
	set /a CX1=((X+1)/3-1)*15,CX2=((X+1)/3)*15
	if %DX% Lss %RX1% goto :CB_GameInput
	if %DX% Gtr %RX2% goto :CB_GameInput
	if %DY% Lss %RY1% goto :CB_GameInput
	if %DY% Gtr %RY2% goto :CB_GameInput
if !X%DX%Y%DY%Type! Equ 0 (
	set X%DX%Y%DY%=!Model%ActiveItem%a!&set X%DX%Y%DY2%=!Model%ActiveItem%b!
	set X%DX%Y%DY%Type=%ActiveItem%
	%disp%[%NY2%;%NX%H!Model%ActiveItem%a!
	%Fn% Sleep 50
	%disp%[%NY%;%NX%H!Model%ActiveItem%b!
	%Fn% Sleep 50
	set "Line%DY%=!Line%DY%:~0,%CX1%!!Model%ActiveItem%a!!Line%DY%:~%CX2%!"
	set "Line%DY2%=!Line%DY2%:~0,%CX1%!!Model%ActiveItem%b!!Line%DY2%:~%CX2%!"
	set /a Eq%ActiveItem%-=1
	call :CB_ToolBar
)
goto :CB_GameInput

:CB_PickaxeBreak
set /a Eq%Pickaxe%-=1,PickDur%Pickaxe%=!PickDurMax%Pickaxe%!,Pickaxe=0
call :CB_PickaxeSwitch
call :CB_Toolbar
goto :EOF

:CB_PickaxeSwitch
if not "%~1"=="" set Pickaxe=%~1&set PickDur=!PickDur%~1!&set PickDurMax=!PickDurMax%~1!&goto :EOF

if !Pickaxe! Lss 6 If !Eq6! Gtr 0 (
	set Pickaxe=6
	set PickDur=!PickDur6!
	set PickDurMax=!PickDurMax6!
	set PlayerPower=1
	goto :EOF
)
if !Pickaxe! Lss 7 If !Eq7! Gtr 0 (
	set Pickaxe=7
	set PickDur=!PickDur7!
	set PickDurMax=!PickDurMax7!
	set PlayerPower=2
	goto :EOF
)
if !Pickaxe! Lss 8 If !Eq8! Gtr 0 (
	set Pickaxe=8
	set PickDur=!PickDur8!
	set PickDurMax=!PickDurMax8!
	set PlayerPower=3
	goto :EOF
)
	set Pickaxe=0
	set PickDur=N 
	set PickDurMax= A
	set PlayerPower=0
	goto :EOF

:CB_Inventory
%disp%[0;1;37;40m[3;3H…ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕª
%disp%[4;3H∫                             ∫
%disp%[5;3H∫                             ∫
%disp%[6;3H∫                             ∫
%disp%[7;3H∫                             ∫
%disp%[8;3H∫                             ∫
%disp%[9;3H∫                             ∫
%disp%[10;3H∫                             ∫
%disp%[11;3H∫                             ∫
%disp%[12;3H∫                             ∫
%disp%[13;3H∫                             ∫
%disp%[14;3H∫                             ∫
%disp%[15;3H∫                             ∫
%disp%[16;3H∫                             ∫
%disp%[17;3H∫                             ∫
%disp%[18;3H∫                             ∫
%disp%[19;3H»ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕº
set Print1=[20;3H…ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕª[21;3H∫            Back             ∫[22;3H»ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕº
%disp%!Print1!

set Craft1=
set Craft2=
set Craft3=
set Craft4=
:: Crafting 1
If !Eq1! Geq 1 Set Craft1=1
:: Crafting 2
If !Eq5! Geq 5 Set Craft2=1
:: Crafting 3
If !Eq5! Geq 3 If !Eq2! Geq 2 Set Craft3=1
:: Crafting 4
If !Eq5! Geq 3 If !Eq4! Geq 2 Set Craft4=1
set /a a1=4,a2=5,a3=6

	if !Craft1! Equ 1 (%disp%[%a1%;4H!Model1a![0;37;40m   !Model5a![%a2%;4H!Model1b![0;37;40m = !Model5b![%a3%;4H[0;37;40m 1     4 &set /a Craft1a1=a1,Craft1a2=a2,Craft1a3=a3,a1+=4,a2+=4,a3+=4)
	if !Craft2! Equ 1 %disp%[%a1%;4H!Model5a![0;37;40m   !Model6a![%a2%;4H!Model5b![0;37;40m = !Model6b![%a3%;4H[0;37;40m 5     1 &set /a Craft2a1=a1,Craft2a2=a2,Craft2a3=a3,a1+=4,a2+=4,a3+=4
	if !Craft3! Equ 1 %disp%[%a1%;4H!Model5a![0;37;40m   !Model2a![0;37;40m   !Model7a![%a2%;4H!Model5b![0;37;40m + !Model2b![0;37;40m = !Model7b![%a3%;4H[0;37;40m 5     2     1 &set /a Craft3a1=a1,Craft3a2=a2,Craft3a3=a3,a1+=4,a2+=4,a3+=4
	if !Craft4! Equ 1 %disp%[%a1%;4H!Model5a![0;37;40m   !Model4a![0;37;40m   !Model8a![%a2%;4H!Model5b![0;37;40m   !Model4b![0;37;40m = !Model8b![%a3%;4H[0;37;40m 5     2     1 &set /a Craft4a1=a1,Craft4a2=a2,Craft4a3=a3,a1+=4,a2+=4,a3+=4

%disp%[0;1;37;40m
set /a X=1,Y=1
for /l %%a in (1,1,5) do set Hl%%a=0
:CB_InventoryInput
for /l %%a in (1,1,5) do set Err%%a=0
(
%Mouse%
)
if !X! Geq 4 if !X! Leq 30 (
	if defined Craft1 if !Y! Geq !Craft1a1! if !Y! Leq !Craft1a3! (
		if !M! Equ 1 set /a Eq1-=1,Eq5+=4&call :CB_Toolbar&goto :CB_Inventory
		if not "%Hl1%"=="1" %disp%[0;1;37;40m[!Craft1a1!;28H^<[!Craft1a2!;28H^<--[!Craft1a3!;28H^<&set Hl1=1
		set Err1=1
	)
	if defined Craft2 if !Y! Geq !Craft2a1! if !Y! Leq !Craft2a3! (
		if !M! Equ 1 set /a Eq5-=5,Eq6+=1&set /a PlayerPower=1&call :CB_PickaxeSwitch 6&call :CB_Toolbar&goto :CB_Inventory
		if not "%Hl2%"=="1" %disp%[0;1;37;40m[!Craft2a1!;28H^<[!Craft2a2!;28H^<--[!Craft2a3!;28H^<&set Hl2=1
		set Err2=1
	)
	if defined Craft3 if !Y! Geq !Craft3a1! if !Y! Leq !Craft3a3! (
		if !M! Equ 1 set /a Eq5-=3,Eq2-=2,Eq7+=1&set /a PlayerPower=2&call :CB_PickaxeSwitch 7&call :CB_Toolbar&goto :CB_Inventory
		if not "%Hl3%"=="1" %disp%[0;1;37;40m[!Craft3a1!;28H^<[!Craft3a2!;28H^<--[!Craft3a3!;28H^<&set Hl3=1
		set Err3=1
	)
	if defined Craft4 if !Y! Geq !Craft4a1! if !Y! Leq !Craft4a3! (
		if !M! Equ 1 set /a Eq5-=3,Eq4-=2,Eq8+=1&set /a PlayerPower=3&call :CB_PickaxeSwitch 8&call :CB_Toolbar&goto :CB_Inventory
		if not "%Hl4%"=="1" %disp%[0;1;37;40m[!Craft4a1!;28H^<[!Craft4a2!;28H^<--[!Craft4a3!;28H^<&set Hl4=1
		set Err4=1
	)
	if !Y! Geq 20 if !Y! Leq 22 (
		if !M! Equ 1 goto :CB_Game2
		if not "%Hl5%"=="1" %disp%[0;5;30;47m!Print1!&set Hl5=1
		set Err5=1
	)
)
	If !Y! Geq 26 If !Y! Leq 28 If !X! Gtr 29 If !X! Lss 35 If !M! Equ 1 goto :CB_Game2
	
	If !Err1! Equ 0 If !Hl1! Neq 0 (
	%Disp%[0;1;37;40m[!Craft1a1!;28H   [!Craft1a2!;28H   [!Craft1a3!;28H   
	Set HL1=0
	)
	If !Err2! Equ 0 If !Hl2! Neq 0 (
	%Disp%[0;1;37;40m[!Craft2a1!;28H   [!Craft2a2!;28H   [!Craft2a3!;28H   
	Set HL2=0
	)
	If !Err3! Equ 0 If !Hl3! Neq 0 (
	%Disp%[0;1;37;40m[!Craft3a1!;28H   [!Craft3a2!;28H   [!Craft3a3!;28H   
	Set HL3=0
	)
	If !Err4! Equ 0 If !Hl4! Neq 0 (
	%Disp%[0;1;37;40m[!Craft4a1!;28H   [!Craft4a2!;28H   [!Craft4a3!;28H   
	Set HL4=0
	)
	If !Err5! Equ 0 If !Hl5! Neq 0 (
	%Disp%[0;1;37;40m!Print1!
	Set HL5=0
	)

if "%KeyCode%"=="27" goto :CB_Game2
goto :CB_InventoryInput

:CB_ToolBar
%disp%[0;1;37;40m[25;1HÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕ
%disp%[26;2H!Model1a![26;6H!Model2a![26;10H!Model3a![26;14H!Model4a![26;18H!Model5a!
%disp%[27;2H!Model1b![27;6H!Model2b![27;10H!Model3b![27;14H!Model4b![27;18H!Model5b!
%disp%[0;1;37;40m[28;2H!Eq1!  [28;6H!Eq2!  [28;10H!Eq3!  [28;14H!Eq4!  [28;18H!Eq5!  
set /a ActiveItemBar=%ActiveToolbarItem%*4-2
%disp%[29;1                             
%disp%[29;%ActiveItemBar%H[0;1;37;40mﬂﬂﬂ
%disp%[26;25H!Model%Pickaxe%a![27;25H!Model%Pickaxe%b![28;24H%PickDur%/%PickDurMax% 
%disp%[26;30H!ModelMorea![27;30H!ModelMoreb![0;1;37;40m[28;30HMore^^!
goto :EOF

:CB_Pause
call :CB_Shade
cls
set "Print1=[4;13H%MBar1%[5;13H∫ Back ∫[6;13H%MBar6%"
set "Print2=[8;13H%MBar1%[9;13H∫ Save ∫[10;13H∫  'n  ∫[11;13H∫ Exit ∫[12;13H%MBar6%"
%disp%%Print1%
%disp%%Print2%
set HL1=0
set HL2=0
set /a X=1,Y=1
:CB_PauseInput
(
%Mouse%
)
set Err1=0
set Err2=0

	If !X! Geq 13 If !X! Leq 20 (

		If !Y! Geq 4 If !Y! Leq 6 (
		If !M! Equ 1 Goto :CB_Game
			if not "!HL1!"=="1" %Disp%[0;5;30;47m!Print1!&Set HL1=1
			Set Err1=1
		)
		If !Y! Geq 8 If !Y! Leq 12 (
		If !M! Equ 1 Call :CB_Save&endlocal&Goto :CB_Play
			if not "!HL2!"=="1" %Disp%[0;5;30;47m!Print2!&Set HL2=1
			Set Err2=1
		)
	)
	If !Err1! Equ 0 If !Hl1! Neq 0 (
	%Disp%[1;37;25;40m!Print1!
	Set HL1=0
	)
	If !Err2! Equ 0 If !Hl2! Neq 0 (
	%Disp%[1;37;25;40m!Print2!
	Set HL2=0
	)

If "%KeyCode%"=="27" goto :CB_Game
goto :CB_PauseInput


:CB_Shade
for %%a in (0f 07 08) do color %%a&%Fn% Sleep 25
cls
color 0F
goto :EOF

// Macro \\
@1:Set M=0&Set KeyCode=&Set KeyChar=
@1:For /F "Tokens=1-4" %%W in ('!Fn! Inputhit !Accuracy!') Do (
@1:If %%W Equ KBD (
@1: Set "KeyCode=%%X"
@1: Set "KeyChar=%%Y"
@1:)
@1:
@1:If %%W Equ MOUSE (
@1: Set/a X=%%Y+1,Y=%%X+1,M=%%Z
@1:))
\\ End Macro //
:: Koniec program CreepyCraft ::


:: Poczπtek program CraftBatcher ::
:CB2_Init
set Program=CraftBatcher by Suchar
%Macro_Loading:@=!%
cd /d "%MDIR%"
setlocal enabledelayedexpansion
title CraftBatcher - Comeback
Color F0
if not exist CraftBatcher_Files goto CB2_brak
cd CraftBatcher_Files

:: Domyslne zmienne, nie zmieniac
set o=1
set o1=Move
set o2=Mine
set o3=Build
set o4=Craft

set dmg_punch=1
set dmg_knock=2
set dmg_kilof=2

set i=1
set i1=0
set i2=0
set i3=0
set i4=0
Set i5=0
set i6=0
set i7=0
set i8=0
Set i9=0
set i10=0
set i11=0

set h1=
set h2=
set h3=
set h4=
set h5=
set h6=
set hp1=
set hp2=
set hp3=
set hp4=
set hp5=
set hp6=

set i10=0
set ii1=0
set ii2=0
set ii3=0
set ii4=0
set ii5=0
set ii6=0
set ii7=0
set ii8=0
set ii9=0
set ii10=0
set ii11=0

set itcr=0
set i6=0
Set p=0
set po=0
set opc=0
Set nic=0
Set skin=@
set c=0

Set zad1=0
set zad2=0
set zad3=0

set ktr=0
set ver=0.6
set moon=0

set ld1=0
set lm1=0
set ln1=0
set lb1=0

:: Zapis gry
if not exist zapisgry.bat goto CB2_brak
call zapisgry.bat
set/a la=%ld1%+%lm1%+%ln1%+%lb1%
if not exist color.bat goto CB2_brak
call color.bat
if not exist colorskin.bat goto CB2_brak
call colorskin.bat

:: Bonusowy suchar: Zmienilem suchar, bo MOGE
:: Zajebiste intro w chuj
:CB2_intro
cls
echo …ÕÕÕÕÕÕÕÕÕª
echo ∫≤≤≤≤≤≤≤≤≤∫
echo ∫≤≤≤≤≤≤≤≤≤∫
echo ∫€˛ €∫
echo ∫ €˛˛˛˛ ∫
echo ∫˛      €∫
echo ∫   ˛  €€∫
echo ∫€    ∫
echo »ÕÕÕÕÕÕÕÕÕº
echo.
echo Poznaj swiat pelen rud...
ping -n 2 localhost>nul&batbox /k_&if !errorlevel! NEQ 0 goto CB2_menu
title To skip intro, press any key...
ping -n 2 localhost>nul&batbox /k_&if !errorlevel! NEQ 0 goto CB2_menu
title CraftBatcher - Comeback
cls
echo …ÕÕÕÕÕÕÕÕÕª
echo ∫≤≤≤≤≤≤≤≤≤∫
echo ∫€˛ €∫
echo ∫ €˛ ˛˛˛ ∫
echo ∫˛     €∫
echo ∫   ˛  €€∫
echo ∫€    ∫
echo ∫    ˛  ∫
echo »ÕÕÕÕÕÕÕÕÕº
echo.
echo Swiat pelen przygod...
ping -n 2 localhost>nul&batbox /k_&if !errorlevel! NEQ 0 goto CB2_menu
title To skip intro, press any key...
ping -n 2 localhost>nul&batbox /k_&if !errorlevel! NEQ 0 goto CB2_menu
title CraftBatcher - Comeback
cls
echo …ÕÕÕÕÕÕÕÕÕª
echo ∫€€€€€€€€€∫
echo ∫€€€€€€€€€∫
echo ∫€€€€€€€€€∫
echo ∫€€€€€€€€€∫
echo ∫€€€€€€€€€∫
echo ∫€€€€€€€€€∫
echo ∫€€€€€€€€€∫
echo »ÕÕÕÕÕÕÕÕÕº
echo.
echo A tylko...
ping -n 2 localhost>nul
cls
echo …ÕÕÕÕÕÕÕÕÕª
echo ∫≤≤≤≤≤≤≤≤≤∫
echo ∫≤≤≤≤≤≤≤≤≤∫
echo ∫≤≤≤≤≤≤≤≤≤∫
echo ∫±±±±±±±±±∫
echo ∫±±±±±±±±±∫
echo ∫±±±±±±±±±∫
echo ∫∞∞∞∞∞∞∞∞∞∫
echo »ÕÕÕÕÕÕÕÕÕº
Echo.
echo musisz...
ping -n 2 localhost>nul
cls
echo …ÕÕÕÕÕÕÕÕÕª
echo ∫±±±±±±±±±∫
echo ∫±±±±±±±±±∫
echo ∫±±±±±±±±±∫
echo ∫∞∞∞∞∞∞∞∞∞∫
echo ∫∞∞∞∞∞∞∞∞∞∫
echo ∫∞∞∞∞∞∞∞∞∞∫
echo ∫∞∞∞∞∞∞∞∞∞∫
echo »ÕÕÕÕÕÕÕÕÕº
Echo.
echo zagrac...
ping -n 2 localhost>nul
cls
echo …ÕÕÕÕÕÕÕÕÕª
echo ∫∞∞∞∞∞∞∞∞∞∫
echo ∫∞∞∞∞∞∞∞∞∞∫
echo ∫∞∞∞∞∞∞∞∞∞∫
echo ∫∞∞∞∞∞∞∞∞∞∫
echo ∫∞∞∞∞∞∞∞∞∞∫
echo ∫∞∞∞∞∞∞∞∞∞∫
echo ∫∞∞∞∞∞∞∞∞∞∫
echo »ÕÕÕÕÕÕÕÕÕº
echo.
echo W...
ping -n 2 localhost>nul
cls
echo …ÕÕÕÕÕÕÕÕÕª
echo ∫∞∞∞∞∞∞∞∞∞∫
echo ∫∞ Craft ∞∫
echo ∫∞Batcher∞∫
echo ∫∞∞∞∞∞∞∞∞∞∫
echo ∫∞Suchar ∞∫
echo ∫∞  Owiec∞∫
echo ∫∞∞∞∞∞∞∞∞∞∫
echo »ÕÕÕÕÕÕÕÕÕº
echo Microshit Copyright R
echo.
echo CRAFTBATCHERA!
ping -n 3 localhost>nul
cls

:: Dobre menu
:CB2_menu
cls
title CraftBatcher - Comeback
echo.
echo  CraftBatcher 
echo  Wersja: %ver%
echo …ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕª
echo ∫1) Gra           ∫
echo ∫2) Opcje         ∫
echo ∫3) O autorze     ∫
Echo ∫4) Zaladuj       ∫
echo ∫5) Achievements  ∫
echo ∫6) Wyjscie       ∫
echo »ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕº
echo  Wersja poprawiona przez CreepyNinja_
choice /c 123456 /n
if %errorlevel%==1 goto CB2_play
if %errorlevel%==2 goto CB2_settings
if %errorlevel%==3 goto CB2_about
if %errorlevel%==4 if exist zapis.bat goto CB2_load
if %errorlevel%==5 goto CB2_achievements
if %errorlevel%==6 endlocal & exit /b
goto CB2_menu

:CB2_play
cls
echo  CraftBatcher 
echo …ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕª
echo ∫ Jak wielki jest twoj swiat ∫
echo ∫ 1) Maly                    ∫
echo ∫ 2) Sredni                  ∫
echo ∫ 3) Duzy                    ∫
echo ∫ 4) Moon                    ∫
echo ∫ 5) Nether [Special]        ∫
echo »ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕº
choice /c 12345 /n
if %errorlevel%==1 goto CB2_gensmall
if %errorlevel%==2 goto CB2_genmed
if %errorlevel%==3 goto CB2_genbig
if %errorlevel%==4 goto CB2_genmoon
if %errorlevel%==5 goto CB2_genether
goto CB2_play

:CB2_genether
echo Specialny swiat sie tworzy
for /l %%y in (1,1,80) do (
for /l %%x in (1,1,80) do (
set /a r=!random!*7/32768
if !r!==0 set x%%xy%%y= 
if !r!==1 set x%%xy%%y= 
if !r!==2 set x%%xy%%y=~
if !r!==3 set x%%xy%%y=
if !r!==4 set x%%xy%%y=~
if !r!==5 set x%%xy%%y= 
if !r!==6 set x%%xy%%y= 
)
)
goto CB2_spawn

:CB2_genmoon
echo Ksiezyc sie tworzy...
for /l %%y in (1,1,40) do (
for /l %%x in (1,1,40) do (
set /a r=!random!*7/32768
if !r!==0 set x%%xy%%y= 
if !r!==1 set x%%xy%%y= 
if !r!==2 set x%%xy%%y=
if !r!==3 set x%%xy%%y=
if !r!==4 set x%%xy%%y=€
if !r!==5 set x%%xy%%y= 
if !r!==6 set x%%xy%%y= 
)
)
set moon=1
goto CB2_spawn

:CB2_gensmall
echo Swiat sie generuje...
for /l %%y in (1,1,20) do (
for /l %%x in (1,1,20) do (
set /a r=!random!*7/32768
if !r!==0 set x%%xy%%y= 
if !r!==1 set x%%xy%%y= 
if !r!==2 set x%%xy%%y= 
if !r!==3 set x%%xy%%y=
if !r!==4 set x%%xy%%y=€
if !r!==5 set x%%xy%%y=˛
if !r!==6 set x%%xy%%y=
)
)
goto CB2_spawn

:CB2_genmed
echo Swiat sie generuje...
for /l %%y in (1,1,50) do (
for /l %%x in (1,1,50) do (
set /a r=!random!*7/32768
if !r!==0 set x%%xy%%y= 
if !r!==1 set x%%xy%%y= 
if !r!==2 set x%%xy%%y= 
if !r!==3 set x%%xy%%y=
if !r!==4 set x%%xy%%y=€
if !r!==5 set x%%xy%%y=˛
if !r!==6 set x%%xy%%y=
)
)
goto CB2_spawn

:CB2_genbig
echo Swiat sie generuje...
for /l %%y in (1,1,100) do (
for /l %%x in (1,1,100) do (
set /a r=!random!*7/32768
if !r!==0 set x%%xy%%y= 
if !r!==1 set x%%xy%%y= 
if !r!==2 set x%%xy%%y= 
if !r!==3 set x%%xy%%y=
if !r!==4 set x%%xy%%y=€
if !r!==5 set x%%xy%%y=˛
if !r!==6 set x%%xy%%y=
)
)
goto CB2_spawn

:CB2_spawn
set /a rx=!random!*20/32768+1
set /a ry=!random!*20/32768+1
if not "!x%rx%y%ry%!"==" " goto CB2_spawn
set x=%rx%
set y=%ry%
:CB2_sp2
if %moon%==1 goto CB2_spmoon
set /a dx=!random!*20/32768+1
set /a dy=!random!*20/32768+1
if not "!x%dx%y%dy%!"==" " goto CB2_sp2
set wx=%dx%
set wy=%dy%
goto CB2_scr

:CB2_load
cls
call zapis.bat
:CB2_scr
set /a bx=%x%-4
set /a ex=%x%+4
set /a by=%y%-3
set /a ey=%y%+3
set v=!x%x%y%y%!
set x%x%y%y%=%skin%
set x%wx%y%wy%=
if %moon%==1 set x%wx%y%wy%=#
set b=0
cls
echo.
echo Wersja: %ver%
echo  …ÕÕÕÕÕÕÕÕÕª
for /l %%y in (%by%,1,%ey%) do (
set /a b+=1
set l=
for /l %%x in (%bx%,1,%ex%) do (
if "!x%%xy%%y!"=="" (set l=!l!≤) else (set l=!l!!x%%xy%%y!)
)
echo  ∫!l!∫
)
echo  »ÕÕÕÕÕÕÕÕÕº
echo   Mode:!o%o%!
set x%x%y%y%=%v%
choice /c wsade1234pxu /n
if %errorlevel%==1 (set vx=%x%&set /a vy=%y%-1&goto CB2_key)
if %errorlevel%==2 (set vx=%x%&set /a vy=%y%+1&goto CB2_key)
if %errorlevel%==3 (set /a vx=%x%-1&set vy=%y%&goto CB2_key)
if %errorlevel%==4 (set /a vx=%x%+1&set vy=%y%&goto CB2_key)
if %errorlevel%==5 goto CB2_items
if %errorlevel%==6 set o=1
if %errorlevel%==7 set o=2
if %errorlevel%==8 set o=3
if %errorlevel%==9 set o=4
if %errorlevel%==10 goto CB2_pause
if %errorlevel%==11 goto CB2_cheat
if %errorlevel%==12 set c=0
goto CB2_scr

:CB2_key
if %o%==1 if "!x%vx%y%vy%!"==" " (set x=%vx%&set y=%vy%)
if %o%==1 if %c%==1 (set x=%vx%&set y=%vy%)
if %c%==0 if "!x%vx%y%vy%!"=="~" goto CB2_przegrales
if %o%==1 if "!x%vx%y%vy%!"=="" goto CB2_bot
if %o%==1 if "!x%vx%y%vy%!"=="#" goto CB2_battle
if %o%==2 if "!x%vx%y%vy%!"=="" if not %i1%==99 (set x%vx%y%vy%= &set /a i1+=1)
if %o%==2 if "!x%vx%y%vy%!"=="€" if not %i2%==99 (set x%vx%y%vy%= &set /a i2+=1)
if %o%==2 if "!x%vx%y%vy%!"=="" if not %i10%==99 (set x%vx%y%vy%= &set /a i10+=1)
if %o%==2 if "!x%vx%y%vy%!"=="" if not %i10%==99 (set x%vx%y%vy%= &set /a i10+=1)
if %o%==2 if %itcr%==1 if "!x%vx%y%vy%!"=="˛" if not %i3%==99 (set x%vx%y%vy%= &set /a i3+=1)
if %o%==2 if %itcr%==1 if "!x%vx%y%vy%!"=="" if not %i7%==99 (set x%vx%y%vy%= &set /a i7+=1)
if %o%==2 if "!x%vx%y%vy%!"=="" if not %i11%==99 (set x%vx%y%vy%= &set /a i11+=1)
if %o%==2 if "!x%vx%y%vy%!"=="∞" if not %i1%==99 (set x%vx%y%vy%= &set /a i1+=1)
if %o%==3 if "!x%vx%y%vy%!"==" " if %i%==1 if not %i1%==0 (set x%vx%y%vy%=∞&set /a i1-=1)
if %o%==3 if "!x%vx%y%vy%!"==" " if %i%==10 if not %i10%==0 (set x%vx%y%vy%=&set /a i10-=1)
if %o%==3 if "!x%vx%y%vy%!"==" " if %i%==2 if not %i2%==0 (set x%vx%y%vy%=€&set /a i2-=1)
if %o%==3 if "!x%vx%y%vy%!"==" " if %i%==3 if not %i3%==0 (set x%vx%y%vy%=˛&set /a i3-=1)
if %o%==3 if "!x%vx%y%vy%!"==" " if %i%==5 if not %i5%==0 (set x%vx%y%vy%=‹&set /a i5-=1)
if %o%==3 if "!x%vx%y%vy%!"==" " if %i%==6 if not %i6%==0 (set x%vx%y%vy%=&set /a i6-=1)
if %o%==3 if "!x%vx%y%vy%!"==" " if %i%==9 if not %i9%==0 (set x%vx%y%vy%=±&set /a i9-=1)
if %o%==3 if "!x%vx%y%vy%!"==" " if %i%==11 if not %i11%==0 (set x%vx%y%vy%=&set /a i11-=1)
if %o%==4 goto CB2_crafting
if %o%==4 if "!x%vx%y%vy%!"=="‹" goto CB2_piecyk
if %o%==4 if "!x%vx%y%vy%!"=="±" goto CB2_skrzynia
if %i1%==20 (
 if not %ld1%==1 (
 set ld1=1
 set ld=20
)
)
if %i10%==10 (
 if not %lm1%==1 (
 set lm1=1
 set lm=10
)
)
if %zad1%==1 (
 if not %ln1%==1 (
 set ln1=1
 set zada=1
)
)
goto CB2_scr

:CB2_skrzynia
cls
echo Witaj w skrzyni^!
echo Schowaj tu przedmioty
echo 1]Wloz rzeczy
echo 2]Wez rzeczy
echo 3]Powrot do gry
choice /c 123 /n
if %errorlevel%==1 goto CB2_wloz
if %errorlevel%==2 goto CB2_wez
if %errorlevel%==3 goto CB2_scr
goto CB2_skrzynia

:CB2_items
for /l %%a in (1,1,11) do (set c%%a= &set z%%a=!i%%a! )
set c%i%=
cls
echo.
echo  …ÕÕÕÕÕÕÕÕÕÕª
echo  ∫  Itemy   ∫
echo  ∫%c1%Drew x%z1:~0,2% ∫
echo  ∫%c2%Kami x%z2:~0,2% ∫
echo  ∫%c3%Wegi x%z3:~0,2% ∫
Echo  ∫%c4%NOre x%z4:~0,2% ∫
Echo  ∫%c5%Piec x%z5:~0,2% ∫
echo  ∫%c6%Ogni x%z6:~0,2% ∫
echo  ∫%c7%Zela x%z7:~0,2% ∫
echo  ∫%c8%P.Ze x%z8:~0,2% ∫
echo  ∫%c9%Skrz x%z9:~0,2% ∫
echo  ∫%c10%Moon x%z10:~0,2% ∫
echo  ∫%c11%Net. x%z11:~0,2% ∫
echo  »ÕÕÕÕÕÕÕÕÕÕº
choice /c wse /n
if %errorlevel%==1 if not %i%==1 set /a i-=1
if %errorlevel%==2 if not %i%==11 set /a i+=1
if %errorlevel%==3 goto CB2_scr
goto CB2_items

:CB2_crafting
cls
echo Witam w craftingu, powinienes
echo miec materialy do stworzenia wszystkiego
echo Itemy ktore mozesz zrobic:
if %i2% GEQ 3 if %i1% GEQ 2 (
echo 1]Kilof
set p=1 
set itemcr=kilof
)
if %i2% GEQ 10 if %i3% GEQ 2 (
echo 2]Piecyk
set p=1
set itemcr2=Piecyk
)
if %i8% GEQ 10 if %i4% GEQ 2 (
echo 3]TajnaSkrzynka
set p=1
set itemcr3=sekret
)
if %i1% GEQ 8 (
echo 4]Skrzynia
set p=1
set itemcr4=skrzynia
)
if %p%==1 (set /p opc=) else (echo.&echo Nic nie mozesz zcraftowac :^(&pause&goto CB2_scr)
if %opc%==1 goto CB2_craft
if %opc%==2 goto CB2_craft
if %opc%==3 goto CB2_craft
if %opc%==4 goto CB2_craft
if %opc%==q goto CB2_scr
if %opc%==e goto CB2_scr
goto CB2_crafting

:CB2_craft
cls
if %opc%==1 (
echo Tworzymy %itemcr%... prosze poczekac...
)
if %opc%==2 (
echo Tworzymy %itemcr2%... prosze poczekac...
)
if %opc%==3 (
echo Tworzymy %itemcr3%... prosze poczekac...
)
if %opc%==4 (
echo Tworzymy %itemcr4%... prosze poczekac...
)
if %opc%==1 if %i2% GEQ 3 if %i1% GEQ 2 (
set/a i1=%i1%-2
set/a i2=%i2%-3
Set itcr=1
)
if %opc%==2 if %i2% GEQ 10 if %i3% GEQ 2 (
set/a i2=%i2%-10
set/a i3=%i3%-2
set/a i5=%i5%+1
)
if %opc%==3 if %i8% GEQ 10 if %i4% GEQ 2 (
set/a i8=%i8%-10
set/a i4=%i4%-2
set ktr=1
)
if %opc%==4 if %i1% GEQ 8 (
set/a i1=%i1%-8
set/a i9=%i9%+1
)
Set p=0
goto CB2_scr

:CB2_settings
set ia=1
cls
echo …ÕÕÕÕÕÕÕÕÕÕÕª
echo ∫ Settings  ∫
echo ÃÕÕÕÕÕÕÕÕÕÕÕπ
echo ∫ 1]Skiny   ∫
echo ∫ 2]Kolor   ∫
echo »ÕÕÕÕÕÕÕÕÕÕÕº
choice /c 12 /n
if %errorlevel%==1 goto CB2_skiny
if %errorlevel%==2 goto CB2_kolor
goto CB2_settings

:CB2_kolor
cls
if %ia%==1 (echo color F0>color.bat&color F0)
if %ia%==2 (echo color 0F>color.bat&color 0F)
if %ia%==3 (echo color 1F>color.bat&color 1F)
if %ia%==4 (echo color 2F>color.bat&color 2F)
if %ia%==5 (echo color 4F>color.bat&color 4F)
if %ia%==6 (echo color E0>color.bat&color E0)
if %ia%==7 (echo color 70>color.bat&color 70)
if %ia%==8 (echo color 8F>color.bat&color 8F)
if %ia%==9 (echo color 9F>color.bat&color 9F)
if %ia%==10 (echo color CF>color.bat&color CF)
echo Note: Moze popsuc klimat gry.
echo …ÕÕÕÕÕÕÕÕÕÕÕª
echo ∫   Color   ∫
echo ÃÕÕÕÕÕÕÕÕÕÕÕπ 
echo ∫    a    ∫
echo ÃÕÕÕÕÕÕÕÕÕÕÕπ
echo ∫Z]Wyjscie  ∫
echo »ÕÕÕÕÕÕÕÕÕÕÕº
choice /c adz /n
if %errorlevel%==1 if not %ia%==1 (set/a ia=%ia%-1)
if %errorlevel%==2 if not %ia%==10 (set/a ia=%ia%+1)
if %errorlevel%==3 goto CB2_menu
goto CB2_kolor

:CB2_skiny
cls
echo Jaki chcesz skin twojej postaci:
echo 1]
echo 2]o
echo 3]@
echo 4]
if %ktr%==1 echo 5]
if %po%==99 echo 6]
choice /c 123456 /n
if %errorlevel%==1 (set skin=&echo set skin=>colorskin.bat&goto CB2_menu)
if %errorlevel%==2 (set skin=o&echo set skin=o>colorskin.bat&goto CB2_menu)
if %errorlevel%==3 (set skin=@&echo set skin=@>colorskin.bat&goto CB2_menu)
if %errorlevel%==4 (set skin=&echo set skin=>colorskin.bat&goto CB2_menu)
if %errorlevel%==5 if %ktr%==1 (set skin=&echo set skin=>colorskin.bat&goto CB2_menu)
if %errorlevel%==6 if %po%==99 (set skin=&echo set skin=> olorskin.bat&goto CB2_menu)
goto CB2_skiny

:CB2_about
cls
echo Czesc, ta gra zostala stworzona przez
echo Suchara, nie ma on praw autorskich, to oznacza
echo ze mozesz zmieniac ta gre ile razy chcesz, ale by byl
Echo szczesliwy gdybys wspomnial troche o nim :D
echo.
echo.
echo Klawiszologia:
echo WASD - Poruszanie sie
Echo 1234 - Mody
echo P - Pauza
pause>nul
goto CB2_menu

:CB2_bot
cls
echo Czesc, jestem freddy, chce ci sprzedac
echo nowa rude by robic nowe rzeczy w nowych aktualizacjach, ta ruda
echo bedzie usunieta z mojego sklepiku
echo KUP to teraz za 5 drewna = 1 ruda
echo 1] Kup
echo 2] Zadania
echo 3] Powrot do gry
set /p odp=
if %odp%==1 if %i1% GEQ 5 goto CB2_buy
if %odp%==2 goto CB2_zadania
if %odp%==3 goto CB2_scr
goto CB2_bot

:CB2_buy
cls
echo Kupiles jedna teczowa rude^^!
set/a i1=%i1%-5
pause>nul
goto CB2_scr

:CB2_save
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo …ÕÕÕÕÕÕÕÕÕÕÕÕÕÕª
echo ∫Zapisywanie...∫
echo »ÕÕÕÕÕÕÕÕÕÕÕÕÕÕº
if exist zapis.bat del zapis.bat
if exist zapisgry.bat del zapisgry.bat
>zapis.bat (for /f "delims== tokens=1*" %%A in ('set x') do (
if "%%B"=="" (echo set %%A= ) else (echo set %%A=%%B)
))
>>zapis.bat (
echo set x=%x%
echo set y=%y%
echo set i1=%i1%
echo set i2=%i2%
echo set i3=%i3%
echo set i4=%i4%
echo set i5=%i5%
echo set i6=%i6%
echo set i7=%i7%
echo set i8=%i8%
echo set i9=%i9%
echo set i10=%i10%
echo set i11=%i11%
echo set ii1=%ii1%
echo set ii2=%ii2%
echo set ii3=%ii3%
echo set ii4=%ii4%
echo set ii5=%ii5%
echo set ii6=%ii6%
echo set ii7=%ii7%
echo set ii8=%ii8%
echo set ii9=%ii9%
echo set ii10=%ii10%
echo set ii11=%ii11%
echo set moon=%moon%
echo set itcr=0
echo Set p=0
echo set opc=0
echo set wx=%wx%
echo set wy=%wy%
echo set skin=%skin%
echo set ktr=%ktr%
)
>zapisgry.bat (
echo set ld1=%ld1%
echo set lm1=%lm1%
echo set ln1=%ln1%
echo set lb1=%lb1%
echo set la1=%la1%
echo set ld=%ld%
echo set lm=%lm%
echo set ln=%ln%
echo set lb=%lb%
echo set la=%la%
echo set po=%po%
echo set zada=%zada%
)
ping -n 3 localhost>nul
goto CB2_menu

:CB2_piecyk
cls
echo Witaj w piecyku,
echo mozesz stworzyc tutaj
echo wszystko z weglem i rudami
if %i1% GEQ 1 if %i3% GEQ 1 (
echo 1]Ognisko
set p=1
Set itemcr=ognisko
)
if %i7% GEQ 1 if %i3% GEQ 1 (
echo 2]Przet.Zelazo
set p=1
set itemcr2=zelazo
if %p%==1 set/p odp=
if %odp%==1 goto CB2_fire
if %odp%==2 goto CB2_fire
if %odp%==q goto CB2_scr
choice /c e /n
if %errorlevel%==1 goto CB2_scr
goto CB2_piecyk

:CB2_fire
cls
if %odp%==1 (
echo Tworzymy %itemcr%... prosze poczekac...
)
if %odp%==2 (
echo Tworzymy %itemcr2%... prosze poczekac...
)
if %odp%==1 if %i1% GEQ 1 if %i3% GEQ 1 (
set/a i1=%i1%-1
set/a i3=%i3%-1
set/a i6=%i6%+1
)
if %odp%==2 if %i7% GEQ 1 if %i3% GEQ 1 (
set/a i7=%i7%-1
set/a i3=%i3%-1
set/a i8=%i8%+1
)
set p=0
goto CB2_scr

:CB2_zadania
cls
if not %zad1%==1 (
echo Wytnij 10 Drewna i mi oddaj
echo 1]Oddaj
Echo 2]Powrot do gry
choice /c 12 /n
if %errorlevel%==1 goto CB2_oddaj
if %errorlevel%==2 goto CB2_scr
)
if not %zad2%==1 (
echo Wykop 5 wegla i mi oddaj
echo 1]Oddaj
echo 2]Powrot do gry
choice /c 12 /n
if %errorlevel%==1 goto CB2_oddaj
if %errorlevel%==2 goto CB2_scr
)
if not %zad3%==1 (
echo Zdobadz 10 Drewna, 5 Zelaza przepalonego i 3 Wegla^!
echo 1]Oddaj
echo 2]Powrot do gry
choice /c 12 /n
if %errorlevel%==1 goto CB2_oddaj
if %errorlevel%==2 goto CB2_scr
)
goto CB2_scr

:CB2_oddaj
cls
if %i1% GEQ 10 if not %zad1%==1 (
echo Dziekuje za drewno^!
Set zad1=1
set/a po=%po%+2
set/a i4=%i4%+2
pause>nul
goto CB2_zadania
)
if %i3% GEQ 5 if not %zad2%==1 (
echo Dziekuje za wegiel^!
set zad2=1
set/a i4=%i4%+2
set/a po=%po%+5
pause>nul
goto CB2_zadania
)
if %i8% GEQ 5 if %i3% GEQ 3 if %i1% GEQ 10 if not %zad3%==1 (
echo O jeny^! Myslalem ze nie dasz sobie rady, mylilem sie^!
set zad3=1
set/a i4=%i4%+10
Set/a i6=%i6%+10
set/a i2=%i2%+10
set/a po=%po%+10
pause>nul
goto CB2_zadania
)
echo Nie masz materialow na to zadanie^!
echo Idz je pozbieraj^!
pause>nul
goto CB2_scr

:CB2_wloz
cls
echo Itemy wlozone
echo Drewno:%ii1%
echo Kamien:%ii2%
echo Wegiel:%ii3%
echo NOre:%ii4%
Echo Piec:%ii5%
echo Ognisko:%ii6%
echo Zelazo:%ii7%
echo P.Zelazo:%ii8%
echo Skrzynia:%ii9%
echo Moon:%ii10%
echo 1]Wloz
echo 2]Powrot do gry
choice /c 12 /n
if %errorlevel%==1 goto CB2_wloz2
if %errorlevel%==2 goto CB2_scr
goto CB2_wloz

:CB2_wloz2
cls
echo Co chcesz wlozyc
echo E - Wyjscie ze skrzyni
for /l %%a in (1,1,11) do (set c%%a= &set z%%a=!i%%a! )
set c%i%=
cls
echo.
echo  …ÕÕÕÕÕÕÕÕÕÕª
echo  ∫  Itemy   ∫
echo  ∫%c1%Drew x%z1:~0,2% ∫
echo  ∫%c2%Kami x%z2:~0,2% ∫
echo  ∫%c3%Wegi x%z3:~0,2% ∫
Echo  ∫%c4%NOre x%z4:~0,2% ∫
Echo  ∫%c5%Piec x%z5:~0,2% ∫
echo  ∫%c6%Ogni x%z6:~0,2% ∫
echo  ∫%c7%Zela x%z7:~0,2% ∫
echo  ∫%c8%P.Ze x%z8:~0,2% ∫
echo  ∫%c9%Skrz x%z9:~0,2% ∫
echo  ∫%c10%Moon x%z10:~0,2% ∫
echo  ∫%c11%Net. x%z11:~0,2% ∫
echo  »ÕÕÕÕÕÕÕÕÕÕº
choice /c wsea /n
if %errorlevel%==1 if not %i%==1 set /a i-=1
if %errorlevel%==2 if not %i%==11 set /a i+=1
if %errorlevel%==3 goto CB2_scr
if %errorlevel%==4 goto CB2_wloz3
goto CB2_wloz2

:CB2_wloz3
cls
echo Ile?
set/p ile=
if %i% GEQ %ile% (
set/a ii%i%=!ii%i%!+%ile%
)
goto CB2_wloz2

:CB2_wez
Cls
echo Co chcesz wziac
echo E - Wyjscie ze skrzyni
for /l %%a in (1,1,11) do (set c%%a= &set z%%a=!i%%a! )
set c%i%=
cls
echo.
echo  …ÕÕÕÕÕÕÕÕÕÕª
echo  ∫  Itemy   ∫
echo  ∫%c1%Drew x%z1:~0,2% ∫
echo  ∫%c2%Kami x%z2:~0,2% ∫
echo  ∫%c3%Wegi x%z3:~0,2% ∫
Echo  ∫%c4%NOre x%z4:~0,2% ∫
Echo  ∫%c5%Piec x%z5:~0,2% ∫
echo  ∫%c6%Ogni x%z6:~0,2% ∫
echo  ∫%c7%Zela x%z7:~0,2% ∫
echo  ∫%c8%P.Ze x%z8:~0,2% ∫
echo  ∫%c9%Skrz x%z9:~0,2% ∫
echo  ∫%c10%Moon x%z10:~0,2% ∫
echo  ∫%c11%Net. x%z11:~0,2% ∫
echo  »ÕÕÕÕÕÕÕÕÕÕº
choice /c wsea /n
if %errorlevel%==1 if not %i%==1 set /a i-=1
if %errorlevel%==2 if not %i%==11 set /a i+=1
if %errorlevel%==3 goto CB2_scr
if %errorlevel%==4 goto CB2_wez2
goto CB2_wez

:CB2_wez2
cls
echo Ile?
set/p ile=
if ii%i%==%ile% (
set/a i%i%=!i%i%!+%ile%
set/a ii%i%=!ii%i%!-%ile%
)
goto CB2_wez

:CB2_przegrales
cls
Echo 
ECHO Illuminati confirmed 
echo 
Echo Zegnaj.
Echo 
pause>nul
echo 
pause>nul
exit /b

:CB2_pause
cls
if %po%==0 set po=0 
if %po%==1 set po=1 
if %po%==2 set po=2 
if %po%==3 set po=3 
if %po%==4 set po=4 
if %po%==5 set po=5 
if %po%==6 set po=6 
if %po%==7 set po=7 
if %po%==8 set po=8 
if %po%==9 set po=9 
echo …ÕÕÕÕÕÕÕÕÕÕÕÕÕÀÕÕÕª
echo ∫Points: x%po:~0,2%  ∫ %skin% ∫
echo ÃÕÕÕÕÕÕÕÕÕÕÕÕÕ ÕÕÕπ
echo ∫ 1]Zapisz        ∫
echo ∫ 2]Powrot do gry ∫
echo ∫ 3]Wyjscie       ∫
echo »ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕº
choice /c 123 /n
if %errorlevel%==1 goto CB2_save
if %errorlevel%==2 goto CB2_scr
if %errorlevel%==3 goto CB2_menu
goto CB2_pause

:CB2_achievements
cls
echo …ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕª
echo ∫  Achievements  ∫
echo ÃÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕπ
echo ∫ 1]Drwal        ∫
echo ∫ 2]Cheater      ∫
echo ∫ 3]Dogadaj sie  ∫
echo ∫ 4]Just do it^!   ∫
echo ∫ 5]Udalo ci sie ∫
echo ∫ a]Wyjdz        ∫
echo »ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕº
choice /c 12345a /n
if %errorlevel%==1 goto CB2_ach1
if %errorlevel%==2 goto CB2_ach2
if %errorlevel%==3 goto CB2_ach3
if %errorlevel%==4 goto CB2_ach4
if %errorlevel%==5 goto CB2_ach5
if %errorlevel%==6 goto CB2_menu
goto CB2_achievements

:CB2_ach1
cls
echo Zbierz 20 drewna
if %ld% geq 20 (
echo Ukonczyles juz to zadanie^!
set ld1=1
set/a po=%po%+20
)
pause>nul
goto CB2_menu


:CB2_ach2
cls
echo Zbierz 10 moon stone
if %lm% geq 10 (
echo Ukonczyles juz to zadanie^!
set lm1=1
set/a po=%po%+20
)
pause>nul
goto CB2_menu


:CB2_ach3
cls
echo Zrob 1 zadanie od npc (ze zbieraniem drewna)
echo %ln%/1
if %zada geq 1 (
echo Ukonczyles juz to zadanie^!
set ln1=1
set/a po=%po%+20
)
pause >nul
goto CB2_menu


:CB2_ach4
cls
echo Pokonaj Bossa
echo %lb%/1
if %lb% geq 1 (
echo Ukonczyles juz to zadanie^!
set lb1=1
set/a po=%po%+20
)
pause >nul
goto CB2_menu


:CB2_ach5
cls
echo Zrob wszystkie achievementy
echo %la%/4
if %ld1%==1 if %lm1%==1 if %ln1%==1 if %lb1%==1 (
echo Ukonczyles juz to zadanie^!
set la1=1
set/a po=%po%+2
)
pause>nul
goto CB2_menu


:CB2_brak
cls
echo Brakuje ci potrzebnych plikow do wlaczenia gry^!
pause>nul
exit /b

:CB2_spmoon
cls
set /a dx=!random!*20/32768+1
set /a dy=!random!*20/32768+1
if not "!x%dx%y%dy%!"==" " goto CB2_spmoon
set wx=%dx%
set wy=%dy%
goto CB2_scr

:CB2_battle
cls
echo Note: Atak bossa to od 1-2, wiec uwazaj^!
echo  ‹€€€€€€€€€€‹
echo ‹€  ±    ±  €‹
echo €            €
echo …ÕÕÕÕÕÕÕÕÕÕÕÕª
echo ∫HP:%h1%%h2%%h3%%h4%%h5%%h6%   ∫
echo »ÕÕÕÕÕÕÕÕÕÕÕÕº
echo.
echo €€€€€€€€€€€€
echo €          €
echo €  €    €  €
echo €          €
echo …ÕÕÕÕÕÕÕÕÕÕÕÕª
echo ∫HP:%hp1%%hp2%%hp3%%hp4%%hp5%%hp6%   ∫
echo »ÕÀÕÕÕÕÕÕÕÕÀÕº
echo …ÕºSkille: »Õª
echo ∫ 1]Punch    ∫
echo ∫ 2]Knock    ∫
if %itcr%==1 echo ∫ 3]Kilof    ∫
echo »ÕÕÕÕÕÕÕÕÕÕÕÕº
if %itcr%==1 (choice /c 123 /n) else (choice /c 12 /n)
if %errorlevel%==1 goto CB2_punch
if %errorlevel%==2 goto CB2_knock
if %errorlevel%==3 goto CB2_kilof
goto CB2_battle

:CB2_punch
cls
if not "%h6%"==" " (
set "h6= "
goto CB2_bot_dmg
)
if not "%h5%"==" " (
set "h5= "
goto CB2_bot_dmg
)
if not "%h4%"==" " (
set "h4= "
goto CB2_bot_dmg
)
if not "%h3%"==" " (
set "h3= "
goto CB2_bot_dmg
)
if not "%h2%"==" " (
set "h2= "
goto CB2_bot_dmg
)
if not "%h1%"==" " (
set "h1= "
goto CB2_win
)
:CB2_bot_dmg
set/a dmg=!random!*2/32768
if !dmg!==0 (
set dmg_boss=1
if not "%hp6%"==" " (
set "hp6= "
goto CB2_animacja
)
if not "%hp5%"==" " (
set "hp5= "
goto CB2_animacja
)
if not "%hp4%"==" " (
set "hp4= "
goto CB2_animacja
)
if not "%hp3%"==" " (
set "hp3= "
goto CB2_animacja
)
if not "%hp2%"==" " (
set "hp2= "
goto CB2_animacja
)
if not "%hp1%"==" " (
set "hp1= "
goto CB2_przegrales
)
)
if !dmg!==1 (
set dmg_boss=2
if not "%hp6%"==" " (
set "hp6= "
set "hp5= "
goto CB2_animacja
)
if not "%hp5%"==" " (
set "hp5= "
set "hp4= "
goto CB2_animacja
)
if not "%hp4%"==" " (
set "hp4= "
set "hp3= "
goto CB2_animacja
)
if not "%hp3%"==" " (
set "hp3= "
set "hp2= "
goto CB2_animacja
)
if not "%hp2%"==" " (
goto CB2_przegrales
)
if not "%hp1%"==" " (
goto CB2_przegrales
)
)
:CB2_animacja
echo  ‹€€€€€€€€€‹
echo ‹€  ± ±  €‹  Punched^!
echo €           €  Boss stracil %dmg_punch%
echo …ÕÕÕÕÕÕÕÕÕÕÕÕª
echo ∫HP:%h1%%h2%%h3%%h4%%h5%%h6%   ∫
echo »ÕÕÕÕÕÕÕÕÕÕÕÕº
echo.
echo €€€€€€€€€€€€
echo €          €
echo €  €    €  €  Zaatakowany przez bossa^!
echo €          €  Straciles %dmg_boss%
echo …ÕÕÕÕÕÕÕÕÕÕÕÕª
echo ∫HP:%hp1%%hp2%%hp3%%hp4%%hp5%%hp6%   ∫
echo »ÕÕÕÕÕÕÕÕÕÕÕÕº
ping -n 5 localhost>nul
goto CB2_battle

:CB2_knock
cls
if not "%h6%"==" " (
set "h6= "
set "h5= "
goto CB2_bot_dmg2
)
if not "%h5%"==" " (
set "h5= "
set "h4= "
goto CB2_bot_dmg2
)
if not "%h4%"==" " (
set "h4= "
set "h3= "
goto CB2_bot_dmg2
)
if not "%h3%"==" " (
set "h3= "
set "h2= "
goto CB2_bot_dmg2
)
if not "%h2%"==" " (
goto CB2_win
)
if not "%h1%"==" " (
goto CB2_win
)
:CB2_bot_dmg2
set/a dmg=!random!*2/32768
if !dmg!==0 (
set dmg_boss=1
if not "%hp6%"==" " (
set "hp6= "
goto CB2_animacja2
)
if not "%hp5%"==" " (
set "hp5= "
goto CB2_animacja2
)
if not "%hp4%"==" " (
set "hp4= "
goto CB2_animacja2
)
if not "%hp3%"==" " (
set "hp3= "
goto CB2_animacja2
)
if not "%hp2%"==" " (
set "hp2= "
goto CB2_animacja2
)
if not "%hp1%"==" " (
set "hp1= "
goto CB2_przegrales
)
)
if !dmg!==1 (
set dmg_boss=2
if not "%hp6%"==" " (
set "hp6= "
set "hp5= "
goto CB2_animacja2
)
if not "%hp5%"==" " (
set "hp5= "
set "hp4= "
goto CB2_animacja2
)
if not "%hp4%"==" " (
set "hp4= "
set "hp3= "
goto CB2_animacja2
)
if not "%hp3%"==" " (
set "hp3= "
set "hp2= "
goto CB2_animacja2
)
if not "%hp2%"==" " (
goto CB2_przegrales
)
if not "%hp1%"==" " (
goto CB2_przegrales
)
)
:CB2_animacja2
echo  ‹€€€€€€€€€‹
echo ‹€  ± ±  €‹  Knocked^!
echo €           €  Boss stracil %dmg_knock%
echo …ÕÕÕÕÕÕÕÕÕÕÕÕª
echo ∫HP:%h1%%h2%%h3%%h4%%h5%%h6%   ∫
echo »ÕÕÕÕÕÕÕÕÕÕÕÕº
echo.
echo €€€€€€€€€€€€
echo €          €
echo €  €    €  €  Zaatakowany przez bossa^!
echo €          €  Straciles %dmg_boss%
echo …ÕÕÕÕÕÕÕÕÕÕÕÕª
echo ∫HP:%hp1%%hp2%%hp3%%hp4%%hp5%%hp6%   ∫
echo »ÕÕÕÕÕÕÕÕÕÕÕÕº
ping -n 5 localhost>nul
goto CB2_battle

:CB2_kilof
cls
if not "%h6%"==" " (
set "h6= "
set "h5= "
goto CB2_bot_dmg3
)
if not "%h5%"==" " (
set "h5= "
set "h4= "
goto CB2_bot_dmg3
)
if not "%h4%"==" " (
set "h4= "
set "h3= "
goto CB2_bot_dmg3
)
if not "%h3%"==" " (
set "h3= "
set "h2= "
goto CB2_bot_dmg3
)
if not "%h2%"==" " (
goto CB2_win
)
if not "%h1%"==" " (
goto CB2_win
)
:CB2_bot_dmg3
set/a dmg=!random!*2/32768
if !dmg!==0 (
set dmg_boss=1
if not "%hp6%"==" " (
set "hp6= "
goto CB2_animacja3
)
if not "%hp5%"==" " (
set "hp5= "
goto CB2_animacja3
)
if not "%hp4%"==" " (
set "hp4= "
goto CB2_animacja3
)
if not "%hp3%"==" " (
set "hp3= "
goto CB2_animacja3
)
if not "%hp2%"==" " (
set "hp2= "
goto CB2_animacja3
)
if not "%hp1%"==" " (
set "hp1= "
goto CB2_przegrales
)
)
if !dmg!==1 (
set dmg_boss=2
if not "%hp6%"==" " (
set "hp6= "
set "hp5= "
goto CB2_animacja3
)
if not "%hp5%"==" " (
set "hp5= "
set "hp4= "
goto CB2_animacja3
)
if not "%hp4%"==" " (
set "hp4= "
set "hp3= "
goto CB2_animacja3
)
if not "%hp3%"==" " (
set "hp3= "
set "hp2= "
goto CB2_animacja3
)
if not "%hp2%"==" " (
goto CB2_przegrales
)
if not "%hp1%"==" " (
goto CB2_przegrales
)
)
:CB2_animacja3
echo  ‹€€€€€€€€€‹
echo ‹€  ± ±  €‹  Uderzony kilofem^!
echo €           €  Boss stracil %dmg_kilof%
echo …ÕÕÕÕÕÕÕÕÕÕÕÕª
echo ∫HP:%h1%%h2%%h3%%h4%%h5%%h6%   ∫
echo »ÕÕÕÕÕÕÕÕÕÕÕÕº
echo.
echo €€€€€€€€€€€€
echo €          €
echo €  €    €  €  Zaatakowany przez bossa^!
echo €          €  Straciles %dmg_boss%
echo …ÕÕÕÕÕÕÕÕÕÕÕÕª
echo ∫HP:%hp1%%hp2%%hp3%%hp4%%hp5%%hp6%   ∫
echo »ÕÕÕÕÕÕÕÕÕÕÕÕº
ping -n 5 localhost>nul
goto CB2_battle

:CB2_win
cls
echo Zwyciestwo^! Pokonales bossa^!
pause>nul
set h1=
set h2=
set h3=
set h4=
set h5=
set h6=
set lb=1
set lb1=1
goto CB2_scr

:CB2_cheat
cls
set c=1
set i1=99
set i2=99
set i3=99
set i4=99
Set i5=99
set i6=99
set i7=99
set i8=99
Set i9=99
set i10=99
set i11=99
echo.
echo Note: Nie mozesz usunac dodanych itemow ;]
echo Wlaczyles creative mode^!
echo Mozesz go wylaczyc wciskajac U
echo Milej zabawy^!
pause>nul
goto CB2_scr
:: Koniec programu CraftBatcher ::
