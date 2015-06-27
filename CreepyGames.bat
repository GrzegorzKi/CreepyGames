@echo off

setlocal enabledelayedexpansion enableextensions
chcp 852>nul
::MenuShortcut
set MDIR=%~dp0
set next=
set launch=
set notouch=
set return=
if defined staticanim (set /a wait=0,wait1=0) else (set /a wait=10,wait1=25)

if "%~1"=="/?" call :MenuShortcutUsage&exit /b 0
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
)
if defined next (
	1>&2 echo ERROR: Missing parameter.
	1>&2 echo.
	1>&2 call :MenuShortcutUsage
	exit /b 1
)

pushd "%MDIR%"
if /i not exist ansicon.exe (
	1>&2 echo ERROR: ANSICON.exe not found.
	1>&2 echo.
	1>&2 echo Please reinstall program to repair.
	exit /b 1
)
if not defined ANSIcon_Enabled (
	if "%~x0"=="" (set "EXT=.bat") else set EXT=
	ansicon.exe "%~nx0!EXT!" --ansicon_on %*
	exit /b %errorlevel%
)
popd

if defined launch (
	color 07
	%launch%
	set launch=
	if defined return goto MenuInit
	cls
	color 07
	title %comspec%
	mode 80,30
	exit /b 0
)

mode con cols=80 lines=30
if not exist batbox.exe call :BatBox
title CreepyGames - Centrum gier i program¢w
:MenuIntro
cls
set IntroMessage=
echo. 2>nul >"%temp%\bridgem"  || (set "IntroMessage=/c 0x0A /g 16 10 /d "Program jest juz uruchomiony w innym oknie." /g 13 11 /d "Aby kontynuowac, zamknij istniejace sesje programu."")
batbox.exe /h 0 /o 1 1 /c 0x0C /g 0 3 /d "/" /g 0 4 /d \ /w %wait% /g 1 2 /d "/" /g 1 4 /d "_" /w %wait% /g 2 1 /d "/" /g 2 3 /d "/" /g 2 4 /d "_" /w %wait% /g 3 0 /d "_" /g 3 2 /d "/" /g 3 3 /d "_" /g 3 4 /d "_" /w %wait% /g 4 0 /d "_" /g 4 1 /d "_" /g 4 3 /d "_" /g 4 4 /d "_" /w %wait% /g 5 0 /d "_" /g 5 1 /d "_" /g 5 3 /d "_" /g 5 4 /d "/" /w %wait% /g 6 0 /d "_" /g 6 1 /d "_" /g 6 4 /d "/" /w %wait% /g 7 0 /d "_" /g 7 1 /d "_" /g 7 3 /d "/" /g 7 4 /d "_" /w %wait% /g 8 0 /d "_" /g 8 1 /d "/" /g 8 2 /d "/" /g 8 4 /d "/" /w %wait% /g 9 1 /d "_" /g 9 3 /d "/" /w %wait% /g 10 1 /d "_" /g 10 2 /d "_" /w %wait% /g 11 1 /d "_" /g 11 2 /d "_" /w %wait% /g 12 1 /d "_" /g 12 2 /d "_" /w %wait% /g 13 1 /d "_" /g 13 2 /d "/" /g 13 3 /d "/" /g 13 4 /d \ /w %wait% /g 14 2 /d "/" /g 14 4 /d "_" /w %wait% /g 15 1 /d "_" /g 15 4 /d "_" /w %wait% /g 16 1 /d "_" /g 16 2 /d "_" /g 16 3 /d "_" /g 16 4 /d "_" /w %wait% /g 17 1 /d "_" /g 17 3 /d "_" /g 17 4 /d "/" /w %wait% /g 18 2 /d \ /g 18 3 /d "/" /w %wait% /g 19 3 /d "/" /g 19 4 /d \ /w %wait% /g 20 2 /d "/" /g 20 4 /d "_" /w %wait% /g 21 1 /d "_" /g 21 4 /d "_" /w %wait% /g 22 1 /d "_" /g 22 2 /d "_" /g 22 3 /d "_" /g 22 4 /d "_" /w %wait% /g 23 1 /d "_" /g 23 3 /d "_" /g 23 4 /d "/" /g 23 5 /d "/" /w %wait% /g 24 2 /d \ /g 24 3 /d "/" /g 24 4 /d "/" /g 24 5 /d "_" /w %wait% /g 25 3 /d "/" /g 25 5 /d "/" /w %wait% /g 26 2 /d "/" /g 26 4 /d "." /w %wait% /g 27 1 /d "_" /g 27 3 /d "/" /g 27 4 /d "_" /w %wait% /g 28 1 /d "_" /g 28 2 /d "_" /g 28 3 /d "_" /g 28 4 /d "_" /w %wait% /g 29 1 /d "_" /g 29 2 /d "_" /g 29 3 /d "/" /g 29 4 /d "_" /w %wait% /g 30 1 /d "_" /g 30 4 /d "/" /w %wait% /g 31 2 /d \ /g 31 3 /d "/" /g 31 5 /d "/" /w %wait% /g 32 3 /d "/" /g 32 4 /d \ /g 32 5 /d "_" /w %wait% /g 33 2 /d "/" /g 33 4 /d "_" /g 33 5 /d "_" /w %wait% /g 34 1 /d "_" /g 34 3 /d "/" /g 34 4 /d "_" /g 34 5 /d "_" /w %wait% /g 35 1 /d "_" /g 35 2 /d "/" /g 35 3 /d "_" /g 35 4 /d "," /g 35 5 /d "_" /w %wait% /g 36 3 /d "/" /g 36 5 /d "/" /w %wait% /g 37 2 /d "/" /g 37 4 /d "/" /w %wait% /g 38 1 /d "_" /g 38 3 /d "/" /w %wait% /g 39 1 /d "_" /g 39 2 /d "/" /g 39 3 /d "/" /g 39 4 /d \ /w %wait% /g 40 2 /d "/" /g 40 4 /d "_" /w %wait% /g 41 1 /d "/" /g 41 3 /d "/" /g 41 4 /d "_" /w %wait% /g 42 0 /d "_" /g 42 2 /d "/" /g 42 3 /d "_" /g 42 4 /d "_" /w %wait% /g 43 0 /d "_" /g 43 1 /d "_" /g 43 3 /d "/" /g 43 4 /d "_" /w %wait% /g 44 0 /d "_" /g 44 1 /d "_" /g 44 2 /d "_" /g 44 4 /d "/" /w %wait% /g 45 0 /d "_" /g 45 1 /d "_" /g 45 2 /d "_" /g 45 3 /d "/" /w %wait% /g 46 0 /d "_" /g 46 1 /d "_" /g 46 3 /d "/" /g 46 4 /d \ /w %wait% /g 47 0 /d "_" /g 47 1 /d "/" /g 47 2 /d "/" /g 47 4 /d "_" /w %wait% /g 48 1 /d "_" /g 48 3 /d "/" /g 48 4 /d "_" /w %wait% /g 49 1 /d "_" /g 49 2 /d "_" /g 49 3 /d "_" /g 49 4 /d "," /w %wait% /g 50 1 /d "_" /g 50 2 /d "_" /g 50 3 /d "/" /g 50 4 /d "_" /w %wait% /g 51 1 /d "_" /g 51 2 /d \ /g 51 4 /d "/" /w %wait% /g 52 2 /d "`" /g 52 3 /d "/" /g 52 4 /d "/" /w %wait% /g 53 1 /d "_" /g 53 2 /d "/" /g 53 3 /d "/" /g 53 4 /d "_" /w %wait% /g 54 2 /d "/" /g 54 4 /d "/" /w %wait% /g 55 1 /d "_" /g 55 3 /d "/" /w %wait% /g 56 1 /d "_" /g 56 2 /d "_" /g 56 4 /d "/" /w %wait% /g 57 1 /d "_" /g 57 2 /d "_" /g 57 3 /d "/" /g 57 4 /d "_" /w %wait% /g 58 1 /d "_" /g 58 2 /d \ /g 58 4 /d "/" /w %wait% /g 59 2 /d "`" /g 59 3 /d "/" /w %wait% /g 60 1 /d "_" /g 60 2 /d "_" /g 60 4 /d "/" /w %wait% /g 61 1 /d "_" /g 61 2 /d "_" /g 61 3 /d "/" /g 61 4 /d "_" /w %wait% /g 62 1 /d "_" /g 62 4 /d "/" /w %wait% /g 63 2 /d \ /g 63 3 /d "/" /w %wait% /g 64 3 /d "/" /g 64 4 /d \ /w %wait% /g 65 2 /d "/" /g 65 4 /d "_" /w %wait% /g 66 1 /d "_" /g 66 4 /d "_" /w %wait% /g 67 1 /d "_" /g 67 2 /d "_" /g 67 3 /d "_" /g 67 4 /d "_" /w %wait% /g 68 1 /d "_" /g 68 3 /d "_" /g 68 4 /d "/" /w %wait% /g 69 2 /d \ /g 69 3 /d "/" /g 69 4 /d "/" /w %wait% /g 70 3 /d "(" /g 70 4 /d "_" /w %wait% /g 71 2 /d "/" /g 71 3 /d "_" /g 71 4 /d "_" /w %wait% /g 72 1 /d "_" /g 72 3 /d "_" /g 72 4 /d "_" /w %wait% /g 73 1 /d "_" /g 73 2 /d "_" /g 73 4 /d "_" /w %wait% /g 74 1 /d "_" /g 74 2 /d "_" /g 74 4 /d "/" /w %wait% /g 75 1 /d "_" /g 75 2 /d "_" /g 75 3 /d ")" /w %wait% /g 76 1 /d "_" /g 76 2 /d "/" /g 18 8 /c 0x02 /d "Centrum gier i programow - By CreepyNinja" %IntroMessage% /h 1 /c 0x0F /w 2000
:MenuInit
if defined IntroMessage ping localhost -n 2 >nul
echo. 2>nul >"%temp%\bridgem"  || goto MenuIntro
cls
set Version=v1.1.0

::Sekcja makr
set Macro_Loading=if not defined launch cls^&batbox.exe /h 0 /o 0 0 /w 150 /d "------------------------------------------------------------------" /w 50 /g 0 0 /d "                                                                  " /g 0 1 /d "------------------------------------------------------------------" /w 50 /g 0 1 /d "                                                                  " /g 1 1 /d "Trwa ladowanie programu @Program@, prosze czekac..." /g 0 2 /d "------------------------------------------------------------------" /w 50 /g 0 2 /d "                                                                  " /g 0 3 "------------------------------------------------------------------" /w 50 /g 0 3 /d "[                                                                ]" /g 0 4 /d "==================================================================" /g 1 3 /c 0x04 /d "#####################" /c 0x06 /d "######################" /c 0x02 /d "#####################" /w 150 /c 0x0C /g 1 3 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /c 0x0E /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /c 0x0E /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /c 0x0A /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /c 0x0A /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 300 /c 0x0F /g 0 4 /d "                                                                  " /g 0 3 /d "------------------------------------------------------------------" /w 50 /g 0 3 /d "                                                                  " /g 0 2 /d "------------------------------------------------------------------" /w 50 /g 0 2 /d "                                                                  " /g 0 1 /d "------------------------------------------------------------------" /w 50 /g 0 1 /d "                                                                  " /g 0 0 /d "------------------------------------------------------------------" /w 50 /g 0 0 /d "                                                                  " /w 150 /h 1 /c 0x07^&cls

:MenuConfig1
set CfgID=1
setlocal
set "WelcomeText= Witaj w centrum gier i program¢w CreepyGames(TM)^^^^^! Wybierz opcje:"

set Col1=30
set Col2=31

set MenuEntityCount=5
set Menu1Count=3
set Menu2Count=4
set Menu3Count=3
set Menu4Count=0
set Menu5Count=0

set Menu1Name=Gry wszelakiego rodzaju
set Menu2Name=Programy
set Menu3Name=Inne
set Menu4Name=About CreepyGames
set Menu5Name=Wyjd«

set Menu4Do0=call :MenuAbout
set Menu5Do0=goto MenuExit

set Menu1Name1=MineSweeper
set Menu1Name2=Wisielec
set Menu1Name3=BatCraft (By Mac)
set Menu1Do1=call :MS_Init
set Menu1Do2=call :WS_Init
set Menu1Do3=call :XX_BatCraft

set Menu2Name1=CreepyChess
set Menu2Name2=Administrative Tools
set Menu2Name3=Baza Danych
set Menu2Name4=Pic Editor (By Honguito89)
set Menu2Do1=call :CC_Init
set Menu2Do2=call :AT_Init
set Menu2Do3=call :DB_Init
set Menu2Do4=call :PE_Init

set Menu3Name1=Batch of Pi
set Menu3Name2=Test Samples
set Menu3Name3=Zbi¢r szyfr¢w
set Menu3Do1=call :PI_BatchOfPi
set Menu3Do2=call :MenuConfig2
set Menu3Do3=call :SZ_Init

goto MenuAutoConfig

:MenuConfig2
set CfgID=2
setlocal
set "WelcomeText=    Zbi¢r r¢¾norakich, mniejszych program¢w. Rozejrzyj si© ;)"

set Col1=30
set Col2=31

set MenuEntityCount=5
set Menu1Count=2
set Menu2Count=2
set Menu3Count=2
set Menu4Count=2
set Menu5Count=0

set Menu1Name=Internet Check
set Menu2Name=Wyr¢wnywanie tekstu
set Menu3Name=UAC_Ask (By Cyc0S)
set Menu4Name=Hybrid Menu
set Menu5Name=-= Wr¢† do menu =-

set Menu1Name1=Odpal program
set Menu1Name2=Poka¾ kod programu
set Menu2Name1=Odpal program
set Menu2Name2=Poka¾ kod programu
set Menu3Name1=Odpal program
set Menu3Name2=Poka¾ kod programu
set Menu4Name1=Odpal program
set Menu4Name2=Poka¾ kod programu
set Menu1Do1=call :XX_TestSamples Internet_Check.bat
set Menu1Do2=call :XX_TestSamples Internet_Check.bat Code
set Menu2Do1=call :XX_TestSamples Text_to_Right.bat
set Menu2Do2=call :XX_TestSamples Text_to_Right.bat Code
set Menu3Do1=call :XX_TestSamples UAC_Ask.bat
set Menu3Do2=call :XX_TestSamples UAC_Ask.bat Code
set Menu4Do1=call :XX_TestSamples Hybrid_Menu.bat
set Menu4Do2=call :XX_TestSamples Hybrid_Menu.bat Code

set Menu5Do0=goto :EOF

goto MenuAutoConfig


:: Pocz¹tek skryptu TouchMenu/HybridMenu ::
:MenuAutoConfig
cls
chcp 852>nul
set /a MenuEntityCount=MenuEntityCount
if %MenuEntityCount% LEQ 0 (
	1>&2 echo ERROR: Var 'MenuEntityCount' ^<=0
	1>&2 echo.
	1>&2 echo Program will be closed immediately.
	exit /b 1
)
if not defined color set color=0F
color %color%
cd /d "%MDIR%"
pushd "%Temp%"
if %Col1% GTR 50 set Col1=50
if %Col2% GTR 50 set Col2=50
set /a Cols=Col1+Col2+5
if %Cols% LSS 32 set Cols=32
title CreepyGames - Centrum gier i program¢w (%Version%)
set "B=                                                  "
set MenuActive=0
if /i "%notouch%"=="YES" goto MenuHybridAutoConfig

set /a Lines=MenuEntityCount*4 +4
set x=0
set Menu0Get=2
for /l %%a in (1,1,%MenuEntityCount%) do set /a a=4+4*(!Menu%%aCount!+%%a-1)&(if !a! GTR !Lines! set Lines=!a!)&set /a x+=4&set /a Menu%%aGet=!x!+2
set /a TextLines=Lines-3
for /l %%a in (0,1,%TextLines%) do set "Line%%a= "
set /a ColGet1=Col1+2
set /a ColGet2=Col2+ColGet1+1
set /a C=Cols/2 -14
set TitleText=-= CreepyNinja_ Touch Menu =-
set "A=ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ"
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
set "Line0=Ä"
for /l %%a in (1,1,%TextLines%) do set "Line%%a= "
set "A=ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ"
mode con cols=%Cols% lines=%Lines%
goto MenuHybrid

