@REM Quick Netlify Deployment Script for Windows
@REM Run this to deploy your Smart IT Decision Layer to Netlify

@echo off
setlocal enabledelayedexpansion

echo.
echo 🚀 Smart IT Decision ^& Automation Layer - Netlify Deployment
echo ============================================================
echo.

REM Check if Netlify CLI is installed
where netlify >nul 2>nul
if %errorlevel% neq 0 (
    echo 📦 Installing Netlify CLI...
    call npm install -g netlify-cli
    if %errorlevel% neq 0 (
        echo ❌ Failed to install Netlify CLI
        exit /b 1
    )
)

echo ✅ Netlify CLI is ready
echo.

REM Get current directory
cd /d "%~dp0"
echo 📂 Project root: %cd%
echo.

REM Option selection
echo Choose deployment method:
echo 1) GitHub ^+ Netlify (auto-deploy on push) ⭐ RECOMMENDED
echo 2) Netlify CLI (manual deploy)
echo 3) View environment variables
echo.
set /p choice="Enter choice (1, 2, or 3): "

if "%choice%"=="1" (
    echo.
    echo 🔗 GitHub ^+ Netlify Setup
    echo ==========================
    echo.
    echo 1. Check Git status:
    call git status
    echo.
    echo 2. Push your code to GitHub:
    echo    git push origin main
    echo.
    echo 3. Go to https://app.netlify.com/start
    echo 4. Connect your GitHub account
    echo 5. Select your repository
    echo 6. Use these build settings:
    echo    - Build command: cd frontend ^&^& npm run build
    echo    - Publish directory: frontend/dist
    echo    - Node version: 18
    echo.
    echo 7. Click 'Deploy site' ^(takes 2-3 minutes^)
    echo.
    echo 8. Once live, add environment variables in Netlify Dashboard:
    echo    - Site Settings ^→ Environment
    echo    - VITE_API_URL=https://your-backend.com
    echo    - VITE_SOCKET_URL=https://your-backend.com
    echo.
    echo ✅ Done! Your site will auto-deploy on every push to main!
    echo.
    pause

) else if "%choice%"=="2" (
    echo.
    echo 🚀 Netlify CLI Deployment
    echo ==========================
    echo.
    
    echo 1️⃣  Authenticating with Netlify...
    call netlify login
    if %errorlevel% neq 0 (
        echo ❌ Authentication failed
        exit /b 1
    )
    
    echo.
    echo 2️⃣  Initializing project...
    call netlify init
    
    echo.
    echo 3️⃣  Building frontend...
    cd frontend
    call npm run build
    if %errorlevel% neq 0 (
        echo ❌ Build failed
        cd ..
        exit /b 1
    )
    cd ..
    
    echo.
    echo 4️⃣  Deploying to production...
    call netlify deploy --prod --dir=frontend\dist
    
    echo.
    echo 5️⃣  Setting environment variables...
    echo.
    set /p backend_url="Enter your backend URL (e.g., https://your-backend.railway.app): "
    
    call netlify env:set VITE_API_URL "%backend_url%"
    call netlify env:set VITE_SOCKET_URL "%backend_url%"
    call netlify env:set VITE_ENV "production"
    
    echo.
    echo ✅ Deployment complete!
    echo Your site is live! Check Netlify dashboard for details.
    echo.
    pause

) else if "%choice%"=="3" (
    echo.
    echo 📋 Environment Variables Template
    echo ==================================
    echo.
    echo Copy these to Netlify Site Settings ^→ Environment:
    echo.
    echo VITE_API_URL=https://your-backend-domain.com
    echo VITE_SOCKET_URL=https://your-backend-domain.com
    echo VITE_ENV=production
    echo VITE_ENABLE_LOGGING=false
    echo VITE_ENABLE_DEVTOOLS=false
    echo VITE_API_TIMEOUT=30000
    echo VITE_RETRY_MAX_ATTEMPTS=3
    echo.
    echo Note: Update 'your-backend-domain.com' with your actual backend URL
    echo.
    pause

) else (
    echo ❌ Invalid choice
    exit /b 1
)

echo.
echo 📚 For detailed instructions, see: NETLIFY_DEPLOYMENT_GUIDE.md
echo 📊 For status and checklist, see: NETLIFY_DEPLOYMENT_STATUS.md
echo.
