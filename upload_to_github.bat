@echo off
title Upload Food App to GitHub
color 0b

echo ========================================================
echo       Upload Food App (food_app_tap) to GitHub
echo ========================================================
echo.
echo Please make sure you created a repository named:
echo    food_app_tap
echo on https://github.com/new first!
echo.
pause

git init
git add .
git commit -m "Initial commit: Food Delivery Web Application (Java EE, Servlets, JSP, MySQL)"
git branch -M main

git remote remove origin 2>nul
git remote add origin https://github.com/mahinaveen221-boop/food_app_tap.git

echo.
echo Pushing Food App to GitHub...
git push -u origin main

if %errorlevel% equ 0 (
    echo.
    echo ========================================================
    echo SUCCESS! Food App repository uploaded to:
    echo https://github.com/mahinaveen221-boop/food_app_tap
    echo ========================================================
) else (
    echo.
    echo Error during push! Make sure 'food_app_tap' repo exists on GitHub.
)

echo.
pause
