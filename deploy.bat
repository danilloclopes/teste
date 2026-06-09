@echo off

cd /d "%~dp0"


@REM ALTERE AS VARIÁVEIS DE AMBIENTE ABAIXO CONFORME A SUA MÁQUINA
set "TOMCAT_HOME=D:\Tomcat\apache-tomcat-9.0.117"
set "JAVA_HOME=C:\Program Files\Eclipse Adoptium\jdk-17.0.18.8-hotspot"
set "MAVEN_HOME=C:\Program Files\Apache\maven"


set "CATALINA_HOME=%TOMCAT_HOME%"
set "PATH=%JAVA_HOME%\bin;%MAVEN_HOME%\bin;%CATALINA_HOME%\bin;%PATH%"
set "PROJECT_DIR=%~dp0"
set "APP_NAME=agendamento-personagens"
set "WAR_FILE=%PROJECT_DIR%target\%APP_NAME%.war"
set "WEBAPPS_DIR=%TOMCAT_HOME%\webapps"
set "APP_WAR=%WEBAPPS_DIR%\%APP_NAME%.war"
set "APP_DIR=%WEBAPPS_DIR%\%APP_NAME%"
set "APP_URL=http://localhost:8080/%APP_NAME%/"


call mvn clean package

call "%TOMCAT_HOME%\bin\shutdown.bat" >nul 2>&1

del /F /Q "%APP_WAR%" >nul 2>&1
rmdir /S /Q "%APP_DIR%" >nul 2>&1

copy /Y "%WAR_FILE%" "%WEBAPPS_DIR%"

call "%TOMCAT_HOME%\bin\startup.bat"

timeout /t 2 /nobreak >nul

start chrome "%APP_URL%"
