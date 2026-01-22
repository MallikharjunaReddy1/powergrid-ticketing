#!/bin/bash
# Quick Netlify Deployment Script
# Run this to deploy your Smart IT Decision Layer to Netlify

echo "🚀 Smart IT Decision & Automation Layer - Netlify Deployment"
echo "==========================================================="
echo ""

# Check if Git is initialized
if [ ! -d ".git" ]; then
    echo "❌ Git not initialized. Please run:"
    echo "   cd 'c:\Users\mkred\OneDrive\Desktop\Power Grid\smart-it-decision-layer'"
    echo "   git init"
    echo "   git add ."
    echo "   git commit -m 'Initial commit'"
    echo "   git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git"
    echo "   git branch -M main"
    echo "   git push -u origin main"
    exit 1
fi

# Check if Netlify CLI is installed
if ! command -v netlify &> /dev/null; then
    echo "📦 Installing Netlify CLI..."
    npm install -g netlify-cli
fi

echo "✅ Prerequisites: Git repo and Netlify CLI ready"
echo ""

# Navigate to project root
cd "$(dirname "$0")"

echo "📂 Project root: $(pwd)"
echo ""

# Option selection
echo "Choose deployment method:"
echo "1) GitHub + Netlify (auto-deploy on push) ⭐ RECOMMENDED"
echo "2) Netlify CLI (manual deploy)"
echo ""
read -p "Enter choice (1 or 2): " choice

if [ "$choice" = "1" ]; then
    echo ""
    echo "🔗 GitHub + Netlify Setup"
    echo "========================="
    echo ""
    echo "1. Ensure your code is pushed to GitHub:"
    git status
    echo ""
    echo "2. Go to https://app.netlify.com/start"
    echo "3. Connect your GitHub account"
    echo "4. Select this repository"
    echo "5. Use these build settings:"
    echo "   - Build command: cd frontend && npm run build"
    echo "   - Publish directory: frontend/dist"
    echo "   - Node version: 18"
    echo ""
    echo "6. Click 'Deploy site'"
    echo "7. Once live, add environment variables:"
    echo "   - Go to Site Settings → Environment"
    echo "   - Add VITE_API_URL=https://your-backend.com"
    echo "   - Add VITE_SOCKET_URL=https://your-backend.com"
    echo ""
    echo "✅ Your site will auto-deploy on every push to main!"

elif [ "$choice" = "2" ]; then
    echo ""
    echo "🚀 Netlify CLI Deployment"
    echo "========================="
    echo ""
    
    echo "1️⃣  Authenticating with Netlify..."
    netlify login
    
    echo ""
    echo "2️⃣  Initializing project..."
    netlify init
    
    echo ""
    echo "3️⃣  Building frontend..."
    cd frontend
    npm run build
    cd ..
    
    echo ""
    echo "4️⃣  Deploying to production..."
    netlify deploy --prod --dir=frontend/dist
    
    echo ""
    echo "5️⃣  Setting environment variables..."
    echo ""
    read -p "Enter your backend URL (e.g., https://your-backend.railway.app): " backend_url
    
    netlify env:set VITE_API_URL "$backend_url"
    netlify env:set VITE_SOCKET_URL "$backend_url"
    netlify env:set VITE_ENV "production"
    
    echo ""
    echo "✅ Deployment complete!"
    echo "Your site is live! Check Netlify dashboard for details."

else
    echo "❌ Invalid choice"
    exit 1
fi

echo ""
echo "📚 For detailed instructions, see NETLIFY_DEPLOYMENT_GUIDE.md"
echo "📊 For status and checklist, see NETLIFY_DEPLOYMENT_STATUS.md"
