@ping www.google.pl -n 1 -w 2000>nul
@if errorlevel 1 (echo Brak polaczenia z Internetem) else (echo Polaczono z Internetem)
@pause>nul