rem build and install lhs

echo off

set Rversion=R-3.2.3

set Rcommand="C:\Program Files\R\%Rversion%\bin\R.exe"
set Rcommand32="C:\Program Files\R\%Rversion%\bin\i386\R.exe"
set Rcommand64="C:\Program Files\R\%Rversion%\bin\x64\R.exe"
:: %Rcommand% CMD INSTALL --build lhs_*.tar.gz

if "%1" == "check" (
	%Rcommand% CMD check ..\..\pkg\lhs --as-cran
) else if "%1" == "build" (
	echo **** R CMD build lhs ****
	%Rcommand% CMD build ..\..\pkg\lhs
) else if "%1" == "install" (
	%Rcommand% CMD INSTALL ..\..\pkg\lhs
)

PAUSE
