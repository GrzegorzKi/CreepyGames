@echo off

setlocal enabledelayedexpansion enableextensions
::MenuShortcut
set next=
set launch=
set notouch=
set return=
echo.
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
if defined next (
	1>&2 echo ERROR: Missing parameter
	1>&2 echo.
	1>&2 call :MenuShortcutUsage
	exit /b 1
)
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

cls
mode con cols=80 lines=30
if not exist batbox.exe call :BatBox
title CreepyGames - Centrum gier i program¢w
:MenuIntro
if defined staticanim (set /a wait=0,wait1=0) else (set /a wait=10,wait1=25)
set IntroMessage=
echo. 2>nul >"%temp%\bridgem"  || (cls&set "IntroMessage=/c 0x0A /g 16 10 /d "Program jest juz uruchomiony w innym oknie." /g 13 11 /d "Aby kontynuowac, zamknij istniejace sesje programu."")
batbox /h 0 /o 1 1 /c 0x0C /g 0 3 /d "/" /g 0 4 /d \ /w %wait% /g 1 2 /d "/" /g 1 4 /d "_" /w %wait% /g 2 1 /d "/" /g 2 3 /d "/" /g 2 4 /d "_" /w %wait% /g 3 0 /d "_" /g 3 2 /d "/" /g 3 3 /d "_" /g 3 4 /d "_" /w %wait% /g 4 0 /d "_" /g 4 1 /d "_" /g 4 3 /d "_" /g 4 4 /d "_" /w %wait% /g 5 0 /d "_" /g 5 1 /d "_" /g 5 3 /d "_" /g 5 4 /d "/" /w %wait% /g 6 0 /d "_" /g 6 1 /d "_" /g 6 4 /d "/" /w %wait% /g 7 0 /d "_" /g 7 1 /d "_" /g 7 3 /d "/" /g 7 4 /d "_" /w %wait% /g 8 0 /d "_" /g 8 1 /d "/" /g 8 2 /d "/" /g 8 4 /d "/" /w %wait% /g 9 1 /d "_" /g 9 3 /d "/" /w %wait% /g 10 1 /d "_" /g 10 2 /d "_" /w %wait% /g 11 1 /d "_" /g 11 2 /d "_" /w %wait% /g 12 1 /d "_" /g 12 2 /d "_" /w %wait% /g 13 1 /d "_" /g 13 2 /d "/" /g 13 3 /d "/" /g 13 4 /d \ /w %wait% /g 14 2 /d "/" /g 14 4 /d "_" /w %wait% /g 15 1 /d "_" /g 15 4 /d "_" /w %wait% /g 16 1 /d "_" /g 16 2 /d "_" /g 16 3 /d "_" /g 16 4 /d "_" /w %wait% /g 17 1 /d "_" /g 17 3 /d "_" /g 17 4 /d "/" /w %wait% /g 18 2 /d \ /g 18 3 /d "/" /w %wait% /g 19 3 /d "/" /g 19 4 /d \ /w %wait% /g 20 2 /d "/" /g 20 4 /d "_" /w %wait% /g 21 1 /d "_" /g 21 4 /d "_" /w %wait% /g 22 1 /d "_" /g 22 2 /d "_" /g 22 3 /d "_" /g 22 4 /d "_" /w %wait% /g 23 1 /d "_" /g 23 3 /d "_" /g 23 4 /d "/" /g 23 5 /d "/" /w %wait% /g 24 2 /d \ /g 24 3 /d "/" /g 24 4 /d "/" /g 24 5 /d "_" /w %wait% /g 25 3 /d "/" /g 25 5 /d "/" /w %wait% /g 26 2 /d "/" /g 26 4 /d "." /w %wait% /g 27 1 /d "_" /g 27 3 /d "/" /g 27 4 /d "_" /w %wait% /g 28 1 /d "_" /g 28 2 /d "_" /g 28 3 /d "_" /g 28 4 /d "_" /w %wait% /g 29 1 /d "_" /g 29 2 /d "_" /g 29 3 /d "/" /g 29 4 /d "_" /w %wait% /g 30 1 /d "_" /g 30 4 /d "/" /w %wait% /g 31 2 /d \ /g 31 3 /d "/" /g 31 5 /d "/" /w %wait% /g 32 3 /d "/" /g 32 4 /d \ /g 32 5 /d "_" /w %wait% /g 33 2 /d "/" /g 33 4 /d "_" /g 33 5 /d "_" /w %wait% /g 34 1 /d "_" /g 34 3 /d "/" /g 34 4 /d "_" /g 34 5 /d "_" /w %wait% /g 35 1 /d "_" /g 35 2 /d "/" /g 35 3 /d "_" /g 35 4 /d "," /g 35 5 /d "_" /w %wait% /g 36 3 /d "/" /g 36 5 /d "/" /w %wait% /g 37 2 /d "/" /g 37 4 /d "/" /w %wait% /g 38 1 /d "_" /g 38 3 /d "/" /w %wait% /g 39 1 /d "_" /g 39 2 /d "/" /g 39 3 /d "/" /g 39 4 /d \ /w %wait% /g 40 2 /d "/" /g 40 4 /d "_" /w %wait% /g 41 1 /d "/" /g 41 3 /d "/" /g 41 4 /d "_" /w %wait% /g 42 0 /d "_" /g 42 2 /d "/" /g 42 3 /d "_" /g 42 4 /d "_" /w %wait% /g 43 0 /d "_" /g 43 1 /d "_" /g 43 3 /d "/" /g 43 4 /d "_" /w %wait% /g 44 0 /d "_" /g 44 1 /d "_" /g 44 2 /d "_" /g 44 4 /d "/" /w %wait% /g 45 0 /d "_" /g 45 1 /d "_" /g 45 2 /d "_" /g 45 3 /d "/" /w %wait% /g 46 0 /d "_" /g 46 1 /d "_" /g 46 3 /d "/" /g 46 4 /d \ /w %wait% /g 47 0 /d "_" /g 47 1 /d "/" /g 47 2 /d "/" /g 47 4 /d "_" /w %wait% /g 48 1 /d "_" /g 48 3 /d "/" /g 48 4 /d "_" /w %wait% /g 49 1 /d "_" /g 49 2 /d "_" /g 49 3 /d "_" /g 49 4 /d "," /w %wait% /g 50 1 /d "_" /g 50 2 /d "_" /g 50 3 /d "/" /g 50 4 /d "_" /w %wait% /g 51 1 /d "_" /g 51 2 /d \ /g 51 4 /d "/" /w %wait% /g 52 2 /d "`" /g 52 3 /d "/" /g 52 4 /d "/" /w %wait% /g 53 1 /d "_" /g 53 2 /d "/" /g 53 3 /d "/" /g 53 4 /d "_" /w %wait% /g 54 2 /d "/" /g 54 4 /d "/" /w %wait% /g 55 1 /d "_" /g 55 3 /d "/" /w %wait% /g 56 1 /d "_" /g 56 2 /d "_" /g 56 4 /d "/" /w %wait% /g 57 1 /d "_" /g 57 2 /d "_" /g 57 3 /d "/" /g 57 4 /d "_" /w %wait% /g 58 1 /d "_" /g 58 2 /d \ /g 58 4 /d "/" /w %wait% /g 59 2 /d "`" /g 59 3 /d "/" /w %wait% /g 60 1 /d "_" /g 60 2 /d "_" /g 60 4 /d "/" /w %wait% /g 61 1 /d "_" /g 61 2 /d "_" /g 61 3 /d "/" /g 61 4 /d "_" /w %wait% /g 62 1 /d "_" /g 62 4 /d "/" /w %wait% /g 63 2 /d \ /g 63 3 /d "/" /w %wait% /g 64 3 /d "/" /g 64 4 /d \ /w %wait% /g 65 2 /d "/" /g 65 4 /d "_" /w %wait% /g 66 1 /d "_" /g 66 4 /d "_" /w %wait% /g 67 1 /d "_" /g 67 2 /d "_" /g 67 3 /d "_" /g 67 4 /d "_" /w %wait% /g 68 1 /d "_" /g 68 3 /d "_" /g 68 4 /d "/" /w %wait% /g 69 2 /d \ /g 69 3 /d "/" /g 69 4 /d "/" /w %wait% /g 70 3 /d "(" /g 70 4 /d "_" /w %wait% /g 71 2 /d "/" /g 71 3 /d "_" /g 71 4 /d "_" /w %wait% /g 72 1 /d "_" /g 72 3 /d "_" /g 72 4 /d "_" /w %wait% /g 73 1 /d "_" /g 73 2 /d "_" /g 73 4 /d "_" /w %wait% /g 74 1 /d "_" /g 74 2 /d "_" /g 74 4 /d "/" /w %wait% /g 75 1 /d "_" /g 75 2 /d "_" /g 75 3 /d ")" /w %wait% /g 76 1 /d "_" /g 76 2 /d "/" /g 18 8 /c 0x02 /d "Centrum gier i programow - By CreepyNinja" %IntroMessage% /h 1 /c 0x0F /w 2000
:MenuInit
if defined IntroMessage ping localhost -n 2 >nul
echo. 2>nul >"%temp%\bridgem"  || (cls&goto MenuIntro)
cls
set Version=v1.0.0
cd /d "%~dp0"

