@echo off
set lewa=
set /p "lewa=Wpisz tekst, ktory zostanie wyrownany: "
set prawa=                                       %lewa%
echo                                      ^|
echo %prawa:~-37%^|%lewa:~0,37%
echo                                      ^|
pause>nul