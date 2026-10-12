@echo off
title TAP Food Application - Server Launcher
echo ===================================================
echo   Starting TAP Food Application Server...
echo ===================================================

set "JAVA_HOME=C:\Program Files\Java\jdk-17"
set "CATALINA_HOME=C:\Users\acer\apache-tomcat-10.1.59"
set "PROJECT_DIR=C:\Users\acer\eclipse-workspace\food_app_tap"

echo [1/3] Compiling Java classes...
cd /d "%PROJECT_DIR%"
"%JAVA_HOME%\bin\javac" -cp "%CATALINA_HOME%\lib\servlet-api.jar" -d "%PROJECT_DIR%\WebContent\WEB-INF\classes" "%PROJECT_DIR%\src\com\tap\model\*.java" "%PROJECT_DIR%\src\com\tap\DAO\*.java" "%PROJECT_DIR%\src\com\tap\DAOImpl\*.java" "%PROJECT_DIR%\src\com\tap\servlet\*.java"

echo [2/3] Deploying to Apache Tomcat...
xcopy /E /Y /I "%PROJECT_DIR%\WebContent\*" "%CATALINA_HOME%\webapps\food_app_tap\" > nul

echo [3/3] Launching Tomcat Server...
start "" "%CATALINA_HOME%\bin\startup.bat"

timeout /t 3 > nul
echo Opening application in browser...
start http://localhost:8080/food_app_tap/home

echo.
echo ===================================================
echo   SUCCESS! TAP Food App is now running at:
echo   http://localhost:8080/food_app_tap/home
echo ===================================================
pause