::Sekcja makr
set Macro_Loading=if not defined launch cls^&batbox.exe /h 0 /o 0 0 /w 150 /d "------------------------------------------------------------------" /w 50 /g 0 0 /d "                                                                  " /g 0 1 /d "------------------------------------------------------------------" /w 50 /g 0 1 /d "                                                                  " /g 1 1 /d "Trwa ladowanie programu @Program@, prosze czekac..." /g 0 2 /d "------------------------------------------------------------------" /w 50 /g 0 2 /d "                                                                  " /g 0 3 "------------------------------------------------------------------" /w 50 /g 0 3 /d "[                                                                ]" /g 0 4 /d "==================================================================" /g 1 3 /c 0x04 /d "#####################" /c 0x06 /d "######################" /c 0x02 /d "#####################" /w 150 /c 0x0C /g 1 3 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /c 0x0E /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /c 0x0E /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /c 0x0A /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /c 0x0A /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 15 /d "#" /w 300 /c 0x0F /g 0 4 /d "                                                                  " /g 0 3 /d "------------------------------------------------------------------" /w 50 /g 0 3 /d "                                                                  " /g 0 2 /d "------------------------------------------------------------------" /w 50 /g 0 2 /d "                                                                  " /g 0 1 /d "------------------------------------------------------------------" /w 50 /g 0 1 /d "                                                                  " /g 0 0 /d "------------------------------------------------------------------" /w 50 /g 0 0 /d "                                                                  " /w 150 /h 1 /c 0x07^&cls

