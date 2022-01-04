call update.bat
git add .
git commit -m "Update config files"
git push origin main
if %errorlevel% neq 0 pause