:Menu
cls
set ok=0
echo.[0;1;40;32m[0;%C%H%TitleText%
echo.[0;1;40;33m%WelcomeText%[0;1;40;36m
echo  É!A:~0,%Col1%!»%Line1:~1%
set x=1
for /l %%a in (1,1,%MenuEntityCount%) do (
	call :Menu1 %%a
)
set /a x+=1
for /l %%a in (%x%,1,%TextLines%) do echo. !B:~0,%Col1%! !Line%%a!
<nul set /p ="[0;1;40;37m
:MenuGetInput
"%MDIR%batbox.exe" /m >bridgem 2>nul || goto MenuSessionConflict
for /f "tokens=1,2,3 delims=:" %%a in (bridgem) do (
	set X=%%a
	set Y=%%b
)
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
set "Line= !Menu%1Name!                                                 "
set /a x+=1
echo  º!B:~0,%Col1%!º!Line%x%:~1!
set /a x+=1
if !Menu%1Count! EQU 0 (if "!Menu%1Do0!"=="" (set y=) else (set y=1;)) else set y=1;
echo  º[0;%Y%40;37m!Line:~0,%Col1%![0;1;40;36mº!Line%x%:~1!
set /a x+=1
echo  º!B:~0,%Col1%!º!Line%x%:~1!
set /a x+=1
if "%1"=="%MenuEntityCount%" (echo  È!A:~0,%Col1%!¼!Line%x%:~1!) else (echo  Ì!A:~0,%Col1%!¹!Line%x%:~1!)
goto :EOF
:Menu2
set /a d=%1-1
if %Y% GTR !Menu%d%Get! (if %Y% LSS !Menu%1Get! (if !Menu%1Count! LSS 1 (exit /b 1) else (
	set ok=1
	for /l %%a in (1,1,%TextLines%) do set "Line%%a= "
	if "%MenuActive%"=="%1" set MenuActive=0&goto :EOF
	set /a "X=4*(%1-1) +1"
	set line!X!=É!A:~0,%Col2%!»
	for /l %%a in (1,1,!Menu%1Count!) do (
		set /a D=%%a-1
		set "Line= !Menu%1Name%%a!                                                 "
		set /a x+=1
		set Menu%1Get!D!=!X!
		set Line!x!=º!B:~0,%Col2%!º
		set /a x+=1
		if "!Menu%1Do%%a!"=="" (set y=) else (set y=1;)
		set Line!x!=º[0;!Y!40;37m!Line:~0,%Col2%![0;1;40;36mº
		set /a x+=1
		set Line!x!=º!B:~0,%Col2%!º
		set /a x+=1
		if "%%a"=="!Menu%1Count!" (set Line!x!=È!A:~0,%Col2%!¼) else (set Line!x!=Ì!A:~0,%Col2%!¹)
		set /a Menu%1Get%%a=!x!+1
	)
	set MenuActive=%1
)))
exit /b 0
:Menu3
set /a d=%1-1
if %Y% GTR !Menu%MenuActive%Get%d%! (if %Y% LSS !Menu%MenuActive%Get%1! exit /b 1)
exit /b 0

:MenuHybrid
cls
echo.[0;1;40;32m[0;%C%H%TitleText%
echo.[0;1;40;33m%WelcomeText%
echo.
set x=!Line0:~0,%col2%!!A:~0,%col2%!
echo  Ä!A:~0,%col1%!ÂÄ!x:~0,%col2%!
for /l %%a in (1,1,%MenuEntityCount%) do (
	echo  !B:~0,%col1%![0;1;40;33m ³
	set x=%%a^) !Menu%%aName!!B:~0,%col1%!
	echo  [0;1;40;37m!x:~0,%col1%![0;1;40;33m ³ [0;1;40;37m!Line%%a:~0,%col2%!
)
if !TextLines! GTR !MenuEntityCount! (
	set /a y=MenuEntityCount+1
	for /l %%a in (!y!,1,!TextLines!) do (
		echo  !B:~0,%col1%![0;1;40;33m ³
		echo  !B:~0,%col1%! ³ [0;1;40;37m!Line%%a:~0,%col2%!
	)
)
echo  !B:~0,%col1%![0;1;40;33m ³
echo  Ä!A:~0,%col1%!ÁÄ!A:~0,%col2%![0;1;40;37m
set cho=
set /p "cho=> "
for /l %%a in (1,1,%MenuEntityCount%) do (
	if "%cho%"=="%%a" (
		if !Menu%%aCount! LEQ 0 (
			set result=!Menu%%aDo0!
		) else (
			set "Line0=Ä"
			for /l %%A in (1,1,%TextLines%) do set "Line%%A= "
			if "%MenuActive%"=="%%a" set MenuActive=0&goto MenuHybrid
			set Line0=!Menu%%aName:~0,%col2%!:
			for /l %%A in (1,1,!Menu%%aCount!) do (
				set Line%%A=!Letters:~%%A,1!^) !Menu%%aName%%A!
				set Line%%A=!Line%%A:~0,%col2%!
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

:MenuLaunch
popd&endlocal&%Result%&cls&goto MenuConfig%CfgID%

:MenuShortcutLaunch
if defined launch (
	1>&2 echo ERROR: Too many arguments.
	1>&2 echo.
	1>&2 call :MenuShortcutUsage
	exit /b 1
)
if /i "%~1"=="MineSweeper" (set "launch=call :MS_Init") else (
	if /i "%~1"=="Wisielec" (set "launch=call :WS_Init") else (
		if /i "%~1"=="BatCraft" (set "launch=call :XX_BatCraft") else (
			if /i "%~1"=="CreepyChess" (set "launch=call :CC_Init") else (
				if /i "%~1"=="BatchOfPi" (set "launch=call :PI_BatchOfPi") else (
					if /i "%~1"=="AdminTools" (set "launch=call :AT_Init") else (
						if /i "%~1"=="BazaDanych" (set "launch=call :DB_Init") else (
							if /i "%~1"=="PicEditor" (set "launch=call :PE_Init") else (
								if /i "%~1"=="Szyfry" (set "launch=call :SZ_Init") else (
									1>&2 echo ERROR: Invalid program to launch.
									1>&2 echo.
									1>&2 call :MenuShortcutUsage
									exit /b 1
)))))))))
exit /b 0

:MenuAbout
cls
echo.
echo   CreepyGames(TM) %Version% - centrum gier i program¢w
echo.
echo   Program ten zbiera wszystkie gry i programy napisane przez
echo   usera CreepyNinja_ (czyli mnie :D), a tak¾e te napisane
echo   przez innych u¾ytkownik¢w z forum CMDTeam.
echo.
echo   Jestem wielce otwarty na propozycje zmian, dodania nowych gier,
echo   program¢w itp.  Ku temu sˆu¾y przecie¾ ten program -
echo   zbiera wszystkie programiki do jednego ;)
echo.
echo   CreepyGames(TM) By CreepyNinja_  All Rights Reserved
echo   Zapraszam r¢wnie¾ na forum CMDTeam.esy.es, gdzie
echo   znajdziecie WI¨CEJ batchowych wytwor¢w. Pozdro :P
echo.[0;1;40;36m
if defined notouch (echo.&echo   Kliknij dowolny klawisz, aby kontynuowa†...&pause>nul&goto :EOF)
echo.  ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo   º                                                            º
echo   º      [0;1;40;37mKliknij gdziekolwiek, by wr¢ci† do gˆ¢wnego menu[0;1;40;36m      º
echo   º                                                            º
echo   ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
"%MDIR%batbox" /m >"%Temp%\bridgem" 2>nul || (echo Moduˆ BatBox.exe niedost©pny. Kliknij cokolwiek, aby wr¢ci† do menu...&pause>nul)
goto :EOF

:MenuShortcutUsage
echo Uzycie: %~nx0 [parametr1] [parametr2] ...
echo.
echo  -l, --launch ^<program^>  Uruchamia wybrany program.
echo.
echo      Dost©pne programy:  MineSweeper
echo                          Wisielec
echo                          BatCraft
echo                          CreepyChess
echo                          BatchOfPi
echo                          AdminTools
echo                          BazaDanych
echo                          PicEditor
echo.
echo          -n, --notouch   Zast©puje Touch Menu tradycyjnym menu.
echo            -t, --touch   Czynno˜† odwrotna do '--notouch' (domy˜lne)
echo.
echo           -r, --return   Powraca do menu po u¾yciu parametru '--launch'
goto :EOF

:MenuExit
cls
del "%Temp%\bridgem" >nul 2>&1
batbox.exe /h 0 /w 50 /c 0x0F /o 3 1 /g 0 0 /d "D" /w %wait1% /g 1 0 /d "o" /w %wait1% /w %wait1% /g 3 0 /d "z" /w %wait1% /g 4 0 /d "o" /w %wait1% /g 5 0 /d "b" /w %wait1% /g 6 0 /d "a" /w %wait1% /g 7 0 /d "c" /w %wait1% /g 8 0 /d "z" /w %wait1% /g 9 0 /d "e" /w %wait1% /g 10 0 /d "n" /w %wait1% /g 11 0 /d "i" /w %wait1% /g 12 0 /d "a" /w %wait1% /g 13 0 /d "^!" /h 1 /w 1500 /h 0 /g 0 0 /d " " /w %wait1% /g 1 0 /d " " /w %wait1% /w %wait1% /g 3 0 /d " " /w %wait1% /g 4 0 /d " " /w %wait1% /g 5 0 /d " " /w %wait1% /g 6 0 /d " " /w %wait1% /g 7 0 /d " " /w %wait1% /g 8 0 /d " " /w %wait1% /g 9 0 /d " " /w %wait1% /g 10 0 /d " " /w %wait1% /g 11 0 /d " " /w %wait1% /g 12 0 /d " " /w %wait1% /g 13 0 /d " " /o 0 0 /g 0 0 /h 1 /w 100
color 07
title %comspec%
mode 80,30
exit /b 0

:MenuSessionConflict
if not exist "%MDIR%batbox.exe" call :BatBox "FIX"&goto Menu
cls
echo Program jest juz uruchomiony w innym oknie,
echo co prowadzi do kofliktu sesji.
echo Zamknij inne okna programu i spr¢buj ponownie.
pause>nul
echo. 2>nul >"%temp%\bridgem" || (cls&exit /b 32)
goto Menu
:: Koniec skryptu TouchMenu/HybridMenu ::


:BatBox
pause
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
 Cscript /b /e:vbs t.dat>batbox.ex_
 Del /f /q /a t.dat >nul 2>&1
 Expand -r batbox.ex_ >nul 2>&1
 Del /f /q /a batbox.ex_ >nul 2>&1
if /i "%~1"=="FIX" copy batbox.exe "%MDIR%"&del batbox.exe
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


:: Pocz¹tek gry MineSweeper ::
:MS_Init
setlocal enabledelayedexpansion enableextensions
set Program=MineSweeper
%Macro_Loading:@=!%
cd /d "%MDIR%"
if not exist batbox.exe call :batbox
set /a color1=0,color2=7
color %color1%%color2%

:MS_Resize
mode con cols=75 lines=40&title MineSweeper v1.3.0 by CreepyNinja

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
echo            #..     ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»#%%%%%%#(/(
echo        %%%%##(((.    ºWitaj w grze Saper. Wybierz opcje:º#%%%%%%#((((##%^&
echo  (/**,,.......*.   ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹#%%%%%%#/     ....,*/(
echo    ##/*,..   .,.   º 1) Graj                          º%%%%%%%%#(     .,*(##
echo      #%%%%##(/**,....º 2) Zmieä kolor tˆa               º%%%%%%%%##,,*/(#%%%%
echo         #%%%%%%/*,,,..º 3) Zmieä kolor tekstu            º%%%%%%##(###%%%%
echo          (,,**,,,,,º Q) Wyjd«                         º%%%%###((((/( 
echo        %%##*,**/(/*,ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼%%%%%%%%##((/**/(#^&
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
echo               ,^&@@@@@ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»,,*/(*            
echo          ,*//((#(^&@@@ºWybierz poziom trudno˜ci:º,,,####(/**.      
echo         ,/#^&@@@@%%^&@@@ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹,,*%%@@@@@^&(*      
echo           *,,*/(%%%%^&^&^&º 1) Pocz¥tkuj¥cy         º,,*/#(/*,*        
echo              (,#%%%%%%%%^&º 2) —rednio-zaawansowany º,**//,,           
echo             *(%%##//#%%º 3) Ekspert              º,**/(#(*.         
echo          *****%%*(^&@@@º 4) Niestardardowy       º**/(#%%#(((/       
echo        *,,,,,,^&@@^&%%##ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼*//(%%%%*/////(*
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
set /p PlayX=Podaj dˆugo˜† planszy (do 40): || goto MS_SelectOwn
for /f "tokens=2* delims=0123456789" %%A in (" 0%PlayX%") do if not ""=="%%A" goto MS_SelectOwn
if %PlayX% LSS 9 goto MS_SelectOwn
if %PlayX% GTR 40 goto MS_SelectOwn
echo.
set PlayY=
set /p PlayY=Podaj szeroko˜† planszy (do 40): || goto MS_SelectOwn
for /f "tokens=2* delims=0123456789" %%A in (" 0%PlayY%") do if not ""=="%%A" goto MS_SelectOwn
if %PlayY% LSS 9 goto MS_SelectOwn
if %PlayY% GTR 40 goto MS_SelectOwn
echo.
set /a min=PlayX*PlayY/6
set /a max=PlayX*PlayY/3
set /p Mines=Podaj ilo˜† min (min. %min%, max. %max%): || goto MS_SelectOwn
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
echo Ú!line0!¿
echo !Line1!     !XLine1!
for /L %%Y in (3,2,%PlayY%) do (
	call :MS_View1 %%Y
)
set /p "=À!line0!Ù"<nul
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
echo Czekaj, trwa ˆadowanie...
pushd "%temp%"
set xline1=ÉÍÍÍÍÍÍÍÍÍÍÍÍÍ»
set xline2=ºClick to flagº
set xline3=º°°°°°°°°°°°°°º
set xline4=º°°°°°°°°°°°°°º
set xline5=ÌÍÍÍÍÍÍÍÍÍÍÍÍÍ¹
set xline6=º MineSweeper º
set xline7=º   Game by:  º
set xline8=º CreepyNinja º
set xline9=ÈÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
set field=- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
set field1=ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
set "field2=                                                                               "
set Line0=!field1:~0,%PlayX%!
set Line0a=³!field2:~0,%PlayX%!³

for /L %%Y in (1,2,%PlayY%) do (
	for /L %%x in (1,2,%PlayX%) do (
		set x%%xY%%Y=-
	)
	set Line%%Y=³!field:~0,%PlayX%!³
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
"%MDIR%batbox.exe" /m >bridge 2>nul || (if not exist "%MDIR%batbox.exe" (call :Batbox FIX) else (cls&echo Gra jest uruchomiona w innym oknie,&echo co prowadzi do kofliktu sesji.&echo Zamknij inne okna programu i spr¢buj ponownie.&pause>nul)&goto MS_GetInput)

set x=0
set y=0
for /f "tokens=1,2,3 delims=:" %%a in (bridge) do (
	set X=%%a
	set Y=%%b
	if not "%noflag%"=="ON" if "%%c"=="2" (set flag=ON) else (if "%%c"=="4" (set flag=ON) else set flag=OFF)
)
if "!x%x%y%y%!"=="x" goto MS_Flag
if "!x%x%y%y%!"=="-" (if not "%flag%"=="ON" (goto MS_Check) else (goto MS_FlagP))
if "!x%x%y%y%!"=="F" if "%flag%"=="ON" goto MS_DeFlagP
goto MS_GetInput1

:MS_Flag
if "%flag%"=="ON" (set xline3=º°°°°°°°°°°°°°º&set xline4=º°°°°°°°°°°°°°º&set flag=OFF&set noflag=OFF) else (set xline3=º²²²²²²²²²²²²²º&set xline4=º²²²²²²²²²²²²²º&set flag=ON&set noflag=ON)
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
set xline2=ºYou did it :Dº
set xline3=º   You won   º
set xline4=ºTime: %GameTime%º
goto MS_Restart

:MS_Lose
call :MS_Timer time
for /L %%X in (1,1,%Mines%) do (
	for /F "tokens=1,2 delims=XY" %%x in ("!M%%X!") do (
		set /a x=%%x,y=%%y,xa=%%x+1
		call :MS_RevealMines
	)
)
set xline2=ºYou failed...º
set xline3=º             º
set xline4=ºTry again. ;)º

:MS_Restart
title MineSweeper - Time: %GameTime%
del "%Temp%\bridge" >nul 2>&1
set xline6=º* Type R to *º
set xline7=º*  Restart  *º
set xline8=º* The  Game *º
call :MS_View
endlocal
popd
"%MDIR%batbox.exe" /k
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


:: Pocz¹tek gry Wisielec ::
:WS_Init
setlocal enabledelayedexpansion enableextensions
set Program=Wisielec
%Macro_Loading:@=!%
cd /d "%MDIR%"
set FirstLetter=OFF
set MoreTries=OFF
set "title=Wisielec v1.1.1 by CreepyNinja"
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
echo  ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo  ºWitaj w grze Wisielec. Wybierz opcje:º
echo  ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹
echo  º 1) Graj                             º
echo  º 2) Zmieä kolor tˆa                  º
echo  º 3) Zmieä kolor tekstu               º
echo  º 4) Modyfikuj uˆatwiacze             º
echo  º Q) Wyjd«                            º
echo  ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo  ___________..___________________________³ .__________))__________________________³ ³ / /      ³³
echo ³ ³/ /       ³³
echo ³ ³ /        ³³.-''.
echo ³ ³/         ³/  _  \
echo ³ ³          ³^|  `/,^|   ÉÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo ³ ³          (\\`_.'    º Wins:  %WinsSee%º
echo ³ ³         .-`--`.     º Loses: %LosesSee%º
echo ³ ³        /Y . . Y\    ÈÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo ³ ³       // ^|   ^| \\
echo ³ ³      //  ^| . ^|  \\
echo ³ ³     ')   ^|   ^|   ('
echo ³ ³          ^|^|'^|^|
echo ³ ³          ^|^| ^|^|
echo ³ ³          ^|^| ^|^|
echo ³ ³          ^|^| ^|^|
echo ³ ³         / ^| ^| \
echo ³ ³         `-' '-`
echo ³ ³
set cho=
set /p "cho=³_³> " || goto WS_Menu
if "%cho%"=="1" goto WS_Select
if "%cho%"=="2" call :Color 1
if "%cho%"=="3" call :Color 2
if "%cho%"=="4" goto WS_Cheats
if /i "%cho%"=="Q" endlocal&exit /b 0
goto WS_Menu

:WS_Cheats
cls
mode con cols=41 lines=12
echo.
echo  ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo  º Uˆatwiacze pomagaj¥ odgadywa† sˆowa º
echo  º Zwi©kszenie liczby pr¢b jest jednak º
echo  º OSZUSTWEM - wyniki nie bed¥ liczone º
echo  ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo   1) Podawaj pierwsz¥ liter© sˆowa [%FirstLetter%]
echo   2) Zwi©ksz liczb© pr¢b do 16 [%MoreTries%]
echo   3) Wr¢† do menu
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
echo       ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍ»
echo       º    Wybierz kategori©:    º  º
echo       ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹  º
echo       º 1) Warzywa i owoce       º  º^^!
echo       º 2) Urz¥dzenia RTV i AGD  º (_)
echo       º 3) Paästwa/Miasta        º \^|/
echo       º 4) Ro˜liny               º  ^|
echo       º 5) Zwierz©ta             º / \
echo       º 6) -= Wybierz losowo =-  º
echo       º                          º 
echo       º 7) Wˆasne (slownik.txt)  º
echo       º 8) Ze sˆownika SJP.pl    º ÍËÍ
echo       º 9) Gra 1v1               º  º
echo       º                          º  ³
echo       º Q) Wr¢† do menu          º  ³
echo       ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍ¼
set cho=
set /p "cho=> " || goto WS_Select
for /L %%# in (1,1,9) do (if "%cho%"=="%%#" set CategoryID=%%#&goto WS_Select%%#)
if /i "%cho%"=="Q" goto WS_Resize
goto WS_Select

:WS_Select1
cls
set Category=Warzywa i owoce
goto WS_RandomWord

:WS_Select2
cls
set Category=Urz¥dzenia RTV i AGD
goto WS_RandomWord

:WS_Select3
cls
set Category=Paästwa i Miasta
goto WS_RandomWord

:WS_Select4
cls
set Category=Ro˜liny
goto WS_RandomWord

:WS_Select5
cls
set Category=Zwierz©ta
goto WS_RandomWord

:WS_Select6
set CatCount=5
set /a Rand=%random% %% %CatCount% +1
goto WS_Select%Rand%

:WS_Select7
cls
set Category=Wˆasne
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
set "File=%Category: =_%.txt"
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
for /f "delims=Aa¤¥BbCc†DdEe¨©FfGgHhIiJjKkLlˆMmNnãäOoà¢PpQqRrSs—˜TtUuVvWwXxYyZz«½¾ " %%A in ("%Pass%") do if not ""=="%%A" echo Sˆowo wylosowane zawiera niedozwolone znaki ("%Pass%")^^!&echo Wylosuj sˆowo ponownie.&pause>nul&goto WS_Select
if "%Pass:~2,1%"=="" echo Wylosowane sˆowo jest za kr¢tkie^^!&echo Wylosuj sˆowo ponownie.&pause>nul&goto WS_Select
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
title Wisielec - (%X%) %Word:#=!%
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
echo Zgadnij sˆowo: %Word:#=!%
echo Kategoria: %Category%
if defined EOG goto WS_EOG%eog%
if [%Tries%]==[1] (set /p "=Ostatnia szansa^!"<nul) else (set /p "=Pozostaˆo %Tries% pr¢b."<nul)
echo  Ostatnio: %Dialog%
echo.
echo P¢ki co "zgadˆe˜" nast©puj¥ce litery:%Guesses%
echo.
set Guess=
set /p Guess=Wpisz kolejn¥ liter© lub "Zgaduj", by odgadn¥† caˆe sˆowo: || goto WS_Guess
for /f "delims=Aa¤¥BbCc†DdEe¨©FfGgHhIiJjKkLlˆMmNnãäOoà¢PpQqRrSs—˜TtUuVvWwXxYyZz«½¾" %%A in ("%Guess:~0,1%") do if not ""=="%%A" goto WS_Guess
if /i "%Guess%"=="Q" goto WS_GuessExit
if /i "%Guess%"=="Zgaduj" goto WS_GuessWord
set "Guess=%Guess:~0,1%"
if not "!Guesses:%Guess%=!"=="!Guesses!" set /p "=Ju¾ zgadywaˆe˜ t¥ liter©..."<nul&pause>nul&goto WS_Guess

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
set Dialog=NIE trafiˆe˜.
set /a OldScore=Score
if %Tries% GTR 10 goto WS_Guess
goto WS_Update%Tries%
:WS_GotLetter
set X=+
if %Score% GTR %LCount% set EOG=2&goto WS_Guess
set Dialog=Zgadˆe˜.
set /a OldScore=Score
goto WS_Guess

:WS_GuessWord
set /p Guess=Sˆowo brzmi 
if /i "%Guess%"=="%Pass%" (
	for /l %%# in (0,1,%LCount%) do (
		if "!S%%#!"=="_" set S%%#=!L%%#!
	)
	set /a Score=LCount+1
)
goto WS_Check

:WS_GuessExit
set cho=
set /p cho=Na pewno chcesz opu˜ci† gr©? (T/N) 
if /i "%cho%"=="T" set EOG=1&goto WS_Guess
if /i "%cho%"=="Y" set EOG=1&goto WS_Guess
if /i "%cho%"=="N" goto WS_Guess
goto WS_GuessExit

:WS_EOG1
echo.
echo Niestety przegraˆe˜ !Name%PvPTurn%!...
echo Sˆowem do odgadni©cia byˆo: "%Pass%".
if not "%PvPMode%"=="ON" (if not "%MoreTries%"=="ON" (set /a Loses+=1))
goto WS_Restart

:WS_EOG2
echo.
echo Wygraˆe˜ !Name%PvPTurn%!^^!
echo Zgadˆe˜ sˆowo "%Pass%" za %Tried% razem^^!
if not "%PvPMode%"=="ON" (if not "%MoreTries%"=="ON" (set /a Wins+=1))

:WS_Restart
title %title%
if "%PvPMode%"=="ON" (goto WS_NextRound)
endlocal&set Wins=%Wins%&set Loses=%Loses%&call :WS_SaveStats
echo.
set cho=
set /p cho=Czy chcesz zagra† ponownie? (T/N) 
if /i "%cho%"=="T" goto WS_Select%CategoryID%
if /i "%cho%"=="Y" goto WS_Select%CategoryID%
if defined Name1 (set Name1=&set Name2=&set PvPTurn=)
goto WS_Resize

:WS_NextRound
endlocal&if "%EOG%"=="2" set /a Name%PvPTurn%Score+=1
echo.
echo Obecne wyniki:
echo - %Name1%: %Name1Score%
echo - %Name2%: %Name2Score%
echo.
echo Aby zakoäczy† rozgrywki, wpisz 'Q', lub nie wpisuj nic, aby gra† dalej
set sel=
set /p "sel=Wyb¢r: "
if /i "%sel%"=="Q" goto WS_EndPvP
if "%PvPTurn%"=="1" (set PvPTurn=2) else (set PvPTurn=1)
goto WS_PrepareWord

:WS_Update10
set "Graph2= ________________________________"
set "Graph1=[________________________________]"
goto WS_Guess
:WS_Update9
set "Graph5=³³"
set "Graph3=³³"
set "Graph2=³\_%Graph2:~3%
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
echo Teraz grasz/gracie w trybie gry "1v1", gdzie jedna osoba pisze sˆowo
echo do odgadni©cia, za˜ druga ma za zadanie je odgadn¥†. Proste, nie? :P
echo Aby wyj˜† z kreatora gry, wci˜nij 'Q'.
echo.
echo Prosimy o podanie swoich imion:
echo.
set Name1=
set /p "Name1=Imi© pierwszego gracza: " || goto WS_Select9
if /i "%Name1%"=="Q" goto WS_Select
echo.
:WS_Select9A
set Name2=
set /p "Name2=Imi© drugiego gracza: " || goto WS_Select9
if /i "%Name1%"=="Q" goto WS_Select
echo.
echo Teraz niech %Name2% si© odwr¢ci...
echo.
set /p "=Kliknij cokolwiek, gdy b©dziecie gotowi/e..."<nul
pause>nul

:WS_SelectOwn
set /a Name1Score=0,Name2Score=0,PvPTurn=2
set Dialog=
:WS_PrepareWord
:WS_Select8AX
cls
if not "!Dialog:~5!"=="%Pass%" set Pass=
%Dialog%
set Dialog=
echo Podaj hasˆo, kt¢re ma !Name%PvPTurn%! odgadn¥†
set /p "Pass=Wpisz 'losuj', je¾eli nie b©dziesz miaˆ pomysˆu: " || goto WS_PrepareWord
if /i "%Pass%"=="Losuj" pushd Wisielec_Files&set Route=X&echo Losuj© sˆowo...&goto WS_Download1
for /f "delims=Aa¤¥BbCc†DdEe¨©FfGgHhIiJjKkLlˆMmNnãäOoà¢PpQqRrSs—˜TtUuVvWwXxYyZz«½¾ " %%A in ("%Pass%") do if not ""=="%%A" set "Dialog=echo Hasˆo zawiera niedozwolone znaki."&goto WS_PrepareWord
if "%Pass:~2,1%"=="" set "Dialog=echo Hasˆo jest za kr¢tkie."&goto WS_PrepareWord
:WS_PrepareWord2
cls
set Category=
set /p "Category=Podaj kategori© sˆowa (dla uˆatwienia zgaduj¥cemu): " || goto WS_PrepareWord2

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
set "PvPDialog=echo Twoja kolej, !Name%PvPTurn%!.
goto :EOF

:WS_EndPvP
echo.
echo.
echo Oto wyniki...
set PvPMode=OFF
setlocal
if %Name1Score% GTR %Name2Score% (set Winner=1&goto WS_EndPvP1) else (if %Name2Score% GTR %Name1Score% set Winner=2&goto WS_EndPvP1)

:WS_EndPvP0
echo Mamy remis^^!^^! (Wynik: %Name1Score% - %Name2Score%)
echo.
echo C¢¾, i tak bywa :)
goto WS_Restart

:WS_EndPvP1
echo !Name%Winner%! wygrywa^^!^^! (Wynik: %Name1Score% - %Name2Score%)
echo.
echo Szczere gratulacje z mojej strony :P
echo Ale pami©tajmy, ¾e to tylko gra - raz si© wygrywa, raz si© przegrywa.
goto WS_Restart

:WS_Select8
set Route=
mode con cols=70 lines=30
pushd Wisielec_Files
set DownloadTip0=A jest ich du¾o, bo a¾ 150 tysi©cy sˆ¢wek^^! (stan na 29/03/15)
set DownloadTip1=Wymagany jest: Internet, moduˆ wget.exe i m¢zg :P
set DownloadTip2=Nie zapisze je w formie staˆej, bo jest ich po prostu za du¾o :(
set /a Rand=%random% %% 3

:WS_Select8A
cls
if not exist wget.exe echo Aby m¢c pobiera† dane ze sˆownika SJP, potrzebny jest moduˆ wget.exe.&echo Mo¾esz go pobra† st¥d: http://nebm.ist.utl.pt/~glopes/wget/&echo Albo pobieraj¥c paczk© z gr¥ ponownie.&pause>nul&popd&goto WS_Select
echo Program ma mo¾liwo˜† pobierania sˆ¢w do Wisielca z Internetu :D
echo Pobiera je ze strony *SJP.pl*, i to tylko takie, kt¢re zaczynaj¥
echo si© na dan¥ liter© b¥d« ci¥g znak¢w.
echo.!DownloadTip%Rand%!
echo.
echo Aby wr¢ci† do menu, wpisz 'Q'.
echo Aby wylosowa† (dosˆownie) randomowe sˆowo, wpisz '0'.
echo.
set Letter=
set /p Letter=Podaj liter©/ci¥g liter, na kt¢r¥ ma si© zacz¥† sˆowo: || goto WS_Select8A
if /i "%Letter%"=="Q" popd&goto WS_Select
set DownTries=1
cls
echo Oczekuj© na odpowied« serwera...
:WS_Download1
set Skip=96
wget.exe "http://sjp.pl/slownik/lp.phtml?f_st=%Letter%&f_en=&f_fl=-&f_msfl=-&f_mn=0&f_vl=2" -T 3 -t 1 -O SJP.html --quiet
if errorlevel 1 (if not "%DownTries%"=="3" (echo Ponawiam pr¢b© poˆ¥czenia...&set /a DownTries+=1&goto WS_Download1) else (echo Serwer nie odpowiada. Spr¢buj ponownie p¢«niej...&pause>nul&goto WS_Select8A%Route%))
set Count=0
for /f "tokens=1,4 delims=^<^> skip=%skip%" %%A in (SJP.html) do (
	if not "%%A"=="tr" goto WS_Download2
	set /a Count+=1
)
:WS_Download2
if "%Count%"=="0" echo Brak sˆ¢w zaczynaj¥cych si© na podan¥ liter© :(&pause>nul&goto WS_Select8A%Route%
set Pages=0
set /a Skip1=96+%Count%+4
for /f "tokens=1,2 skip=%skip1% delims=^<^>" %%A in (SJP.html) do (
	if "%%A"=="/p" goto WS_Download3
	set Pages=%%B
)
:WS_Download3
echo Pobieram odpowiedni plik z list¥ sˆ¢wek...
if "%Pages%"=="0" goto WS_Download4
set /a Page=%random% %% Pages +1
:WS_Download4
wget "http://sjp.pl/slownik/lp.phtml?f_st=%Letter%&f_en=&f_fl=-&f_msfl=-&f_mn=0&f_vl=2&page=%Page%" -T 3 -t 1 -O SJP.html --quiet
if errorlevel 1 (if not "%DownTries%"=="3" (echo Ponawiam pr¢b© poˆ¥czenia...&set /a DownTries+=1&goto WS_Download4) else (echo Serwer nie odpowiada. Spr¢buj ponownie p¢«niej...&pause>nul&chcp 852>nul&goto WS_Select8A%Route%))
echo Analizuj© pobrany plik...
set Count=0
for /f "tokens=1,4 delims=^<^> skip=%skip%" %%A in (SJP.html) do (
	if not "%%A"=="tr" goto WS_Download5
	set /a Count+=1
	set Pass!Count!=%%B
)
:WS_Download5
popd
set /a Rand=%random% %% Count +1
set "Pass=!Pass%Rand%!"
set "Pass=!Pass:Å‚=ˆ!"
set "Pass=!Pass:Ä‡=†!"
set "Pass=!Pass:Ä…=¥!"
set "Pass=!Pass:Å¼=¾!"
set "Pass=!Pass:Ä™=©!"
set "Pass=!Pass:Ã³=¢!"
set "Pass=!Pass:Å„=ä!"
set "Pass=!Pass:Å›=˜!"
set "Pass=!Pass:Åº=«!"
if defined route set Dialog=echo.%Pass%&goto WS_PrepareWord
set Category=Pobrane ze sˆownika SJP
goto WS_Set


:WS_Warning
cls
title %title%
echo OSTRZE½ENIE: Nie znaleziono folderu "Wisielec_Files".
echo Folder ten przechowuje m.in. sˆ¢wka do gry, moduˆ do
echo pobierania stron SJP.pl oraz preferencje uˆatwiaczy.
echo Z powodu braku sˆ¢wek do gry, granie w domy˜lnych
echo kategoriach z menu b©dzie niemo¾liwe^^!
echo.
echo Zalecamy pobra† ponownie paczk© z gr¥. W przeciwnym razie
echo mo¾liwa b©dzie tylko gra na wˆasne sˆ¢wka oraz gra 1v1.
pause>nul
goto :EOF

:WS_MissingFile
chcp 852>nul
echo Nie znaleziono pliku z list¥ sˆ¢wek^^!
echo ("%File%")
set /p "=Pobierz ponownie gr©, by naprawi† problem"<nul
pause>nul
goto WS_Select

:WS_SlownikHelp
mode con cols=76 lines=13
chcp 852>nul
set /p "="<nul >slownik.txt
echo Pomoc dla pliku Slownik.txt:
echo.
echo Plik "Slownik.txt" jest potrzebny do u¾ywania wˆasnych sˆ¢w w grze Wisielec
echo Utworzyˆem ci go ju¾, by˜ si© za bardzo nie m©czyˆ :)
echo Twoim zadaniem natomiast b©dzie:
echo.
echo 	- Wypeˆnienie pliku wpisuj¥c sˆowa linijka po linijce
echo 	- LINIJKA PO LINIJCE, nie po przecinku, ˜redniku czy cu˜^^!
echo 	- No i nie radziˆbym wpisywa† wi©kszej ilo˜ci sˆ¢w ni¾ 2500.
echo.
set /p "=To chyba tyle :P Zatem do roboty..." <nul
pause>nul
goto WS_Select
:: Koniec gry Wisielec ::


:: Pocz¹tek programu CreepyChess ::
:CC_Init
setlocal enabledelayedexpansion enableextensions
set Program=CreepyChess
%Macro_Loading:@=!%

set "location=%MDIR%CreepyChess_Files\"
cd /d "%location%"
if "%~1"=="/?" goto CC_usage
chcp 1250>nul
goto CC_begin

:CC_about
echo.&echo CreepyChess (c) by Grzegorz Kita - program do losowan szachowych&echo.&echo Program zostal specjalnie stworzony po to, by organizatorzy turniejow mogli troche odetchnac ;)&echo Jest on alternatywa dla programu ChessArbiter Pro. Nie posiada tylu funkcji co ten program, ale do zwyczajnych losowan wystarczy.&echo.&echo Zawiera takie funkcje jak:&echo.&echo 	- Dobieranie graczy na podstawie punktacji&echo 	- Prosty system przydzielania punktow&echo 	- Mozliwosc drukowania list&echo 	- Liczenie tzw. Buchholza&echo 	- Prosta nawigacja za pomoca przyciskow (modul Batch#)&echo 	- Wiele wiecej...&echo.&echo Skrypt batchowy w 100%% napisany przeze mnie. Z dedykacja dla instruktora szachowego lokalnego kola szachowego, dla ktorego program zostal stworzony.&echo.&echo CreepyChess (c) 2015 Grzegorz Kita&exit /b 0
:CC_usage
echo.&echo U¿ycie: %~nx0 [parametry]&echo 	%~nx0 [/about ^| /?]&echo.&echo Gdzie parametry to:&echo.&echo 	/title (tytul okna) - Ustawia tytul okna&echo 	/osob (liczba osob) - Ustawia liczbe osob grajacych&echo 	/rund (liczba rund) - Ustawia liczbe rund do rozegrania&echo 	/bch - Wlacza liczenie tzw. Buchholza&echo 	/print - Wlacza drukowanie list&echo 	/about - Wyswietla informacje o programie&echo.	/? - Wyswietla ten komunikat&echo.&echo Przyklady:&echo Aby ustawic liczbe osob na 10 i liczbe rund na 5:&echo 	%~nx0 /osob 10 /rund 5&echo.&echo Aby ustawic liczbe osob na 8, wlaczyc liczenie Buchholza i drukowanie:&echo 	%~nx0 /osob 8 /bch /print&exit /b 0
:CC_informacja
cls&batch# /box 2 2 "Informacja" "Zalecane jest uzycie czcionki Lucida Console korzystajac z tego programu" "Pozwala ona na wyswietlanie polskich znakow diakratycznych" "i raczej jest milsza dla oka ;)" "" "Je¿eli w tym zdaniu pojawiaj¹ siê krzaczki, to znaczy, ¿e nie u¿ywasz tej czcionki" "" "Aby ja wlaczyc: Kliknij PPM>Wlasciwosci>Zakladka *Czcionka*" "i wybierz Lucida Console" "" "$$Kliknij, aby kontynuowac"
if "%errorlevel%"=="0" goto CC_errorstdout
set info=N&goto :EOF


:CC_errorstdout
1>&2 (%str5%&echo   Opis bledu: U¿yto komendy ^>nul&echo     B¹dŸ tekst wyjœciowy jest&echo          przekierowywany&pause>nul&goto CC_errorstdout)
:CC_errorsetup
1>&2 (%str5%&echo     Opis bledu: B³¹d podczas&echo      konfiguracji programu.&echo.&pause>nul&goto CC_errorsetup)
:CC_errorlosowanie
1>&2 (%str5%&echo     Opis bledu: B³¹d podczas&echo     dobierania przeciwnikow.&echo.&pause>nul&goto CC_errorlosowanie)
:CC_errorbatch#
if exist Batch#.exe color 07&goto begin1
1>&2 (%str5%&echo    Opis bledu: Nie znaleziono&echo     wymaganego modu³u Batch#.&echo.&pause>nul&goto CC_errorbatch#)


:CC_begin
set "str5=mode con cols=33 lines=12&color 17&echo  ===============================&echo    Ups, program napotkal blad,&echo     i musi zostac zatrzymany.&echo  Jesli blad bedzie sie powtarzal&echo     powiadom tworce programu.&echo  ===============================&echo."
if not exist Batch#.exe goto CC_errorbatch#
:CC_begin1
set max_osob=100
set intro_on=ON
set print_on=OFF
set bch_on=OFF
set list_on=ON
set title=CreepyChess
set lista_graczy=Gracze.ini
if exist settings.ini (for /F "tokens=* eol=[" %%a in (settings.ini) do set %%a)
if %max_osob% LSS 3 set max_osob=50
set skip_osob=NIE USTAWIONE
set skip_rund=NIE USTAWIONE
:CC_begin2
set ver=v1.5.2
set str1=Przyznaj punkt bia³ym
set str2=Przyznaj punkt czarnym
set str3=Remis (przyznaj po pó³ punktu)
set str6=miejsce zajmuje:
set str8="" "$$[Kliknij, aby wróciæ do dzia³u pomocy]" ""
set "str9=================================================="
set str10=CreepyChess (c) %ver% by Grzegorz Kita
set str11=All Rights Reserved
set str12=CreepyChess
set "scc1=/title"
set "scc2=/osob"
set "scc3=/rund"
set "scc4=/ini"

mode con cols=93 lines=28
if /i not "%info%"=="N" call :CC_informacja
cls
title %title%
if defined skip_title goto CC_intro
set /a X=2,Y=2
:CC_title
batch# /box %X% %Y% "Tytu³" " Podaj tytu³ dla tej sesji "
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
batch# /box 2 2 "%str12%" "%str9%" "" "%str10%" "%str11%" "" "%str9%" "" "$$Zacznij turniejowanie" "" "" "$$Ustaw liczbê graczy [%skip_osob%]" "" "$$ Ustaw liczbê rund [%skip_rund%] " "" "$$Prze³¹cz liczenie Buchholza [%bch_on%]" "" "$$Prze³¹cz ustawienie drukowania [%print_on%]" "" "$$Zaawansowane ustawienia" "" "" "$$WyjdŸ z programu"
if "%errorlevel%"=="0" goto CC_errorstdout
if "%errorlevel%"=="1" (set menu=0&set X=2&goto CC_setup0)
if "%errorlevel%"=="2" (set skip_osob=NIE USTAWIONE&set skip_rund=NIE USTAWIONE&set route=S&goto CC_setup1)
if "%errorlevel%"=="3" (if "%skip_osob%"=="USTAWIONE" (set skip_rund=NIE USTAWIONE&set route=S&goto CC_setup2))
if "%errorlevel%"=="4" (if "%bch_on%"=="OFF" (set bch_on=ON) else (set bch_on=OFF))
if "%errorlevel%"=="5" (if "%print_on%"=="OFF" (set print_on=ON) else set print_on=OFF)
if "%errorlevel%"=="6" goto CC_menu2
if "%errorlevel%"=="7" call :CC_savedata&endlocal&chcp 852>nul&exit /b 0
goto CC_menu

:CC_setup2S
set skip_osob=USTAWIONE
goto CC_menu
:CC_setup3S
set skip_rund=USTAWIONE
goto CC_menu

:CC_menu2
batch# /box %X% 2 "%str12%" "$$Zmieñ tytu³ okna" "                                  " "$$Zmieñ nazwê pliku z list¹ graczy" "" "$$Prze³¹cz pokazywanie intra [%intro_on%]" "" "$$Zapisz ustawienia do pliku .ini" "" "$$[=] Dzia³ pomocy [=]" "" "$$Wróæ do g³ównego menu" ""
if "%errorlevel%"=="1" set route=goto CC_menu&set Y=18&goto CC_title
if "%errorlevel%"=="2" goto CC_menu2_1
if "%errorlevel%"=="3" (if "%intro_on%"=="ON" (set intro_on=OFF) else (set intro_on=ON))
if "%errorlevel%"=="4" call :CC_savedata
if "%errorlevel%"=="5" set skip_osob=NIE USTAWIONE&set skip_rund=NIE USTAWIONE&cls&goto CC_helpdesk
if "%errorlevel%"=="6" goto CC_menu
goto CC_menu2

:CC_menu2_1
set Y=18
batch# /box %x% %y% "%str12%" "Ustaw now¹ nazwê:" "" "[Stara: %lista_graczy%]"
set /a Y+=7
batch# /move_ %X% %Y%
set /p "lista_graczy=> "
if "%lista_graczy%"=="" goto CC_menu2_1
goto menu

:CC_savedata
>settings.ini (
echo max_osob=%max_osob%
echo intro_on=%intro_on%
echo print_on=%print_on%
echo bch_on=%bch_on%
echo list_on=%list_on%
echo info=%info%
echo title=%title%
echo lista_graczy=%lista_graczy%)
goto :EOF


:CC_setup0
if not "%menu%"=="0" goto CC_menu
cls
:CC_setup1
if "%skip_osob%"=="USTAWIONE" goto CC_setup2
set osob=
batch# /box %x% 2 "Liczba osób" "Podaj liczbê graj¹cych (do %max_osob%)"
batch# /move_ %x% 7
set /p "osob=> "
if "%osob%"=="" goto CC_setup0
for /f "delims=0123456789" %%A in ("%osob%") do if not ""=="%%A" goto CC_setup0
if %osob% LSS 3 (goto CC_setup0) else (if %osob% GTR %max_osob% (goto CC_setup0) else (goto CC_setup2%route%))
goto CC_setup0

:CC_setup2
if "%skip_rund%"=="USTAWIONE" goto CC_setup3
set rund=
set /a pauza_on=osob %% 2
if "%pauza_on%"=="1" (set max=%osob%) else set /a max=osob-1
if %max% GTR 9 set max=9
batch# /box %x% 9 "Liczba rund" "Podaj liczbê rund (do %max%, minimum 3)"
batch# /move_ %x% 14
set /p "rund=> "
if "%rund%"=="" goto CC_setup0
for /f "tokens=2* delims=0123456789" %%A in (" 0%rund%") do if not ""=="%%A" goto CC_setup0
if %rund% LSS 3 (goto CC_setup0) else (if %rund% GTR %max% (goto CC_setup0) else (goto CC_setup3%route%))
goto CC_setup0

:CC_setup3
if "%osob%"=="%rund%" (if "%pauza_on%"=="1" cls&batch# /box 2 2 "UWAGA" "Ustawiono (nieparzyst¹) liczbê rund tak¹ sam¹ jak liczba osób" "Bardzo prawdopodobne, ¿e przy n-tym losowaniu wyst¹pi b³¹d" "krytyczny z powodu braku mo¿liwoœci dalszych losowañ" "" "Na pewno chcesz kontynuowaæ?" "" "$$Tak" "" "$$Nie")
if "%errorlevel%"=="2" set skip_osob=NIE USTAWIONE&set skip_rund=NIE USTAWIONE&goto CC_setup0
for /L %%i in (1,1,%osob%) do set /a p%%i=0,p%%ib=0

:CC_setup4
set /a a=0,b=0
if exist "%lista_graczy%" for /F "delims=*" %%a in (%lista_graczy%) do set /a a+=1&if "%%a"=="[Lista]" call :CC_setup4a&goto CC_setup4b
goto setup4b
:CC_setup4a
for /F "delims=* skip=%a%" %%A in (%lista_graczy%) do set c=%%A&set /a b+=1&set n!b!=!c!&(if "!c:~0,1!!c:~-1!"=="[]" set n!b!=&goto :EOF)&if !b! GEQ %osob% goto :EOF
goto :EOF
:CC_setup4b
set /a b+=1
if %b% GTR %osob% goto CC_setup6
for /L %%i in (%b%,1,%osob%) do (
	cls
	batch# /box 2 2 "Imiê osoby nr %%i" "Podaj imiê osoby pod nr %%i"
	batch# /move_ 2 7&set /p "n%%i= > "
)

:CC_setup5
cls
set str13=&for /L %%i in (1,1,%osob%) do set str13=!str13!"%%i - !n%%i! (P: !p%%i!.!p%%ib!)" 
batch# /box 2 2 "Imiona osób" "Dane:" "" !str13! "" "Czy wpisane dane s¹ prawid³owe?" "" "$$Tak" "" "$$Nie"
if "%errorlevel%"=="1" goto CC_setup6
goto CC_setup4

:CC_setup6-cols
batch# /lenght "%licz%"
if %errorlevel% GTR %cols% set cols=%errorlevel%
goto :EOF
:CC_setup6
cls
if "%list_on%"=="ON" (if exist "%location%%title%\Lista graczy*.txt" rd /s /q "%location%%title%")
if not exist "%title%" md "%title%" 2>nul
if not exist "%title%" set title=CreepyChess&md "!title!"
>"%location%%title%\Lista graczy.txt" (echo Lista graczy:&echo.)
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
if "%print_on%"=="ON" call :CC_print "Lista graczy.txt" "listy graczy"
batch# /box 2 2 "Konfiguracja zakoñczona^!" "Za chwilê zaczn¹ siê losowania..."
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
>"%location%%title%\Runda%runda%.txt" (
echo Runda %runda%:
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
set para%actc%_1=%liczc%
set para%actc%_2=%licze%
set para%actc%=[!para%actc%_1!] (!act!.!actb!) !liczd! - !n%licze%! (!p%licze%!.!p%licze%b!) [!para%actc%_2!]
echo !para%actc%!>>"%location%%title%\Runda%runda%.txt"
set licz=%act%
set liczb=%actb%
set acte=1
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
batch# /box 2 2 "Losowanie nie powiod³o siê..." "$$Czy chcesz samodzielnie dobraæ przeciwników" "...czy..." "$$Zakoñczyæ dzia³anie programu?"
if "%errorlevel%"=="1" (for /L %%i in (1,1,%osob%) do set act%%i=0&set g%%ir%runda%=)&set actc=0&echo Runda %runda%:>"%location%%title%\Runda%runda%.txt"&echo.>>"%location%%title%\Runda%runda%.txt"&goto CC_losowanie_d1
goto CC_losowanie_errorend

:CC_losowanie_d1
cls
set liczc=
set licze=
set acte=0
if "%actc%"=="%stoly%" goto CC_losowanie5
if defined para0 set str14="" "Pauzuje nr %para0%"

batch# /box 2 2 "Informacja" "Dobierz kolejne pary, opieraj¹c siê na poprzednich losowaniach rund" "System - w miarê mo¿liwoœci - bêdzie sprawdza³, czy takie kojarzenie jest mo¿liwe" "Dobieraj numerami - nie nazwami^!" %str14%

echo.
set /p liczc=Pierwszy numer: 
if /i "%liczc%"=="reset" goto CC_losowanie_error1
if "%liczc%"=="" goto CC_losowanie_d1
for /f "tokens=2* delims=0123456789" %%A in (" 0%liczc%") do if not ""=="%%A" goto CC_losowanie_d1
if "!pauza%liczc%r!"=="1" goto CC_losowanie_d1

set /p licze=Drugi numer: 
if "%licze%"=="" goto CC_losowanie_d1
for /f "tokens=2* delims=0123456789" %%A in (" 0%licze%") do if not ""=="%%A" goto CC_losowanie_d1
if "!pauza%licze%r!"=="1" goto CC_losowanie_d1

set liczd=!n%liczc%!&set act=!p%liczc%!&set actb=!p%liczc%b!&call :CC_losowanie3
if not "%acte%"=="1" (echo Nie mo¿na ustawiæ takiego kojarzenia.) else (echo Kojarzenie ustawione.)
pause
goto CC_losowanie_d1

:CC_losowanie_errorend
cls
1>&2 echo Koñczenie programu za 3 sekundy...
batch# /sleep 3000
echo --= Wyst¹pi³ b³¹d losowania =-->>"%location%%title%\Runda%runda%.txt"
goto CC_errorlosowanie


:CC_losowanie4
cls
for /L %%i in (1,1,%stoly%) do if not "!rp%%i!"=="1" goto CC_losowanie4c
batch# /box 2 2 "Losowanie" "Na pewno chcesz rozpocz¹æ kolejn¹ rundê?" "" "$$Tak" "" "$$Nie"
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
batch# /box 2 2 "Losowanie" "Nie wpisano jeszcze wszystkich wyników^!"
batch# /sleep 2000
goto CC_punkty

:CC_losowanie5
if not "%para0%"=="" set /a p%pauza%+=1&>>"%location%%title%\Runda%runda%.txt" echo.&>>"%location%%title%\Runda%runda%.txt" echo Pauzuje nr %para0%
if "%print_on%"=="ON" call :CC_print "Runda%runda%.txt" "typowañ dla rundy %runda%"
for /L %%i in (1,1,%stoly%) do (
	set rp%%i_1=[+#.#]
	set rp%%i_2=[+#.#]
	set rp%%i=0
)
for /F %%A in ("%para0%") do set /a p%%A+=1
set /a errorcount+=1


:CC_punkty
cls
set check=
set str15=
for /L %%i in (1,1,%stoly%) do set str15=!str15!"" "$$!rp%%i_1! !para%%i! !rp%%i_2!" 
if defined para0 set str15=!str15!"" "Pauzuje nr %para0%"
batch# /box 2 2 "Losowanie" "Runda %runda%:" %str15% ""  "$$Rozpocznij kolejn¹ rundê" "" "$$Poka¿ obecne wyniki" "" "$$Zabezpiecz sesjê has³em"
set /a x=stoly+1
if "%errorlevel%"=="%x%" goto CC_losowanie4
set /a x+=1
if "%errorlevel%"=="%x%" if not "%runda%"=="1" (set check=T&goto CC_koniec1) else goto CC_punkty
set /a x+=1
if "%errorlevel%"=="%x%" call :CC_protect&goto CC_punkty
set x=%errorlevel%

:CC_punkty1
cls
batch# /box 2 2 "Losowanie" "[Para nr %x%]" "!para%x%!" "" "$$%str1%" "" "$$%str2%" "" "$$%str3%"
if "%errorlevel%"=="1" set rp%x%_1=[+1.0]&set rp%x%_2=[+0.0]&set rp%x%=1
if "%errorlevel%"=="2" set rp%x%_1=[+0.0]&set rp%x%_2=[+1.0]&set rp%x%=1
if "%errorlevel%"=="3" set rp%x%_1=[+0.5]&set rp%x%_2=[+0.5]&set rp%x%=1
goto CC_punkty

:CC_protect
cls
set unpassw=Cr33pyCh3ss
set /p unpassw=Podaj has³o odblokowuj¹ce program (domyœlnie: Cr33pyCh3ss): 
call :CC_unlock "%unpassw%"
goto :EOF
:CC_unlock
cls
set passw=
echo ===================================
echo  Program jest zabezpieczony has³em
echo     Podaj has³o, by odblokowaæ:
echo ===================================
set /p "passw=> "
if not "%passw%"=="%~1" cls&echo Wpisane has³o jest nieprawid³owe.&echo Odczekaj 5 sekund, zanim wpiszesz has³o ponownie..&ping localhost -n 6 >nul&goto CC_unlock
goto :EOF

:CC_print
batch# /box 2 2 "Momencik" "Trwa drukowanie %~2..."
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
>"%location%%title%\Wyniki turnieju.txt" (
echo Wyniki turnieju [%runda%. runda]:
echo.)
for /L %%i in (1,1,%osob%) do (echo !stringk%%i! >>"%location%%title%\Wyniki turnieju.txt")
if "%print_on%"=="ON" call :CC_print "Wyniki turnieju.txt" "wyników turnieju"
:CC_koniec2b
cls
batch# /box 2 2 "Wyniki turnieju" "Wyniki turnieju (%runda%. runda)" "" !str16! "" "$$Kliknij, aby kontynuowaæ"
if defined check set /a runda+=1&CC_goto punkty


:CC_koniec
cls
mode con cols=55 lines=15
batch# /box 2 2 "%str12%" "%str9%" "" "%str10%" "%str11%" "" "%str9%" "" "Dziêkujê za przyjemn¹ pracê" "¯yczê mi³ego dnia :)"
batch# /sleep 5000
endlocal
chcp 852>nul
exit /b 0


:CC_helpdesk
:CC_helpdesk-a4
batch# /box 2 2 "Dzia³ pomocy" "Witaj w dziale pomocy^! Wybierz interesuj¹ce Ciê pytanie:" "" "$$             Co to za program??            " "" "$$            Jakie on ma funkcje?           " "" "$$      Czy potrzebny jest modu³ Batch#?     " "" "$$       W jaki sposób dzia³a program?       " "" "$$          Mogê zobaczyæ changelog?         " "" "$$  Czy program czyta imiona graczy z pliku? " "" "$$Mam pomys³/sugestiê. Gdzie mogê to napisaæ?" "" "$$              Kolejna strona -^>            " "" "$$Wróæ do menu"
goto CC_helpdesk-%errorlevel%
:CC_helpdesk-8
:CC_helpdesk-a
batch# /box 2 2 "Dzia³ pomocy (str. 2)" "Witaj w dziale pomocy^! Wybierz interesuj¹ce Ciê pytanie:" "" "$$     Czy program bêdzie aktualizowany?     " "" "$$  Jak mogê utworzyæ skrót? [Niedostêpne]   " "" "$$ Dlaczego max. liczba osób jest taka ma³a? " "" "" "" "" "" "" "" "" "" "$$             ^<- Poprzednia strona          " "" "$$Wróæ do menu"
goto CC_helpdesk-a%errorlevel%
:CC_helpdesk-0
goto errorstdout
:CC_helpdesk-1
batch# /box 2 2 "Co to za program??" "Ty jeszcze o to pytasz? To CreepyChess cz³owieku^!" "" "CreepyChess - program do losowañ szachowych i nie tylko." "Pozwala ustalaæ typowania dla danej iloœci osób i rund -" "czyli dobiera osoby... zreszt¹, od tego jest inny temat." "" "$$Kliknij, by do niego przejœæ" "" "Nie nauczy Ciê graæ w szachy, mo¿e w warcaby :P" "Zosta³ stworzony na potrzeby turniejów lokalnych," "ale przede wszystkim dla mojego instruktora szachowego," "któremu taki program by³by bardzo potrzebny" "" "Jest to program na licencji MIT do pobrania na GitHub:" "https://github.com/GrzegorzKi/CreepyChess" %str8%
if "%errorlevel%"=="1" goto CC_helpdesk-4
goto CC_helpdesk
:CC_helpdesk-2
batch# /box 2 2 "Jakie on ma funkcje?" "Ma on du¿o funkcji :P Nic, tylko patrzeæ" "" "Funkcje:" "" "- Dobieranie graczy na podstawie punktacji" "- Prosty system przydzielania punktów" "- Mo¿liwoœæ drukowania list" "- Liczenie tzw. Buchholza" "- £atwa nawigacja za pomoc¹ przycisków (modu³ Batch#)" "- Skróty (/title, /osob, /rund, /bch, /print, /about)" "- Wiele wiêcej..." "" "Funkcji jest bardzo wiele, a ich liczba ci¹gle wzrasta.." "" "Moja rada: odkryj je wszystkie :D" "" %str8%
goto CC_helpdesk
:CC_helpdesk-3
batch# /box 2 2 "Czy potrzebny jest modu³ Batch#" "Niestety, ale jest potrzebny." "" "Dziêki niemu mogê:" "" "- Dynamicznie zmieniaæ rozmiar okna" "" "- U³atwiæ poruszanie siê po programie (przyciskowo)" "" "- Rysowaæ boxy" "" "" " Mo¿na by zrobiæ program i bez tego modu³u, ale po co?  " "Od tego one s¹, by je wykorzystywaæ :P" "" "Generalnie, bez tego modu³u program nie uruchomi³by siê" "- jest od niego po prostu zale¿ny" %str8%
goto CC_helpdesk
:CC_helpdesk-4
batch# /box 2 2 "W jaki sposób dzia³¹ program?" "Dzia³anie programu jest bardzo proste:" "" "-Losowanie-: Bierze pierwsz¹ z brzegu osobê" "Dobiera do niej osobê o takie samej lub podobnej liczbie" "punktów. Je¿eli ju¿ gra³ z dan¹ osob¹ - dobiera inn¹" "" "-Pauzy-: Gdy liczba osób jest nieparzysta, pauzy zostaj¹" "w³aczone. Osoba o najmniejszej liczbie punktów pauzuje." "Jeœli ju¿ pauzowa³a, bierze kolejn¹ na podobnej zasadzie" "" "-Wyniki-: Porównuje wyniki wszystkich osób na turnieju" "i przyznaje miejsca na podstawie punktów" "(oraz Buchholza - je¿eli w³¹czone)" "" "Nastêpnie wypisuje wyniki na ekranie - Proste? - Proste." "" %str8%
goto CC_helpdesk
:CC_helpdesk-5
if exist CreepyChangelog.txt (start CreepyChangelog.txt&set a="Proszê bardzo. Otworzy³em Ci w nowym oknie ;)") else (set a="Móg³bym, ale nie widzê tu pliku CreepyChangelog.txt :(")
batch# /box 2 2 "Mogê zobaczyæ changelog?" %a% "" "       [=] Skrótowy podgl¹d na ostatnie zmiany [=]      " "" "CreepyChess v1.5.0" "+ Dodano dzia³ pomocy (ten, który widzisz teraz)" "+ Przywrócono skróty programu (m.in. /osob, /rund)" "" "CreepyChess v1.5.1" "+ Dodano kreator skrótów (umieszczony w dziale pomocy)" "* Dodano kolejne pytania do dzia³u pomocy" "- Poprawki b³êdów" "" "CreepyChess v1.5.2 FINAL" "* Poprawiono system Buchholza i przydzielanie miejsc" "+ Dodano mo¿liwoœæ zablokowania programu has³em" %str8%
goto CC_helpdesk
:CC_helpdesk-6
batch# /box 2 2 "Czy program czyta imiona graczy z pliku?" "OdpowiedŸ brzmi: Jak najbardziej^!" "" " Co wiêcej, tworzenie takiego pliku jest bardzo proste: " "" "-= Tworzymy plik %lista_graczy% i wpisujemy tak: =-" "" "[Lista]" "gracz_1" "gracz_2" "gracz_3" "......." "gracz_n" "" "(zamiast gracz_# jakieœ imiê)" "Za ma³o imion = pyta o imiona pozosta³ych osób" "Za du¿o imion = bierze tylko tyle, ile potrzebuje" %str8%
goto CC_helpdesk
:CC_helpdesk-7
batch# /box 2 2 "Mam pomys³/sugestiê. Gdzie mogê to zasugerowaæ?" "Niegdyœ powiedzia³bym na forum" "Ale teraz mamy GitHuba - tam siê kieruj!" "" "https://github.com/GrzegorzKi/CreepyChess" "" "" "Ka¿dy pomys³ jest mile widziany" "" "Mam nadziejê, ¿e z wasz¹ pomoc¹ uda mi siê" "  stworzyæ program porównywalny do ChessArbiter Pro :)  " "" "(i tak w batchu tego nie zrobiê... lol)" "" "" "" "" "" %str8%
goto CC_helpdesk
:CC_helpdesk-a1
batch# /box 2 2 "Czy program bêdzie aktualizowany?" "Mo¿e i bêdzie, wszystko w swoim czasie :P" "" "Wszystkie najnowsze aktualizacje pojawi¹ siê" "  na forum/forach wypisanych w pierwszym temacie, czyli " "" "$$Tutaj^!" "" "Zawsze mo¿esz zapytaæ, kiedy nowa wersja" "Ale odpowiedŸ bêdzie brzmia³a zawsze tak samo:" "" "- Dowiesz siê w swoim czasie :D -" "" "A na serio: nie wiem. Obecna wersja programu jest OK." "" "Ale nie martw siê - jak bêdzie trzeba to zaktualizujê ;)" "" %str8%
if "%errorlevel%"=="1" goto CC_helpdesk-1
goto CC_helpdesk-a
:CC_helpdesk-a2
goto CC_helpdesk-a
:CC_helpdesk-a3
if %max_osob% LSS 50 (set a="Bo tak sobie ustawi³eœ :P - %max_osob% to rzeczywiœcie ma³o") else (set a="%max_osob% osób - to dla Ciebie ma³o?")
batch# /box 2 2 "Dlaczego maksymalna liczba osób jest taka ma³a?" %a% "" "No skoro tak, to powiem ci, jak zmieniæ:" "" "Je¿eli masz w folderze plik *settigns.ini*, otwórz go" "i zmieñ wartoœæ zmiennej *max_osob* na jak¹ tam chcesz. " "" "Przyk³ad:" "" "(Zawartoœæ pliku settings.ini)" "max_osob=1000" "skip_intro=ON" "..." "" "--= Ale nie próbuj dopisywaæ innych zmiennych^! =--" "(bo i tak ci to nie wyjdzie xd)" %str8%
goto CC_helpdesk-a
:CC_helpdesk-9
:CC_helpdesk-a5
goto CC_menu
:: Koniec program CreepyChess ::


:: Pocz¹tek programu BatchOfPi ::
:PI_BatchOfPi
mode con cols=81 lines=20
:PI_BatchOfPi1
cls
echo.
set NumQuads=
echo Podaj "liczb© dokˆadno˜ci" (im wy¾sza liczba, tym dokˆadniejszy b©dzie wynik,
set /p NumQuads=a tak¾e program b©dzie dˆu¾ej liczy†): 

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


:: Pocz¹tek gry BatCraft ::
:XX_BatCraft
title BatCraft
if /i "%batcraft_loaded%"=="y" goto XX_BatCraftLoop
set x=0
set y=0
set i=1
set i1=0
set i2=0
set m=1
set Line-5=Klawiszologia:
set Line-3=WASD - Poruszanie si©
set Line-1=123 - Zmiana trybu
set Line1=E - Wyb¢r przedmiotu
set Line3=Q - Wyj˜cie
set batcraft_loaded=Y
:XX_BatCraftLoop
set /a bx=!x!-7&set /a ex=!x!+7&set /a by=!y!-5&set /a ey=!y!+5&set x!x!y!y!=@
cls
echo  BatCraft by Mac
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
for /l %%y in (!by!,1,!ey!) do (
	set l=
	for /l %%x in (!bx!,1,!ex!) do (
		if "!x%%xy%%y!"=="" set /a r=!random!*5/32768&if !r!==0 (set x%%xy%%y=*) else if !r!==1 (set x%%xy%%y=#) else set x%%xy%%y= 
		set l=!l!!x%%xy%%y!)
	echo º!l!º !Line%%y!)
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
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


:: Strefa "Test Samples" ::
:XX_TestSamples
cls
echo Odpalam program...^|
echo ------------------'
if /i exist "%MDIR%TestSamples_Files\%~1" (if /i not "%~2"=="Code" (call "%MDIR%TestSamples_Files\%~1") else (start notepad.exe "%MDIR%TestSamples_Files\%~1")) else (echo Wymagany plik nie zostaˆ znaleziony...&pause>nul)
goto :EOF
:: Strefa "Test Samples" ::


:: Pocz¹tek programu AdminTools ::
:AT_Init
setlocal enabledelayedexpansion
title Administrative Tools
cd /d "%MDIR%"
if not exist "%MDIR%batbox.exe" call :BatBox
cls
mode con cols=80 lines=30
set ParameterStatus=-
:AT_Start
pushd "%temp%"
set Params=
"%MDIR%batbox.exe" /g 0 0
echo                            -= Administrative Tools =-                           [0;1;40;33mÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ taskmgr ^| dxdiag ^| regedit ^| resmon ^| netplwiz ^| devmgmt.msc ^| netstat  ^| sfc  ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ cls ^| cmd ^| help ^| systeminfo ^| netstat -a ^| ftp ^| chkdsk ^| Parameters%ParameterStatus% ^| EXIT ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ[0;1;40;37m
"%MDIR%batbox.exe" /g 0 28
"%MDIR%batbox.exe" /m >bridgea 2>nul || goto MenuSessionConflict
for /f "tokens=1,2,3 delims=:" %%a in (bridgea) do (
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
	) else set result=endlocal^&exit /b 0&set NoParams=Y
))))))))))
)

popd
if not "%Result%"=="" (
if "%ParameterStatus%"=="+" (if not "%NoParams%"=="Y" set /p "Params=Parametry: "&echo.)
%Result:@=!%
set /p "=Done^! Press any key to continue..."<nul
pause>nul
echo.
echo.
echo.
)
goto AT_Start
:: Koniec programu AdminTools ::


:: Pocz¹tek programu Baza Danych ::
:DB_Init
setlocal enabledelayedexpansion enableextensions
set Version=v0.5
title Baza danych - %Version%
if not exist batbox.exe call :batbox
set "Logo=echo.&echo        ____                             __                            __  &echo       / __ ) ____ _ ____  ____ _   ____/ /____ _ ____   __  __ _____ / /_ &echo      / __  ^|/ __ `//_  / / __ `/  / __  // __ `// __ \ / / / // ___// __ \&echo     / /_/ // /_/ /  / /_/ /_/ /  / /_/ // /_/ // / / // /_/ // /__ / / / /&echo    /_____/ \__,_/  /___/\__,_/   \__,_/ \__,_//_/ /_/ \__, / \___//_/ /_/ &echo                                                      /____/&echo."
set "NoLogo=echo.&echo.&echo.&echo.&echo.&echo.&echo.&echo."

:DB_DBstart
cd /d "%MDIR%"
mode con cols=80 lines=30
:DB_Menu
cls
color 0C
2>nul batbox.exe /h 0 /o 3 1 /g 0 4 /d / /w 10 /g 1 3 /d / /g 1 4 /d "_" /w 10 /g 2 2 /d / /g 2 4 /d "_" /w 10 /g 3 1 /d / /g 3 3 /d / /g 3 4 /d "_" /w 10 /g 4 0 /d "_" /g 4 2 /d "_" /g 4 3 /d "_" /g 4 4 /d "_" /w 10 /g 5 0 /d "_" /g 5 1 /d "_" /g 5 2 /d "_" /g 5 3 /d / /g 5 4 /d "_" /w 10 /g 6 0 /d "_" /g 6 1 /d "_" /g 6 4 /d / /w 10 /g 7 0 /d "_" /g 7 3 /d / /w 10 /g 8 1 /d ")" /g 8 2 /d "|" /g 8 3 /d / /g 8 4 /d \ /w 10 /g 9 2 /d / /g 9 4 /d "_" /w 10 /g 10 1 /d "_" /g 10 3 /d / /g 10 4 /d "_" /w 10 /g 11 1 /d "_" /g 11 2 /d "_" /g 11 3 /d "_" /g 11 4 /d "," /w 10 /g 12 1 /d "_" /g 12 2 /d "_" /g 12 3 /d / /g 12 4 /d "_" /w 10 /g 13 1 /d "_" /g 13 4 /d / /w 10 /g 14 2 /d "`" /g 14 3 /d / /w 10 /g 15 1 /d "_" /g 15 2 /d / /w 10 /g 16 2 /d / /g 16 4 /d / /w 10 /g 17 1 /d "_" /g 17 2 /d "_" /g 17 3 /d / /g 17 4 /d "_" /w 10 /g 18 1 /d "_" /g 18 4 /d "_" /w 10 /g 19 1 /d "_" /g 19 3 /d / /g 19 4 /d "_" /w 10 /g 20 1 /d "_" /g 20 2 /d / /g 20 3 /d "_" /g 20 4 /d / /w 10 /g 21 3 /d / /g 21 4 /d \ /w 10 /g 22 2 /d / /g 22 4 /d "_" /w 10 /g 23 1 /d "_" /g 23 3 /d / /g 23 4 /d "_" /w 10 /g 24 1 /d "_" /g 24 2 /d "_" /g 24 3 /d "_" /g 24 4 /d "," /w 10 /g 25 1 /d "_" /g 25 2 /d "_" /g 25 3 /d / /g 25 4 /d "_" /w 10 /g 26 1 /d "_" /g 26 4 /d / /w 10 /g 27 2 /d "`" /g 27 3 /d / /w 10 /g 28 1 /d "_" /g 28 2 /d / /w 10 /w 10 /g 30 3 /d / /g 30 4 /d \ /w 10 /g 31 2 /d / /g 31 4 /d "_" /w 10 /g 32 1 /d "_" /g 32 3 /d / /g 32 4 /d "_" /w 10 /g 33 1 /d "_" /g 33 2 /d "_" /g 33 3 /d "_" /g 33 4 /d "," /w 10 /g 34 1 /d "_" /g 34 2 /d "_" /g 34 3 /d / /g 34 4 /d "_" /w 10 /g 35 1 /d "_" /g 35 4 /d / /w 10 /g 36 1 /d / /g 36 3 /d / /w 10 /g 37 0 /d "_" /g 37 2 /d / /g 37 3 /d / /g 37 4 /d \ /w 10 /g 38 0 /d "_" /g 38 1 /d / /g 38 2 /d / /g 38 4 /d "_" /w 10 /g 39 1 /d "_" /g 39 3 /d / /g 39 4 /d "_" /w 10 /g 40 1 /d "_" /g 40 2 /d "_" /g 40 3 /d "_" /g 40 4 /d "," /w 10 /g 41 1 /d "_" /g 41 2 /d "_" /g 41 3 /d / /g 41 4 /d "_" /w 10 /g 42 1 /d "_" /g 42 4 /d / /w 10 /g 43 2 /d "`" /g 43 3 /d / /g 43 4 /d / /w 10 /g 44 1 /d "_" /g 44 2 /d / /g 44 3 /d / /g 44 4 /d "_" /w 10 /g 45 2 /d / /g 45 4 /d / /w 10 /g 46 1 /d "_" /g 46 3 /d / /w 10 /g 47 1 /d "_" /g 47 2 /d "_" /g 47 4 /d / /w 10 /g 48 1 /d "_" /g 48 2 /d "_" /g 48 3 /d / /g 48 4 /d "_" /w 10 /g 49 1 /d "_" /g 49 4 /d / /w 10 /g 50 2 /d \ /g 50 3 /d / /g 50 5 /d / /w 10 /g 51 3 /d / /g 51 4 /d \ /g 51 5 /d "_" /w 10 /g 52 2 /d / /g 52 4 /d "_" /g 52 5 /d "_" /w 10 /g 53 1 /d "_" /g 53 3 /d / /g 53 4 /d "_" /g 53 5 /d "_" /w 10 /g 54 1 /d "_" /g 54 2 /d / /g 54 3 /d "_" /g 54 4 /d "," /g 54 5 /d "_" /w 10 /g 55 3 /d / /g 55 5 /d / /w 10 /g 56 2 /d / /g 56 4 /d / /w 10 /g 57 1 /d "_" /g 57 3 /d / /w 10 /g 58 1 /d "_" /g 58 2 /d / /g 58 3 /d / /g 58 4 /d \ /w 10 /g 59 2 /d / /g 59 4 /d "_" /w 10 /g 60 1 /d "_" /g 60 3 /d / /g 60 4 /d "_" /w 10 /g 61 1 /d "_" /g 61 2 /d "_" /g 61 3 /d "_" /g 61 4 /d "_" /w 10 /g 62 1 /d "_" /g 62 2 /d "_" /g 62 3 /d "_" /g 62 4 /d / /w 10 /g 63 1 /d "_" /g 63 2 /d "_" /g 63 4 /d / /w 10 /g 64 1 /d "_" /g 64 2 /d / /g 64 3 /d / /g 64 4 /d "_" /w 10 /g 65 2 /d / /g 65 4 /d / /w 10 /g 66 1 /d / /g 66 3 /d / /w 10 /g 67 0 /d "_" /g 67 2 /d "_" /g 67 4 /d / /w 10 /g 68 0 /d "_" /g 68 1 /d / /g 68 2 /d "_" /g 68 3 /d / /g 68 4 /d "_" /w 10 /g 69 1 /d "_" /g 69 4 /d / /w 10 /g 70 2 /d \ /g 70 3 /d / /g 0 5 /d "Wersja %Version%" /c 0x02 /g 56 6 /d "By CreepyNinja_" /g 0 7 /c 0x0F || (call :batbox Fix&goto DB_DBMenu)
echo.
echo                         ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo                         º        Wybierz opcje:        º
echo                         ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹
echo                         º 1) Utw¢rz now¥ baz© danych   º
echo                         º 2) Wczytaj baz© danych       º
echo                         º 3) Usuä baz© danych          º
echo                         º Q) Wyj˜cie                   º
echo                         ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
:DB_MenuGet
batbox.exe /k
if %errorlevel%==49 goto DB_DBCreate
if %errorlevel%==50 goto DB_DBLoad
if %errorlevel%==51 goto DB_DBDelete
if %errorlevel%==113 exit /b 0
goto DB_MenuGet

:DB_DBCreate
cls
batbox /h 1
%Logo%
set DBName=
set /p "DBName=Podaj nazw© nowej bazy danych: " || goto DB_Menu
if /i exist "BazaDanych_Files\%DBName%" echo Baza danych o takiej nazwie ju¾ istnieje^^!&pause>nul&goto DB_DBCreate
cls
%Logo%
set Limit=20
echo A teraz czas na konfiguracj©...
echo.
echo Tutaj ustalisz nazwy wprowadzanych do programu danych (max. %Limit%).
echo Aby zakoäczy† wprowadzanie, wci˜nij ENTER.
:DB_DBCreate1
for /l %%a in (1,1,%Limit%) do (
	echo.
	set DBItem%%a=
	set /p "DBItem%%a=Podaj nazw© %%a. elementu: 
	if "!DBItem%%a!"=="" set /a DBCount=%%a-1&goto DB_DBCreate2
)
set DBCount=%Limit%
:DB_DBCreate2
if !DBCount! LSS 2 echo Za maˆo element¢w^^! Wymagane jest min. 2.&goto DB_DBCreate1
cls
%Logo%
echo Czy wprowadzone dane s¥ prawidˆowe?
echo.
echo *** Nazwa: %DBName% ***
echo.
echo *** Nazwy typ¢w danych: ***
for /l %%a in (1,1,%DBCount%) do echo  - !DBItem%%a! -
echo.
set /p "=Wyb¢r (T/N) "<nul
batbox /k
if %errorlevel%==116 goto DB_DBCreate3
if %errorlevel%==110 goto DB_DBCreate
goto DB_DBCreate2

:DB_DBCreate3
cls
chcp 1250>nul
if /i exist "%DBName%" echo.&echo Baza danych o takiej nazwie ju¾ istnieje^^!&pause>nul&goto DB_DBCreate
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
echo Baza danych zostaˆa utworzona^^! Teraz czas, aby j¥ zapeˆni† :)
echo.
set /p "=Wci˜nij dowolny klawisz, aby wr¢ci† do menu..."<nul
pause>nul
goto DB_Menu