:MenuConfig1
set CfgID=1
setlocal
set "WelcomeText= Witaj w centrum gier i program¢w CreepyGames(TM)^^^^^! Wybierz opcje:"

set Col1=30
set Col2=31

set MenuEntityCount=4
set Menu1Count=3
set Menu2Count=4
set Menu3Count=0
set Menu4Count=0

set Menu1Name=Gry wszelakiego rodzaju
set Menu2Name=Programy
set Menu3Name=About CreepyGames
set Menu4Name=Wyjd«

set Menu1Name1=MineSweeper
set Menu1Name2=Wisielec
set Menu1Name3=BatCraft (By Mac)
set Menu1Do1=call :MS_Init
set Menu1Do2=call :WS_Init
set Menu1Do3=call :XX_BatCraft

set Menu2Name1=CreepyChess
set Menu2Name2=Administrative Tools
set Menu2Name3=Batch of Pi
set Menu2Name4=Test Samples
set Menu2Name5="MY" System [Coming soon...]
set Menu2Do1=call :CC_Init
set Menu2Do2=call :AT_Init
set Menu2Do3=call :PI_BatchOfPi
set Menu2Do4=call :MenuConfig2

set Menu3Do0=call :MenuAbout
set Menu4Do0=goto MenuExit

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


:MenuAutoConfig
set /a MenuEntityCount=MenuEntityCount
if %MenuEntityCount% LEQ 0 (
	1>&2 echo ERROR: Var 'MenuEntityCount' ^<=0
	1>&2 echo.
	1>&2 echo Program will be closed immediately.
	exit /b 1
)
if not defined color set color=0F
color %color%
cd /d "%~dp0"
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
set TitleText=!B:~0,%C%!-= CreepyNinja_ Touch Menu =-
set "A=ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ"
mode con cols=%Cols% lines=%Lines%
goto Menu

:MenuHybridAutoConfig
set /a C=Cols/2 -14
set TitleText=!B:~0,%C%!-= CreepyNinja_ Hybrid Menu =-
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
echo.%TitleText%
echo.%WelcomeText%
echo  É!A:~0,%Col1%!»%Line1:~1%
set x=1
for /l %%a in (1,1,%MenuEntityCount%) do (
	call :Menu1 %%a
)
set /a x+=1
for /l %%a in (%x%,1,%TextLines%) do echo. !B:~0,%Col1%! !Line%%a!
:MenuGetInput
"%~dp0batbox.exe" /m >bridgem 2>nul || goto MenuSessionConflict
for /f "tokens=1,2,3 delims=:" %%a in (bridgem) do (
	set X=%%a
	set Y=%%b
)
if %X% GTR 1 (if %X% LSS %ColGet1% (
	for /l %%a in (1,1,%MenuEntityCount%) do (
		call :Menu2 %%a || (set Result=!Menu%%aDo0!&goto MenuLaunch)
		if "!ok!"=="1" goto Menu
	)
) else (if !MenuActive! GTR 0 (if %X% GTR %ColGet1% (if %X% LSS %ColGet2% (
	for /l %%a in (1,1,!Menu%MenuActive%Count!) do (
		call :Menu3 %%a || (set Result=!Menu%MenuActive%Do%%a!&goto MenuLaunch)
	)
)))))
goto MenuGetInput

:Menu1
set "Line= !Menu%1Name!                                                 "
set /a x+=1
echo  º!B:~0,%Col1%!º!Line%x%:~1!
set /a x+=1
echo  º!Line:~0,%Col1%!º!Line%x%:~1!
set /a x+=1
echo  º!B:~0,%Col1%!º!Line%x%:~1!
set /a x+=1
if "%1"=="%MenuEntityCount%" (echo  È!A:~0,%Col1%!¼!Line%x%:~1!) else (echo  Ì!A:~0,%Col1%!¹!Line%x%:~1!)
goto :EOF
:Menu2
set /a d=%1-1
if %Y% GTR !Menu%d%Get! (if %Y% LSS !Menu%1Get! (if "!Menu%1Count!"=="0" (exit /b 1) else (
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
		set Line!x!=º!Line:~0,%Col2%!º
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
echo.%TitleText%
echo.%WelcomeText%
echo.
set x=!Line0:~0,%col2%!!A:~0,%col2%!
echo  Ä!A:~0,%col1%!ÂÄ!x:~0,%col2%!
for /l %%a in (1,1,%MenuEntityCount%) do (
	echo  !B:~0,%col1%! ³
	set x=%%a^) !Menu%%aName!!B:~0,%col1%!
	echo  !x:~0,%col1%! ³ !Line%%a:~0,%col2%!
)
if !TextLines! GTR !MenuEntityCount! (
	set /a y=MenuEntityCount+1
	for /l %%a in (!y!,1,!TextLines!) do (
		echo  !B:~0,%col1%! ³
		echo  !B:~0,%col1%! ³ !Line%%a:~0,%col2%!
	)
)
echo  !B:~0,%col1%! ³
echo  Ä!A:~0,%col1%!ÁÄ!A:~0,%col2%!
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
						1>&2 echo ERROR: Invalid program to launch.
						1>&2 echo.
						1>&2 call :MenuShortcutUsage
						exit /b 1
))))))
exit /b 0

:MenuAbout
cls
echo.
echo   CreepyGames(TM) %Version% - centrum gier i program¢w
echo.
echo   Program ten zbiera wszystkie gry i programy napisane przez
echo   CreepyNinja (czyli mnie :D), a tak¾e te napisane przez
echo   innych u¾ytkownik¢w z forum CMDTeam.
echo.
echo   Jestem wielce otwarty na propozycje zmian, dodania nowych gier,
echo   program¢w itp.  Ku temu s?u¾y przecie¾ ten program -
echo   zbiera wszystkie programiki do jednego ;)
echo.
echo   CreepyGames(TM) By CreepyNinja_  All Rights Reserved
echo   Zapraszam r¢wnie¾ na forum CMDTeam.esy.es, gdzie
echo   znajdziecie WI¨CEJ batchowych wytwor¢w. Pozdro :P
echo.
if defined notouch (echo.&echo   Kliknij dowolny klawisz, aby kontynuowa†...&pause>nul&goto :EOF)
echo.  ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo   º                                                            º
echo   º      Kliknij gdziekolwiek, by wr¢ci† do g?¢wnego menu      º
echo   º                                                            º
echo   ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
"%~dp0batbox" /m >"%Temp%\bridgem" 2>nul || (echo Modu? BatBox.exe niedost©pny. Kliknij cokolwiek, aby wr¢ci† do menu...&pause>nul)
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
echo.
echo          -n, --notouch   Zast©puje Touch Menu tradycyjnym menu.
echo            -t, --touch   Czynno?† odwrotna do '--notouch' (domy?lne)
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
if not exist "%~dp0batbox.exe" call :BatBox "FIX"&goto Menu
cls
echo Program jest juz uruchomiony w innym oknie,
echo co prowadzi do kofliktu sesji.
echo Zamknij inne okna programu i spr¢buj ponownie.
pause>nul
echo. 2>nul >"%temp%\bridgem" || (cls&exit /b 32)
goto Menu

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
 Cscript /b /e:vbs t.dat>batbox.ex_
 Del /f /q /a t.dat >nul 2>&1
 Expand -r batbox.ex_ >nul 2>&1
 Del /f /q /a batbox.ex_ >nul 2>&1
if /i "%~1"=="FIX" copy batbox.exe "%~dp0"&del batbox.exe
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



:MS_Init
setlocal enabledelayedexpansion enableextensions
set Program=MineSweeper
%Macro_Loading:@=!%
cd /d "%~dp0"
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
echo      #%%%%##(/**,....º 2) Zmieä kolor t?a               º%%%%%%%%##,,*/(#%%%%
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
set /p "cho=> "
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
echo          ,*//((#(^&@@@ºWybierz poziom trudno?ci:º,,,####(/**.      
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
set /p "cho=> "
if "%cho%"=="1" set /a PlayX=9,PlayY=9,Mines=10&goto MS_Set0
if "%cho%"=="2" set /a PlayX=16,PlayY=16,Mines=40&goto MS_Set0
if "%cho%"=="3" set /a PlayX=30,PlayY=16,Mines=99&goto MS_Set0
if "%cho%"=="4" goto MS_SelectOwn
goto MS_Select