:DB_DBDelete
cls
mode con cols=80 lines=30
batbox.exe /h 1
%Logo%
echo Usuä baz© danych - dost©pne:
echo.
cd /d "BazaDanych_Files" 2>nul
set Names=
set /a a=0,d=0
for /R %%a in (database.cfg) do set b=&set c=&if defined a (set a=) else (if exist "%%a" (cd "%%~dpa"&for /f "tokens=1* delims==" %%A in (database.cfg) do (if "%%A"=="Name" set "b=%%~B"&set "c=%%~ta"&set /a d+=1&set "Names=!Names!"%%~B","))&if defined b echo * !b! ^(Zmodyfikowano: !c!^))
cd "%MDIR%"
if %D% EQU 0 echo - ½adne :( -
echo.
set cho=
set /p cho=Wyb¢r: || goto DB_Menu
for %%# in (%Names%) do if /i "%cho%"=="%%~#" pushd "BazaDanych_Files\%%~#" 2>nul || (echo.&echo Podana baza danych nie zostaˆa odnaleziona^^!&pause>nul&goto DB_DBDelete)&set Name=%%~#&goto DB_DBDelete1
goto DB_DBDelete
:DB_DBDelete1
echo.
set /p "=Jeste˜ pewien? (T/N) "<nul
:DB_DBDelete1a
"%MDIR%batbox.exe" /k
if %errorlevel%==116 goto DB_DBDelete1b
if %errorlevel%==110 popd&goto DB_DBDelete
goto DB_DBDelete1a
:DB_DBDelete1b
cd ..
rmdir /S /Q "%Name%"
popd
echo.
set /p "=Zrobione^! Wci˜nij dowolny klawisz, aby kontynuowa†..."<nul
pause>nul
goto DB_DBDelete


:::::::::::::::::::::::::::::::
:: G³ówna sekcja bazy danych ::
:DB_DBLoad
cls
mode con cols=80 lines=30
batbox.exe /h 1
%Logo%
echo Wczytaj baz© danych - dost©pne:
echo.
cd /d "BazaDanych_Files" 2>nul
set Names=
set /a a=0,d=0
for /R %%a in (database.cfg) do set b=&set c=&if defined a (set a=) else (if exist "%%a" (cd "%%~dpa"&for /f "tokens=1* delims==" %%A in (database.cfg) do (if "%%A"=="Name" set "b=%%~B"&set "c=%%~ta"&set /a d+=1&set "Names=!Names!"%%~B","))&if defined b echo * !b! ^(Zmodyfikowano: !c!^))
cd "%MDIR%"
if %D% EQU 0 echo - ½adne :( -
echo.
set cho=
set /p cho=Wyb¢r: || goto DB_Menu
for %%# in (%Names%) do if /i "%cho%"=="%%~#" pushd "BazaDanych_Files\%%~#" 2>nul || (echo.&echo Podana baza danych nie zostaˆa odnaleziona^^!&pause>nul&goto DB_DBDelete)&set Name=%%~#&goto DB_Start
goto DB_DBLoad

:DB_Reload
endlocal&if "%Warp%"=="Delete" (set min=%min%&set max=%max%&set prevp=%prevp%&set nextp=%nextp%&set Warp=%Warp%) else (set Warp=)
:DB_Start
"%MDIR%batbox.exe" /h 0 2>nul || (call :batbox Fix&goto DB_Start)
setlocal
chcp 1250>nul
set Color1=07
set Color2=0C
set Color3=0F
if exist database.cfg (for /f "tokens=*" %%# in (database.cfg) do set %%#) else (echo.&echo Podana baza danych nie zostaˆa odnaleziona^^!&pause>nul&chcp 852>nul&popd&goto DB_DBLoad)
title Baza danych - %Name% - %Version%
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
set "A=ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ"
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
"%MDIR%batbox.exe" /c 0x%Color1%
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
		set line1=!line1!!A:~0,%%A!Ë
	)
	if "!Item%%a!"=="" set Item%%a=ItemName %%a
)
set "line1=É%line1:~0,-1%»"
echo  %line1%
set Line1=
for /l %%a in (1,1,%ItemCount%) do (
	set c=!Item%%aLength!
	for %%A in (!c!) do (
		set d= !Item%%a!!B:~0,%%A!
		set line1=!line1!!d:~0,%%A!º
	)
)
set "line1=º%line1:~0,-1%º"
echo  %line1%
set Line1=
for /l %%a in (1,1,%ItemCount%) do (
	set c=!Item%%aLength!
	for %%A in (!c!) do (
		set line1=!line1!!A:~0,%%A!Î
	)
)
set "line1=Ì%line1:~0,-1%¹"
echo  %line1%
set Line1=
for /l %%a in (1,1,%ItemCount%) do (
	set c=!Item%%aLength!
	for %%A in (!c!) do (
		set line1=!line1!!B:~0,%%A!º
	)
)
set "line1=º%line1:~0,-1%º"
for /l %%a in (1,1,%len%) do (echo  %Line1%)
set Line1=
for /l %%a in (1,1,%ItemCount%) do (
	set c=!Item%%aLength!
	for %%A in (!c!) do (
		set line1=!line1!!A:~0,%%A!Ê
	)
)
set "line1=È%line1:~0,-1%¼"
echo  %Line1%
if "%s_on%"=="F_" echo   - Wyniki wyszukiwania -

if not "%AlterColor2:~0,1%"=="%AlterColor2:~1,1%" (
if [%prevp%]==[1] (set "k1=1) Prev") else set "k1=   -   "
if [%nextp%]==[1] (set "k2=2) Next") else set "k2=   -   "

if "%s_on%"=="F_" (set c=26) else (set c=28)
"%MDIR%batbox.exe" /h 0 /g 0 !c! /c 0x%AlterColor2%
if "%s_on%"=="F_" (
	echo  É%A:~0,41%» 
	echo  º Wci˜nij "F" lub "Esc", aby wr¢ci†...    º 
)
echo É%A:~0,43%»
echo º R - Ref.   F - Find  S - Sort   O - Opcje º
echo º Q - Quit   !k1!   !k2!    H - Help^^! º
set /p "=È%A:~0,43%¼"<nul
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
"%MDIR%batbox.exe" %com%

:DB_KeyStroke
"%MDIR%batbox.exe" /h 0 /g 0 0 /c 0x%BGColor% /d " %min%-%max% /!%s_on%EntityCount!\\"
if defined Warp goto DB_%Warp%
:DB_KeyStroke-a
"%MDIR%batbox.exe" /k
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
if %cho%==104 cls&echo.&echo   Klawisze:&echo                               --------------&echo 	1 - Poprzednia strona ^|    Albo    ^|&echo 	2 - Nastêpna strona   ^| strza³kami ^|&echo 	R - Odswie¿ dane      --------------&echo 	S - Sortuj dane&echo 	F - Wyszukaj dane&echo 	E - Edytuj dane&echo 	A - Dodaj wpis&echo 	D - Usuñ wpis&echo 	G - PrzejdŸ do strony [...]&echo 	H - Ta strona pomocy&echo 	O - Ustawienia tej bazy danych&echo 	Q - Wróæ do g³ównego menu&echo.&echo.&echo.&echo  ~~   Baza danych w Batchu - czyli tania   ~~&echo  ~~  podróbka MS Access. Wersja alpha %Version% ~~&echo  ~~  by CreepyNinja - All Rights Reserved  ~~&echo   ENJOY, mo¿e Wam siê przyda, a mo¿e nie :D&pause>nul&goto DB_Window
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
"%MDIR%batbox.exe" /g 0 1 /d "  -Dodaj wpis-" /g 3 %C% /c 0x%AlterColor% /h 1
set Nazwa=""
set /p Nazwa=
set Nazwa=%Nazwa:"=%
if not defined Nazwa "%MDIR%batbox.exe" /h 0 /c 0x0F&set /a EntityCount-=1&call :DB_RecalcAlt&goto DB_Window
set Entity%EntityCount%Item1=%Nazwa%
if defined g_on set S_Entity%EntityCount%Item1=%Nazwa%
call :DB_SaveData
goto DB_Window

:DB_Edit
"%MDIR%batbox.exe" /g 0 1 /d "  -Edytuj dane-" /h 1
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
"%MDIR%batbox.exe" /g %e% %y% /g %x% %y% /k
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
"%MDIR%batbox.exe" /g %e% %y% /g %x% %y% /c 0x%Color1% /d "!B:~0,%g%!" /g %x% %y% /c 0x%AlterColor%
set Nazwa=""
set /p Nazwa=
set Nazwa=%Nazwa:"=%
if not defined Nazwa "%MDIR%batbox.exe" /g %x% %y% /c 0x%BGColor% /d "!B:~0,%g%!" /g %x% %y% /c 0x%AlterColor% /d "%F%"&goto DB_Edit-0
if "%g_on%"=="S_" set c=!Pla%c%!
set Entity%c%Item%d%=%Nazwa%
call :DB_SaveData
"%MDIR%batbox.exe" /g %x% %y% /c 0x%BGColor% /d "!B:~0,%g%!" /g %x% %y% /c 0x%AlterColor% /d "%Nazwa%"
goto DB_Edit-0
:DB_Edit-0
"%MDIR%batbox.exe" /g 0 1 /c 0x%BGColor% /d "               "
goto DB_KeyStroke

:DB_Delete
"%MDIR%batbox.exe" /g 0 1 /d "  -Usuñ wpis-" /h 1
set y=6
set c=%min%
:DB_Delete-1
if [%c%]==[%min%] (set e-up=0) else (set e-up=1)
if [%c%]==[%max%] (set e-down=0) else (set e-down=1)
"%MDIR%batbox.exe" /g 3 %y% /k
set cho=%errorlevel%
if %cho%==335 (if [%e-down%]==[1] (set /a y+=2&set /a c+=1) else (set c=%min%&set /a y=6))
if %cho%==327 (if [%e-up%]==[1] (set /a y-=2&set /a c-=1) else (set c=%max%&set /a "y=6+(max-min)*2"))
if %cho%==13 if not "%EntityCount%"=="1" goto DB_Delete-2
if %cho%==100 goto DB_Delete-0
if %cho%==27 goto DB_Delete-0
goto DB_Delete-1
:DB_Delete-2
set /a d=%len%+6
"%MDIR%batbox.exe" /g 0 %d% /d "   Jesteœ pewien? (Y/N) "
:DB_Delete-3
"%MDIR%batbox.exe" /k
set cho=%errorlevel%
if %cho%==121 goto DB_Delete-4
if %cho%==110 "%MDIR%batbox.exe" /g 3 %d% /d "                     "&goto DB_Delete-0
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
"%MDIR%batbox.exe" /g 0 1 /d "             "
goto DB_KeyStroke

:DB_Sort
cls
if %Cols% LSS 75 (%NoLogo%) else %Logo%
echo Sortuj alfabetycznie po wartoœci:
echo.
for /l %%# in (1,1,%ItemCount%) do echo  %%#^) !Item%%#!
set /a c=ItemCount+1
echo  %c%^) Wyczyœæ sortowanie
echo.
"%MDIR%batbox.exe" /h 1
set cho=
set /p cho=Wybór: 
if not defined cho goto DB_Window
for /l %%# in (1,1,%ItemCount%) do if "%cho%"=="%%#" set S_ItemName=!Item%%#!&set S_Item=%%#&goto DB_Sort-1
if "%cho%"=="%c%" set %s_on%SortedIn=&set %s_on%SortItem=0&goto DB_Window
goto DB_Sort
:DB_Sort-1
set c=0
for /l %%a in (1,1,%EntityCount%) do set SortGot%%a=&set Pl%%a=&set Pla%%a=
if "!%s_on%SortItem!"=="%S_Item%" (if "!%s_on%Sorting!"=="A B C Æ D E F G H I J K L £ M N O P R S Œ T U W Z  ¯" (set %s_on%Sorting=¯  Z W U T Œ S R P O N M £ L K J I H G F E D Æ C B A) else set %s_on%Sorting=A B C Æ D E F G H I J K L £ M N O P R S Œ T U W Z  ¯) else (set %s_on%Sorting=A B C Æ D E F G H I J K L £ M N O P R S Œ T U W Z  ¯)

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
echo Szukaj po wartoœci:
echo.
for /l %%# in (1,1,%ItemCount%) do echo  %%#^) !Item%%#!
echo.
"%MDIR%batbox.exe" /h 1
set cho=
set /p cho=Wybór: 
if not defined cho goto DB_Window
for /l %%# in (1,1,%ItemCount%) do if "%cho%"=="%%#" set F_ItemName=!Item%%#!&set F_Item=%%#&goto DB_Search-1
goto DB_Search
:DB_Search-1
cls
if %Cols% LSS 75 (%NoLogo%) else %Logo%
echo !B:~0,%Length%!Szukaj po wartoœci %F_ItemName%:
chcp 852>nul
echo !B:~0,%Length%!É%A:~0,38%»
echo !B:~0,%Length%!º%B:~0,38%º
echo !B:~0,%Length%!º%B:~0,38%º
echo !B:~0,%Length%!º%B:~0,38%º
echo !B:~0,%Length%!È%A:~0,38%¼
chcp 1250>nul
"%MDIR%batbox.exe" /o 2 0 /g %Length% 11
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
if %c%==0 set F_Entity1Item1=Nie znaleziono... :(&set F_EntityCount=1
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
echo !B:~0,%Length%!É%A:~0,38%»
echo !B:~0,%Length%!º%B:~0,38%º
echo !B:~0,%Length%!º%B:~0,38%º
echo !B:~0,%Length%!º%B:~0,38%º
echo !B:~0,%Length%!È%A:~0,38%¼
chcp 1250>nul
"%MDIR%batbox.exe" /o 3 0 /g %Length% 10 /d "PrzejdŸ do strony (1-%str%): " /h 1
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
echo !B:~0,%Length%!É%A:~0,38%»
echo !B:~0,%Length%!º       Ustawienia bazy danych:        º
echo !B:~0,%Length%!Ì%A:~0,38%¹
echo !B:~0,%Length%!º 1) Zmieä nazw© tej bazy danych       º
echo !B:~0,%Length%!º 2) Ustawienia tabeli                 º
echo !B:~0,%Length%!º 3) Zmieä kolorystyk© programu        º
echo !B:~0,%Length%!º Q) Wr¢†                              º
echo !B:~0,%Length%!È%A:~0,38%¼
chcp 1250>nul
:DB_Options-0
"%MDIR%batbox.exe" /k
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
echo !B:~0,%Length%!É%A:~0,38%»
echo !B:~0,%Length%!º          Ustawienia tabeli:          º
echo !B:~0,%Length%!Ì%A:~0,38%¹
echo !B:~0,%Length%!º 1) Dodaj now¥ kolumn©                º
echo !B:~0,%Length%!º 2) Usuä istniej¥c¥ kolumn©           º
echo !B:~0,%Length%!º 3) Zmieä nazwy kolumn                º
echo !B:~0,%Length%!º 4) Zmieä szeroko˜† kolumn            º
echo !B:~0,%Length%!º Q) Wr¢†                              º
echo !B:~0,%Length%!È%A:~0,38%¼
chcp 1250>nul
:DB_Options-0b
"%MDIR%batbox.exe" /k
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
echo !B:~0,%Length%!É%A:~0,38%»
echo !B:~0,%Length%!º%B:~0,38%º
echo !B:~0,%Length%!º%B:~0,38%º
echo !B:~0,%Length%!º%B:~0,38%º
echo !B:~0,%Length%!È%A:~0,38%¼
chcp 1250>nul
"%MDIR%batbox.exe" /o 3 0 /g %Length% 10 /d "Nowa nazwa: " /h 1
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
"%MDIR%batbox.exe" /g 0 1 /d "  -Zmieñ nazwy kolumn-" /h 1
set x=3
set c=1
set /a e=2+%Item1Length%
:DB_Options-2a
if [%c%]==[1] (set e-prev=0) else (set e-prev=1)
if [%c%]==[%ItemCount%] (set e-next=0) else (set e-next=1)
"%MDIR%batbox.exe" /g %e% 3 /g %x% 3 /k
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
"%MDIR%batbox.exe" /g %e% 3 /g %x% 3 /c 0x%Color1% /d "!B:~0,%g%!" /g %x% 3
set Nazwa=""
set /p Nazwa=
set Nazwa=%Nazwa:"=%
if not defined Nazwa "%MDIR%batbox.exe" /g %x% 3 /c 0x%Color1% /d "!Item%c%:~0,%g%!"&goto DB_Options-2x
set Item%c%=%Nazwa%
call :DB_SaveDataBase
"%MDIR%batbox.exe" /g %x% 3 /c 0x%Color1% /d "!B:~0,%g%!" /g %x% 3 /d "!Item%c%:~0,%g%!"
goto DB_Options-2x
:DB_Options-2c
set /a g=!Item%c%Length!-1
"%MDIR%batbox.exe" /g %e% 3 /g %x% 3 /c 0x%Color1% /d "!B:~0,%g%!" /g %x% 3 /d "(9-50)> "
set cho=""
set /p cho=
set cho=%cho:"=%
if not defined cho "%MDIR%batbox.exe" /g %x% 3 /d "!B:~0,%g%!" /g %x% 3 /d "!Item%c%:~0,%g%!"&goto DB_Options-2x
for /f "delims=0123456789" %%A in ("%cho%") do if not "%%A"=="" goto DB_Options-2c
if %cho% LSS 9 goto DB_Options-2c
if %cho% GTR 50 goto DB_Options-2c
set Item%c%Length=%cho%
call :DB_SaveDataBase
call :DB_RecalcSize
goto DB_Window
:DB_Options-2x
"%MDIR%batbox.exe" /g 0 1 /c 0x%BGColor% /d "                          "
goto DB_KeyStroke
:DB_Options-3
if not defined Warp set Warp=Options-3&goto DB_Window
set Warp=
"%MDIR%batbox.exe" /g 0 1 /d "  -Zmieñ szerokoœæ kolumn-" /h 1
set x=3
set c=1
set d=1
set /a e=2+%Item1Length%
goto DB_Options-2a
:DB_Options-4
cls
if %Cols% LSS 75 (%NoLogo%) else %Logo%
chcp 852>nul
echo !B:~0,%Length%!É%A:~0,38%»
echo !B:~0,%Length%!º             Zmieä kolor:             º
echo !B:~0,%Length%!Ì%A:~0,38%¹
echo !B:~0,%Length%!º 1) Obramowaä tabeli oraz tˆa         º
echo !B:~0,%Length%!º 2) Tabeli z klawiszologi¥            º
echo !B:~0,%Length%!º 3) Wpis¢w w tabeli                   º
echo !B:~0,%Length%!º Q) Wr¢†                              º
echo !B:~0,%Length%!È%A:~0,38%¼
chcp 1250>nul
:DB_Options-4a
set c=
"%MDIR%batbox.exe" /k
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
echo !B:~0,%Length%!Obecny kolor: !Color%c%!
chcp 852>nul
echo !B:~0,%Length%!É%A:~0,38%»
echo !B:~0,%Length%!º%B:~0,38%º
echo !B:~0,%Length%!º%B:~0,38%º
echo !B:~0,%Length%!º%B:~0,38%º
echo !B:~0,%Length%!È%A:~0,38%¼
chcp 1250>nul
"%MDIR%batbox.exe" /o 3 0 /g %Length% 11 /d "Wpisz kod koloru: " /h 1
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
"%MDIR%batbox.exe" /g 0 1 /d "  -Dodaj kolumnê-" /g %C% 3 /c 0x%Color1% /h 1
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
"%MDIR%batbox.exe" /g 0 1 /d "  -Usuñ kolumnê-" /h 1
set x=3
set c=1
set d=2
set /a e=2+%Item1Length%
goto DB_Options-2a
:DB_Options-6a
set /a d=%len%+6
"%MDIR%batbox.exe" /g 0 %d% /d "   Jesteœ pewien? (Y/N) "
:DB_Options-6b
"%MDIR%batbox.exe" /k
set cho=%errorlevel%
if %cho%==121 goto DB_Options-6c
if %cho%==110 "%MDIR%batbox.exe" /g 0 %d% /d "                        "&goto DB_Delete-0
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
echo  /Tryb formularza\
echo.
echo  É%A:~0,50%%A:~0,26%»
echo  º%B:~0,50%%B:~0,26%º
set c=4
set d=5
set com=
for /l %%# in (1,1,%ItemCount%) do (
	if not "!Entity%FormAct%Item%%#!"=="" (set Line1=!Item%%#!: !Entity%FormAct%Item%%#!) else (set Line1=!Item%%#!: * N/A *)
	if not "!Line1:~74!"=="" (set Line2=!Line1:~74,74!) else set Line2=
	echo  º!B:~0,50!!B:~0,26!º
	echo  º!B:~0,50!!B:~0,26!º
	set com=!com! /g 3 !c! /c 0x%AlterColor% /d "!Line1:~0,74!" /g 3 !d! /d "!Line2!" /g 3 !c! /c 0x%BGColor% /d "!Item%%#!: "
	set /a c+=2,d+=2
)
echo  º%B:~0,50%%B:~0,26%º
set "Line=%B:~0,36%^< %FormAct%/%EntityCount% ^>%B:~0,39%"
echo  º%Line:~0,78%º
echo  È%A:~0,50%%A:~0,26%¼
echo.
"%MDIR%batbox.exe" /c 0x%AlterColor2%
echo É%A:~0,41%»
echo º ^< - Prev  ^> - Next  Tab - Ch. view mode º
set /p "=È%A:~0,41%¼"<nul
chcp 1250>nul
"%MDIR%batbox.exe" %com% /o 0 0 /g 0 0 /c 0x%BGColor%
:DB_FormKeyStroke
"%MDIR%batbox.exe" /k
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