:MS_SelectOwn
cls
set PlayX=
set /p PlayX=Podaj d?ugo?† planszy (do 40): 
if "%PlayX%"=="" goto MS_SelectOwn
for /f "tokens=2* delims=0123456789" %%A in (" 0%PlayX%") do if not ""=="%%A" goto MS_SelectOwn
if %PlayX% LSS 9 goto MS_SelectOwn
if %PlayX% GTR 40 goto MS_SelectOwn
echo.
set PlayY=
set /p PlayY=Podaj szeroko?† planszy (do 40): 
if "%PlayY%"=="" goto MS_SelectOwn
for /f "tokens=2* delims=0123456789" %%A in (" 0%PlayY%") do if not ""=="%%A" goto MS_SelectOwn
if %PlayY% LSS 9 goto MS_SelectOwn
if %PlayY% GTR 40 goto MS_SelectOwn
echo.
set /a min=PlayX*PlayY/6
set /a max=PlayX*PlayY/3
set /p Mines=Podaj ilo?† min (min. %min%, max. %max%): 
if "%Mines%"=="" goto MS_SelectOwn
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
echo Czekaj, trwa ?adowanie...
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
"%~dp0batbox.exe" /m >bridge 2>nul || (if not exist "%~dp0batbox.exe" (call :Batbox FIX) else (cls&echo Gra jest uruchomiona w innym oknie,&echo co prowadzi do kofliktu sesji.&echo Zamknij inne okna programu i spr¢buj ponownie.&pause>nul)&goto MS_GetInput)

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
"%~dp0batbox.exe" /k
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



:WS_Init
setlocal enabledelayedexpansion enableextensions
set Program=Wisielec
%Macro_Loading:@=!%
cd /d "%~dp0"
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
echo  º 2) Zmieä kolor t?a                  º
echo  º 3) Zmieä kolor tekstu               º
echo  º 4) Modyfikuj u?atwiacze             º
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
set /p "cho=³_³> "
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
echo  º U?atwiacze pomagaj¥ odgadywa† s?owa º
echo  º Zwi©kszenie liczby pr¢b jest jednak º
echo  º OSZUSTWEM - wyniki nie bed¥ liczone º
echo  ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo   1) Podawaj pierwsz¥ liter© s?owa [%FirstLetter%]
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
echo       º 4) Ro?liny               º  ^|
echo       º 5) Zwierz©ta             º / \
echo       º 6) -= Wybierz losowo =-  º
echo       º                          º 
echo       º 7) W?asne (slownik.txt)  º
echo       º 8) Ze s?ownika SJP.pl    º ÍËÍ
echo       º 9) Gra 1v1               º  º
echo       º                          º  ³
echo       º Q) Wr¢† do menu          º  ³
echo       ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍ¼
set cho=
set /p "cho=> "
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
set Category=Ro?liny
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
set Category=W?asne
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
for /f "delims=Aa¤¥BbCc†DdEe¨©FfGgHhIiJjKkLlˆMmNnãäOoà¢PpQqRrSs—˜TtUuVvWwXxYyZz«½¾ " %%A in ("%Pass%") do if not ""=="%%A" echo S?owo wylosowane zawiera niedozwolone znaki ("%Pass%")^^!&echo Wylosuj s?owo ponownie.&pause>nul&goto WS_Select
if "%Pass:~2,1%"=="" echo Wylosowane s?owo jest za kr¢tkie^^!&echo Wylosuj s?owo ponownie.&pause>nul&goto WS_Select
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
echo Zgadnij s?owo: %Word:#=!%
echo Kategoria: %Category%
if defined EOG goto WS_EOG%eog%
if [%Tries%]==[1] (set /p "=Ostatnia szansa^!"<nul) else (set /p "=Pozosta?o %Tries% pr¢b."<nul)
echo  Ostatnio: %Dialog%
echo.
echo P¢ki co "zgad?e?" nast©puj¥ce litery:%Guesses%
echo.
set Guess=
set /p Guess=Wpisz kolejn¥ liter© lub "Zgaduj", by odgadn¥† ca?e s?owo: 
if not defined Guess goto WS_Guess
for /f "delims=Aa¤¥BbCc†DdEe¨©FfGgHhIiJjKkLl?MmNnãäOoà¢PpQqRrSs—?TtUuVvWwXxYyZz«½¾" %%A in ("%Guess:~0,1%") do if not ""=="%%A" goto WS_Guess
if /i "%Guess%"=="Q" goto WS_GuessExit
if /i "%Guess%"=="Zgaduj" goto WS_GuessWord
set "Guess=%Guess:~0,1%"
if not "!Guesses:%Guess%=!"=="!Guesses!" set /p "=Ju¾ zgadywa?e? t¥ liter©..."<nul&pause>nul&goto WS_Guess

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
set Dialog=NIE trafi?e?.
set /a OldScore=Score
if %Tries% GTR 10 goto WS_Guess
goto WS_Update%Tries%
:WS_GotLetter
set X=+
if %Score% GTR %LCount% set EOG=2&goto WS_Guess
set Dialog=Zgad?e?.
set /a OldScore=Score
goto WS_Guess

:WS_GuessWord
set /p Guess=S?owo brzmi 
if /i "%Guess%"=="%Pass%" (
	for /l %%# in (0,1,%LCount%) do (
		if "!S%%#!"=="_" set S%%#=!L%%#!
	)
	set /a Score=LCount+1
)
goto WS_Check

:WS_GuessExit
set cho=
set /p cho=Na pewno chcesz opu?ci† gr©? (T/N) 
if /i "%cho%"=="T" set EOG=1&goto WS_Guess
if /i "%cho%"=="N" goto WS_Guess
goto WS_GuessExit

:WS_EOG1
echo.
echo Niestety przegra?e? !Name%PvPTurn%!...
echo S?owem do odgadni©cia by?o: "%Pass%".
if not "%PvPMode%"=="ON" (if not "%MoreTries%"=="ON" (set /a Loses+=1))
goto WS_Restart

:WS_EOG2
echo.
echo Wygra?e? !Name%PvPTurn%!^^!
echo Zgad?e? s?owo "%Pass%" za %Tried% razem^^!
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
echo Teraz grasz/gracie w trybie gry "1v1", gdzie jedna osoba pisze s?owo
echo do odgadni©cia, za? druga ma za zadanie je odgadn¥†. Proste, nie? :P
echo Aby wyj?† z kreatora gry, wci?nij 'Q'.
echo.
echo Prosimy o podanie swoich imion:
echo.
set Name1=
set /p "Name1=Imi© pierwszego gracza: "
if "%Name1%"=="" goto WS_Select9
if /i "%Name1%"=="Q" goto WS_Select
echo.
:WS_Select9A
set Name2=
set /p "Name2=Imi© drugiego gracza: "
if "%Name2%"=="" goto WS_Select9A
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
echo Podaj has?o, kt¢re ma !Name%PvPTurn%! odgadn¥†
set /p "Pass=Wpisz 'losuj', je¾eli nie b©dziesz mia? pomys?u: "
if "%Pass%"=="" goto WS_PrepareWord
if /i "%Pass%"=="Losuj" pushd Wisielec_Files&set Route=X&echo Losuj© s?owo...&goto WS_Download1
for /f "delims=Aa¤¥BbCc†DdEe¨©FfGgHhIiJjKkLlˆMmNnãäOoà¢PpQqRrSs—˜TtUuVvWwXxYyZz«½¾ " %%A in ("%Pass%") do if not ""=="%%A" set "Dialog=echo Has?o zawiera niedozwolone znaki."&goto WS_PrepareWord
if "%Pass:~2,1%"=="" set "Dialog=echo Has?o jest za kr¢tkie."&goto WS_PrepareWord
:WS_WS_PrepareWord2
cls
set Category=
set /p "Category=Podaj kategori© s?owa (dla u?atwienia zgaduj¥cemu): "
if "%category%"=="" goto WS_WS_PrepareWord2

:WS_SelectOwn3
setlocal
call :WS_PvPPrepare %PvPTurn%
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
if %Name1Score% GTR %Name2Score% (goto WS_EndPvP1) else (if %Name2Score% GTR %Name1Score% goto WS_EndPvP2)

:WS_EndPvP0
echo Mamy remis^^!^^! (Wynik: %Name1Score% - %Name2Score%)
echo.
echo C¢¾, i tak bywa :)
goto WS_Restart

:WS_EndPvP1
echo %Name1% wygrywa^^!^^! (Wynik: %Name1Score% - %Name2Score%)
echo.
echo Szczere gratulacje z mojej strony :P
echo Ale pami©tajmy, ¾e to tylko gra - raz si© wygrywa, raz si© przegrywa.
goto WS_Restart

:WS_EndPvP2
echo %Name2% wygrywa^^!^^! (Wynik: %Name1Score% - %Name2Score%)
echo.
echo Szczere gratulacje z mojej strony :P
echo Ale pami©tajmy, ¾e to tylko gra - raz si© wygrywa, raz si© przegrywa.
goto WS_Restart