:: Pocz¹tek programu PicEditor ::
:PE_Init
	setlocal enabledelayedexpansion enableextensions
	call :PE_var
:PE_New Project
	%disp% [0;1;40;31m
	%disp% [7;23HÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	%disp% [8;23H³þ  New Project:  þ³Û
	%disp% [9;23HÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´Û
	%disp% [10;23H³Name:[           ]³Û
	%disp% [11;23H³Type: [ ]    [ ]  ³Û
	%disp% [12;23H³    Colours Simple³Û
	%disp% [13;23HÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´Û
	%disp% [14;23H³þ      [Ok]      þ³Û
	%disp% [15;23HÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙÛ
	%disp% [16;23H ßßßßßßßßßßßßßßßßßßßß
	if !mode!==color (%disp% [11;31H*) else (%disp% [11;38H*)
	%disp% [10;30H!name!
	for /f "tokens=1,2,3" %%a in ('PicEditor_Files\bg mouse') do set/a x=%%c+1,y=%%b+1
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
	for /f "tokens=1,2,3" %%a in ('PicEditor_Files\bg mouse') do set/a x=%%c+1,y=%%b+1,z=%%a
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
	if !x!==29 set tip=Û
	if !x!==31 set tip=²
	if !x!==33 set tip=±
	if !x!==35 set tip=°
	if !x!==37 set tip=Ü
	if !x!==39 set tip=ß
	if !x!==41 set tip=
	if !x!==43 set tip=
	if !x!==45 set tip=
	if !x!==47 set tip=Ú
	if !x!==49 set tip=Ä
	if !x!==51 set tip=¿
	if !x!==53 set tip=À
	if !x!==55 set tip=Ù
	if !x!==57 set tip=©
	if !x!==59 set tip=¸
	if !x!==61 set tip=É
	if !x!==63 set tip=Í
	if !x!==65 set tip=»
	if !x!==67 set tip=Î
	if !x!==69 set tip=È
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
	if !x!==47 set tip=Á
	if !x!==49 set tip=Â
	if !x!==51 set tip=Ã
	if !x!==53 set tip=Å
	if !x!==55 set tip=´
	if !x!==57 set tip=³
	if !x!==59 set tip=®
	if !x!==61 set tip=¯
	if !x!==63 set tip=¹
	if !x!==65 set tip=º
	if !x!==67 set tip=¼
	if !x!==69 set tip=Ê
	%bs% p	
	)
	if !y!==28 (
	if !x!==29 set tip=
	if !x!==31 set tip=þ
	if !x!==33 set tip=Ø
	if !x!==35 set tip=
	if !x!==37 set tip=
	if !x!==39 set tip=
	if !x!==41 set tip=
	if !x!==43 set tip=ª
	if !x!==45 set tip=
	if !x!==47 set tip=
	if !x!==49 set tip=
	if !x!==51 set tip=
	if !x!==53 set tip=÷
	if !x!==55 set tip=î
	if !x!==57 set tip=ï
	if !x!==59 set tip=ð
	if !x!==61 set tip=ù
	if !x!==63 set tip=ú
	if !x!==65 set tip=Ï
	if !x!==67 set tip=Ì
	if !x!==69 set tip=Ë
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
	PicEditor_Files\bg.exe Cursor 100
	!ui! sendkey esc press
	!ui! sendkey esc press
	set/a yy=!y!+1,og.y=!y!,og.x=!x!,max.x=!x!+19&%disp% [;m
	%disp% [!yy!;!x!HÚÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿ &set/a yy+=1&set y1=!yy!
	%disp% [!yy!;!x!H³ú³Select Area     ³Û&set/a yy+=1&set y2=!yy!
	%disp% [!yy!;!x!H³ú³Copy Source code³Û&set/a yy+=1&set y3=!yy!
	%disp% [!yy!;!x!H³ú³Copy Pen color  ³Û&set/a yy+=1&set y4=!yy!
	%disp% [!yy!;!x!H³ú³Paste Here      ³Û&set/a yy+=1
	%disp% [!yy!;!x!HÀÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙÛ&set/a yy+=1
	%disp% [!yy!;!x!H ßßßßßßßßßßßßßßßßßßßß
	%disp% [!Y!;!X!H
	:menux
	for /f "tokens=1,2,3" %%a in ('PicEditor_Files\bg mouse') do set/a x=%%c+1,y=%%b+1,z=%%a
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
	for /f "tokens=1,2,3" %%a in ('PicEditor_Files\bg mouse') do set/a x=%%c+1,y=%%b+1,z=%%a
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
	PicEditor_Files\bg.exe Cursor 100
	!ui! sendkey esc press
	!ui! sendkey esc press
	set /a yy=!y!+1,og.y=!y!,og.x=!x!,max.x=!x!+10&%disp% [;m
	%disp% [!yy!;!x!HÚÄÂÄÄÄÄÄÄ¿ &set/a yy+=1&set y1=!yy!
	%disp% [!yy!;!x!H³ú³Retry ³Û&set/a yy+=1&set y2=!yy!
	%disp% [!yy!;!x!H³ú³Copy  ³Û&set/a yy+=1&set y3=!yy!
	%disp% [!yy!;!x!H³ú³Cancel³Û&set/a yy+=1
	%disp% [!yy!;!x!HÀÄÁÄÄÄÄÄÄÙÛ&set/a yy+=1
	%disp% [!yy!;!x!H ßßßßßßßßßß
	%disp% [!Y!;!X!H
	:PE_sscr_menux
	for /f "tokens=1,2,3" %%a in ('PicEditor_Files\bg mouse') do set/a x=%%c+1,y=%%b+1,z=%%a
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
	PicEditor_Files\bg.exe Cursor 0
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
	%disp% [07;25HÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	%disp% [08;25H³þName of File: þ³Û
	%disp% [09;25H³[              ]³Û
	%disp% [10;25HÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙÛ
	%disp% [11;25H ßßßßßßßßßßßßßßßßßß
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
	set ui=PicEditor_Files\ui.dll
	set lf=^


	set /a bg=9,fg=11,col.bg=0,col.fg=0,col.fl=0,col.bl=0
	set "p1=[2;18H[0;1;40;36m[New]  [Save]  [Open]  [Exit]"
	for /l %%a in (0,1,7) do (
	call :PE_base %%a b
	set "bar.cl=!bar.cl![0;!col.bl!;40;3!col.bg!mþ[;m"
)
	set /a col.bl=5,col.fl=1
	%bs% 1 f & %bs% 3 b
	for %%c in (
	"[24;1H[;m"
	"ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿"
	"³Colors:       ³Brightness³³Brushes:[#]                              ³"
	"³BG:        [ ]³[ ][ ][ ] ³³Û ² ± ° Ü ß    Ú Ä ¿ À Ù © ¸ É Í » Î È³"
	"³FG:        [ ]³[ ][ ][ ] ³³         Á Â Ã Å ´ ³ ® ¯ ¹ º ¼ Ê³"
	"³BF:-  -  - [ ]³ 0  1  5  ³³ þ Ø     ª     ÷ î ï ð ù ú Ï Ì Ë³"
	"ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÙÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ"
	) do set "p2=!p2!%%~c"
	set "bar.color=[26;5H!bar.cl![27;5H!bar.cl!"
	for /l %%a in (1,1,19) do set "sp=!sp!³                                                                    ³"
	for %%a in (
	"[3;1H[0;1;40;32m"
	"ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿"
	"!sp!"
	"ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ"
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
%disp% [26;18Hÿ[26;21Hÿ[26;24Hÿ^
[27;18Hÿ[27;21Hÿ[27;24Hÿ
	if !col.bl!==0 %disp% [26;18H*
	if !col.bl!==1 %disp% [26;21H*
	if !col.bl!==5 %disp% [26;24H*
	if !col.fl!==0 %disp% [27;18H*
	if !col.fl!==1 %disp% [27;21H*
	if !col.fl!==5 %disp% [27;24H*
	goto :eof
:: Koniec programu PicEditor ::

:: Pocz¹tek programu Zbiór szyfrów ::
:SZ_Init
setlocal enabledelayedexpansion
mode con cols=80 lines=30
set ver=wersja 1.1
set maintitle=Zbi¢r szyfr¢w
set ABName1=Polski
set ABName2=Angielski
:SZ_Menu
cls
title %maintitle% - %ver%
echo %maintitle% - %ver%
echo.[0;1;40;37m
echo Witaj w programie do szyfrowania^^!
echo Tu mo¾esz zaszyfrowa† sw¢j tekst na przer¢¾ne sposoby^^! ^^^^^^^^
echo Na pocz¥tek wybierz rodzaj szyfrowania:
echo.
echo [0;1;40;31m-= Szyfry klasyczne: =-[0;40;37m
echo.
echo   1) Szyfr Cezara
echo   2) Szyfr Vigenera
echo   3) Szyfr Bacona
echo   4) Szyfr AtBash
echo.
echo [0;1;40;33m-= Szyfry podobne do Vigenera: =-[0;40;37m
echo.
echo   5) Szyfr Trithemiusa
echo   6) Szyfr Beauforta (odwrocony Vigenera)
echo.
echo [0;1;40;36m-= Szyfry harcerskie i inne: =-[0;40;37m
echo.
echo   7) Szyfr "Gaderypoluki"
echo.
echo   [0;1;40;37m?) Inne szyfry? Podsuwajcie pomysˆy na forum ;)
echo   Q) Quit
echo.
set CodeType=
set /p "CodeType=> "
if "%CodeType%"=="1" set title=Szyfr Cezara&call :SZ_Code
if "%CodeType%"=="2" set title=Szyfr Vigenera&call :SZ_Code
if "%CodeType%"=="3" set title=Szyfr Bacona&call :SZ_3Code
if "%CodeType%"=="4" set title=Szyfr AtBash&call :SZ_Code
if "%CodeType%"=="5" set title=Szyfr Trithemiusa&call :SZ_5Code
if "%CodeType%"=="6" set title=Szyfr Beauforta&call :SZ_Code
if "%CodeType%"=="7" set title=Szyfr "Gaderypoluki"&call :SZ_7Code
if "%CodeType%"=="?" start http://cmdteam.esy.es/index.php?/topic/99-zbi%C3%B3r-szyfr%C3%B3w-7-szyfr%C3%B3w-i-wci%C4%85%C5%BC-ro%C5%9Bnie/
if /i "%CodeType%"=="Q" endlocal&exit /b 0
goto SZ_Menu
:SZ_Code
cls
set ABType=2
title %title% - %ver%
echo %title% - %ver%
echo.
echo Wpisz typ alfabetu:
echo.
echo 1) [0;1;40;31mPol[0;1;40;37mski [A¤BCD...UWYZ½]
echo 2) [0;1;40;34mAng[0;1;40;31miel[0;1;40;37mski [0;1;40;36m(domy˜lny) [0;1;40;37m[ABCDEF...UVWXYZ]
echo.
set /p "ABType=> "
if "%AbType%"=="1" set "CharSet1=A¤BCDE¨FGHIJKLMNãOàPRS—TUWYZ½"&set "CharSet1a=a¥bc†de©fghijklˆmnäo¢prs˜tuwyz¾«"&set Chars=32&goto SZ_%CodeType%Code2
if "%AbType%"=="2" set "CharSet1=ABCDEFGHIJKLMNOPQRSTUVWXYZ"&set "CharSet1a=abcdefghijklmnopqrstuvwxyz"&set Chars=26&goto SZ_%CodeType%Code2
goto SZ_1Code

:SZ_1Code2
echo.
set Num=
set /p "Num=Podaj o ile maj¥ by† przesuni©te litery (ujemna liczba - deszyfracja): "
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
echo Wpisz tekst do przetworzenia:
set Text=
set /p "Text=> " || goto SZ_1Code3
set "Text=%Text:!=#%"
set "Text=%Text:"=%"
cls
echo Czekaj, przetwarzam wpisany tekst. Parametry:
echo - Rodzaj szyfrowania: %title%
echo - Typ alfabetu: %ABType% (!ABName%ABType%!)
if "%CodeType%"=="1" echo - Przesuni©cie o %Num% znak/i/¢w
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
		echo  [0;40;33mPrzetwarzam porcj© znak¢w od !e! do !f!...[0;1;40;37m
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
if defined brute echo Przesuni©cie o %Num%: "%CText%"&goto :EOF
chcp 1250>nul
(echo Wpisany tekst: "%Text%"
echo Wynik koñcowy: "%CText%"
if "%CodeType%"=="1" echo Przesuniêcie o %Num% znak/i/¢w
echo.
echo %title% - Wygenerowane programem "%maintitle%" by CreepyNinja_
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
echo Gotowe^^!
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
set /p "Pass=Podaj klucz do zaszyfrowania tekstu: " || goto SZ_2Code2
set "Pass=%Pass:!=#%"
set "Pass=%Pass:"=%"
for /f "tokens=1* delims=%CharSet1%%CharSet1a%" %%A in ("0a%Pass%") do if not ""=="%%B" echo Podano nieprawidˆowy klucz. Spr¢buj ponownie.&goto SZ_2Code2
echo Moment, przetwarzam klucz...
set c=0
for /l %%# in (0,1,8196) do (
	set "a=!Pass:~%%#,1!"
	if "!a!"=="" set PassL=%%#&goto SZ_2Code3
	call :SZ_2CodeProcess2c
	set "Ch%%#=!c!"
)
:SZ_2Code3
cls
echo Wpisz tekst do przetworzenia:
set Text=
set /p "Text=> " || goto SZ_2Code3
set "Text=%Text:!=#%"
set "Text=%Text:"=%"
:SC_2Code4
cls
echo Czekaj, przetwarzam wpisany tekst. Parametry:
echo - Rodzaj szyfrowania: %title% 
echo - Typ alfabetu: %ABType% (!ABName%ABType%!)
if not "%CodeType%"=="5" echo - Klucz: %Pass%
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
	echo  [0;40;33mPrzetwarzam porcj© znak¢w od !e! do !f!...[0;1;40;37m
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
(echo Wpisany tekst: "%Text%"
if not "%CodeType%"=="5" echo Klucz: "%Pass%"
echo Wynik koñcowy: "%CText%"
echo.
echo %title% - Wygenerowane programem "%maintitle%" by CreepyNinja_
)>Wynik.txt
goto SZ_Done

:SZ_3Code
cls
title %title% - %ver%
echo %title% - %ver%
echo.
echo Wpisz tekst do zaszyfrowania:
echo (Aby deszyfrowa†, wpisz "decode")
set Text=
set /p "Text=> " || goto SZ_3Code
if /i "%Text%"=="decode" goto SZ_3Code2
set "Text=%Text:!=#%"
set "Text=%Text:"=%"
cls
echo Czekaj, przetwarzam wpisany tekst. Parametry:
echo - Rodzaj szyfrowania: %title%
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
(echo Wpisany tekst: "%Text%"
echo Wynik koñcowy: "%CText%"
echo - Szyfracja -
echo.
echo %title% - Wygenerowane programem "%maintitle%" by CreepyNinja_
)>Wynik.txt
goto SZ_Done

:SZ_3Code2
cls
title %title% - %ver%
echo %title% - %ver%
echo.
echo Wpisz tekst do zdeszyfrowania:
echo (Aby szyfrowa†, wpisz "code")
set Text=
set /p "Text=> " || goto SZ_3Code2
if /i "%Text%"=="code" goto SZ_3Code
set "Text=%Text:!=#%"
set "Text=%Text:"=%"
set "CText=%Text%"
set CharSet1=abcdefghijklmnopqrstuvwxyz
set CharSet2=aaaaaaaaabaaabaaaabbaabaaaababaabbaaabbbabaaaabaaaabaabababaababbabbaaabbababbbaabbbbbaaaabaaabbaababaabbbaabbbabaabababbabbababbb
cls
echo Czekaj, przetwarzam wpisany tekst. Parametry:
echo - Rodzaj szyfrowania: %title%
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
(echo Wpisany tekst: "%Text%"
echo Wynik koñcowy: "%CText%"
echo - Deszyfracja -
echo.
echo %title% - Wygenerowane programem "%maintitle%" by CreepyNinja_
)>Wynik.txt
goto SZ_Done

:SZ_4Code2
cls
echo Wpisz tekst do przetworzenia:
set Text=
set /p "Text=> " || goto SZ_4Code2
set "Text=%Text:!=#%"
set "Text=%Text:"=%"
set CharSet2=&set CharSet2a=
for /l %%# in (-1,-1,-%Chars%) do set CharSet2=!CharSet2!!CharSet1:~%%#,1!&set CharSet2a=!CharSet2a!!CharSet1a:~%%#,1!
cls
echo Czekaj, przetwarzam wpisany tekst. Parametry:
echo - Rodzaj szyfrowania: %title% 
echo - Typ alfabetu: %ABType% (!ABName%ABType%!)
goto SZ_1CodeProcess0

:SZ_7Code
cls
set Pass=
set /p "Pass=Podaj klucz do zaszyfrowania tekstu. Litery w kluczu nie mog¥ si© powtarza†: " || goto SZ_7Code
set "Pass=%Pass:!=#%"
set "Pass=%Pass:"=%"
for /f "tokens=1* delims=A¤BCDE¨FGHIJKLMNãOàPQRS—TUVWXYZ½a¥bc†de©fghijklˆmnäo¢pqrs˜tuvwxyz¾«" %%A in ("0A%Pass%") do if not "%%B"=="" goto SZ_7Code
echo Czekaj, sprawdzam haslo...
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
echo Wpisz tekst do przetworzenia:
set Text=
set /p "Text=> " || goto SZ_7Code3
set "Text=%Text:!=#%"
set "Text=%Text:"=%"
cls
echo Czekaj, przetwarzam wpisany tekst. Parametry:
echo - Rodzaj szyfrowania: %title% 
echo - Klucz: %Pass%
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
		echo  Przetwarzam porcj© znak¢w od !e! do !f!...
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
(echo Wpisany tekst: "%Text%"
echo Klucz: "%Pass%"
echo Wynik koñcowy: "%CText%"
echo.
echo %title% - Wygenerowane programem "%maintitle%" by CreepyNinja_
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
echo Gotowe^^! Oto przetworzony tekst:
echo.
echo [0;1;40;33m"%CText%"[0;1;40;37m
echo.
pause
goto :EOF
:: Koniec programu Zbiór szyfrów ::