:WS_Select8
set Route=
mode con cols=70 lines=30
pushd Wisielec_Files
set DownloadTip0=A jest ich du¾o, bo a¾ 150 tysi©cy s?¢wek^^! (stan na 29/03/15)
set DownloadTip1=Wymagany jest: Internet, modu? wget.exe i m¢zg :P
set DownloadTip2=Nie zapisze je w formie sta?ej, bo jest ich po prostu za du¾o :(
set /a Rand=%random% %% 3

:WS_Select8A
cls
if not exist wget.exe echo Aby m¢c pobiera† dane ze s?ownika SJP, potrzebny jest modu? wget.exe.&echo Mo¾esz go pobra† st¥d: http://nebm.ist.utl.pt/~glopes/wget/&echo Albo pobieraj¥c paczk© z gr¥ ponownie.&pause>nul&popd&goto WS_Select
echo Program ma mo¾liwo?† pobierania s?¢w do Wisielca z Internetu :D
echo Pobiera je ze strony *SJP.pl*, i to tylko takie, kt¢re zaczynaj¥
echo si© na dan¥ liter© b¥d« ci¥g znak¢w.
echo.!DownloadTip%Rand%!
echo.
echo Aby wr¢ci† do menu, wpisz 'Q'.
echo Aby wylosowa† (dos?ownie) randomowe s?owo, wpisz '0'.
echo.
set Letter=
set /p Letter=Podaj liter©/ci¥g liter, na kt¢r¥ ma si© zacz¥† s?owo: 
if "%Letter%"=="" goto WS_Select8A
if /i "%Letter%"=="Q" popd&goto WS_Select
set Letter=!Letter:?=%%B6!
set Letter=!Letter:¥=%%B1!
set Letter=!Letter:«=%%BC!
cls
set DownTries=1
echo Oczekuj© na odpowied« serwera...
:WS_Download1
set Skip=96
wget "http://sjp.pl/slownik/lp.phtml?f_st=%Letter%&f_mn=0&f_vl=2" -T 3 -t 1 -O SJP.html --quiet
if errorlevel 1 (if not "%DownTries%"=="3" (echo Ponawiam pr¢b© po?¥czenia...&set /a DownTries+=1&goto WS_Download1) else (echo Serwer nie odpowiada. Spr¢buj ponownie p¢«niej...&pause>nul&goto WS_Select8A%Route%))
set Count=0
for /f "tokens=1,4 delims=^<^> skip=%skip%" %%A in (SJP.html) do (
	if not "%%A"=="tr" goto WS_Download2
	set /a Count+=1
)
:WS_Download2
if "%Count%"=="0" echo Brak s?¢w zaczynaj¥cych si© na podan¥ liter© :(&pause>nul&goto WS_Select8A%Route%
set Pages=0
set /a Skip1=96+%Count%+4
for /f "tokens=1,2 skip=%skip1% delims=^<^>" %%A in (SJP.html) do (
	if "%%A"=="/p" goto WS_Download3
	set Pages=%%B
)
:WS_Download3
echo Pobieram odpowiedni plik z list¥ s?¢wek...
if "%Pages%"=="0" goto WS_Download4
set /a Page=%random% %% Pages +1
:WS_Download4
wget "http://sjp.pl/slownik/lp.phtml?f_st=%Letter%&f_mn=0&f_vl=2&page=%Page%" -T 3 -t 1 -O SJP.html --quiet
if errorlevel 1 (if not "%DownTries%"=="3" (echo Ponawiam pr¢b© po?¥czenia...&set /a DownTries+=1&goto WS_Download4) else (echo Serwer nie odpowiada. Spr¢buj ponownie p¢«niej...&pause>nul&goto WS_Select8A%Route%))
echo Analizuj© pobrany plik...
chcp 1250>nul
set Count=0
for /f "tokens=1,4 delims=^<^> skip=%skip%" %%A in (SJP.html) do (
	if not "%%A"=="tr" goto WS_Download5
	set /a Count+=1
	set Pass!Count!=%%B
)
:WS_Download5
popd
set /a Rand=%random% %% Count +1
set Pass=!Pass%Rand%!
set Pass=%Pass:¶=œ%
set Pass=%Pass:±=¹%
set Pass=%Pass:¼=Ÿ%
chcp 852>nul
if defined route set Dialog=echo.%Pass%&goto WS_PrepareWord
set Category=Pobrane ze s?ownika SJP
goto WS_Set


:WS_Warning
cls
title %title%
echo OSTRZE½ENIE: Nie znaleziono folderu "Wisielec_Files".
echo Folder ten przechowuje m.in. s?¢wka do gry, modu? do
echo pobierania stron SJP.pl oraz preferencje u?atwiaczy.
echo Z powodu braku s?¢wek do gry, granie w domy?lnych
echo kategoriach z menu b©dzie niemo¾liwe^^!
echo.
echo Zalecamy pobra† ponownie paczk© z gr¥. W przeciwnym razie
echo mo¾liwa b©dzie tylko gra na w?asne s?¢wka oraz gra 1v1.
pause>nul
goto :EOF

:WS_MissingFile
chcp 852>nul
echo Nie znaleziono pliku z list¥ s?¢wek^^!
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
echo Plik "Slownik.txt" jest potrzebny do u¾ywania w?asnych s?¢w w grze Wisielec
echo Utworzy?em ci go ju¾, by? si© za bardzo nie m©czy? :)
echo Twoim zadaniem natomiast b©dzie:
echo.
echo 	- Wype?nienie pliku wpisuj¥c s?owa linijka po linijce
echo 	- LINIJKA PO LINIJCE, nie po przecinku, ?redniku czy cu?^^!
echo 	- No i nie radzi?bym wpisywa† wi©kszej ilo?ci s?¢w ni¾ 2500.
echo.
set /p "=To chyba tyle :P Zatem do roboty..." <nul
pause>nul
goto WS_Select



:CC_Init
setlocal enabledelayedexpansion enableextensions
set Program=CreepyChess
%Macro_Loading:@=!%

set "location=%~dp0CreepyChess_Files\"
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
batch# /box 2 2 "Dzia³ pomocy (str. 2)" "Witaj w dziale pomocy^! Wybierz interesuj¹ce Ciê pytanie:" "" "$$     Czy program bêdzie aktualizowany?     " "" "$$          Jak mogê utworzyæ skrót?         " "" "$$ Dlaczego max. liczba osób jest taka ma³a? " "" "" "" "" "" "" "" "" "" "$$             ^<- Poprzednia strona          " "" "$$Wróæ do menu"
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
batch# /box 2 2 "Jak mogê utworzyæ skrót?" "£atwo. Klikasz PPM->Nowy skrót->Podajesz nazwê programu " "oraz parametry (dowolnie):" "" "/title [tytu³]" "/osob [liczba osob]" "/rund [liczba rund]" "/bch (W³¹cza liczenie Buchholza)" "/print (W³¹cza drukowanie)" "" "albo:" "" "[/about | /?]" "" "Lub skorzystaj z kreatora skrótów:" "" "$$Kreator skrótów" %str8%
if "%errorlevel%"=="1" goto CC_sc-creator
goto CC_helpdesk-a
:CC_helpdesk-a3
if %max_osob% LSS 50 (set a="Bo tak sobie ustawi³eœ :P - %max_osob% to rzeczywiœcie ma³o") else (set a="%max_osob% osób - to dla Ciebie ma³o?")
batch# /box 2 2 "Dlaczego maksymalna liczba osób jest taka ma³a?" %a% "" "No skoro tak, to powiem ci, jak zmieniæ:" "" "Je¿eli masz w folderze plik *settigns.ini*, otwórz go" "i zmieñ wartoœæ zmiennej *max_osob* na jak¹ tam chcesz. " "" "Przyk³ad:" "" "(Zawartoœæ pliku settings.ini)" "max_osob=1000" "skip_intro=ON" "..." "" "--= Ale nie próbuj dopisywaæ innych zmiennych^! =--" "(bo i tak ci to nie wyjdzie :))" %str8%
goto CC_helpdesk-a
:CC_helpdesk-9
:CC_helpdesk-a5
goto CC_menu


:PI_BatchOfPi
mode con cols=81 lines=20
:PI_BatchOfPi1
cls
echo.
set NumQuads=
echo Podaj "liczb© dok?adno?ci" (im wy¾sza liczba, tym dok?adniejszy b©dzie wynik,
set /p NumQuads=a tak¾e program b©dzie d?u¾ej liczy†): 

set /a NumQuads=%NumQuads%+0
if %NumQuads% LSS 5 goto PI_BatchOfPi1
cls

setlocal EnableDelayedExpansion
echo.pi.bat  -  By Don Cross  -  http://cosinekitty.com
set /a MaxQuadIndex = NumQuads - 1

echo.
echo.%time% - started
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
            echo.!time! - finished !Formula!
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
    echo.%1 = !PrintBuffer!
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

:XX_BatCraft
set Program=BatCraft by Mac
%Macro_Loading:@=!%
set Program=

title BatCraft
if /i "%loaded%"=="y" goto XX_BatCraftLoop
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
set Line3=Q - Wyj?cie
set loaded=Y
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


:XX_TestSamples
cls
echo Odpalam program...^|
echo ------------------'
if /i exist "%~dp0TestSamples_Files\%~1" (if /i not "%~2"=="Code" (call "%~dp0TestSamples_Files\%~1") else (start notepad.exe "%~dp0TestSamples_Files\%~1")) else (echo Wymagany plik nie zosta? znaleziony...&pause>nul)
goto :EOF


:AT_Init
setlocal enabledelayedexpansion
title Administrative Tools
cd /d "%~dp0"
if not exist "%~dp0batbox.exe" call :BatBox
cls
mode con cols=80 lines=30
set ParameterStatus=-
:AT_Start
pushd "%temp%"
set Params=
"%~dp0batbox.exe" /g 0 0
echo                               Administrative Tools                              ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ taskmgr ^| dxdiag ^| regedit ^| resmon ^| netplwiz ^| devmgmt.msc ^| netstat  ^| sfc  ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ cls ^| cmd ^| help ^| systeminfo ^| netstat -a ^| ftp ^| chkdsk ^| Parameters%ParameterStatus% ^| EXIT ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
"%~dp0batbox.exe" /g 0 28
"%~dp0batbox.exe" /m >bridgea 2>nul || goto MenuSessionConflict
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