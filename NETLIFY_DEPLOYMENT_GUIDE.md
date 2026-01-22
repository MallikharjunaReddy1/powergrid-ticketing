# Netlify Deployment Guide - Smart IT Decision & Automation Layer

## Quick Deployment (5-10 minutes)

### Option 1: Deploy via GitHub (Recommended - Auto-Deploy on Push)

This is the easiest method and enables continuous deployment.

#### Step 1: Connect GitHub Repository
```bash
# Ensure your project is committed to GitHub
git push origin main
```

1. Go to [Netlify](https://app.netlify.com/)
2. Click **"New site from Git"**
3. Select **GitHub** as your provider
4. Authorize Netlify to access your GitHub account
5. Find and select your repository
6. Configure build settings:
   - **Build command**: `cd frontend && npm run build`
   - **Publish directory**: `frontend/dist`
   - **Node version**: 18
7. Click **Deploy site**

Netlify will automatically:
- Build your frontend on every push
- Deploy to production
- Provide a live URL

#### Step 2: Set Environment Variables
1. Go to **Site settings** → **Build & deploy** → **Environment**
2. Add these variables:

```
VITE_API_URL=https://your-backend-url.com
VITE_SOCKET_URL=https://your-backend-url.com
VITE_ENV=production
```

Your site is now **live and auto-deploying** on every git push! 🎉

---

### Option 2: Deploy via Netlify CLI (Manual Control)

For local testing or CI/CD pipelines.

#### Step 1: Install Netlify CLI
```bash
npm install -g netlify-cli
```

#### Step 2: Authenticate with Netlify
```bash
netlify login
```

This opens your browser to authorize the CLI.

#### Step 3: Initialize Your Project
```bash
cd c:\Users\mkred\OneDrive\Desktop\Power Grid\smart-it-decision-layer
netlify init
```

Follow the prompts:
- **Team**: Select your team or create new
- **Site name**: `smart-it-decision-layer` (or your preferred name)
- **Build command**: `cd frontend && npm run build`
- **Publish directory**: `frontend/dist`

#### Step 4: Build and Deploy
```bash
# Deploy to preview (staging)
netlify deploy --dir=frontend/dist

# Deploy to production
netlify deploy --prod --dir=frontend/dist
```

#### Step 5: Set Environment Variables
```bash
netlify env:set VITE_API_URL "https://your-backend-url.com"
netlify env:set VITE_SOCKET_URL "https://your-backend-url.com"
netlify env:set VITE_ENV "production"
```

---

## Backend Deployment (Separate from Netlify)

Netlify is designed for **static sites and JAMstack applications**. Your Node.js backend needs separate hosting.

### Recommended Backend Hosting Options

#### **Option A: Railway.app** ⭐ (Recommended - PostgreSQL included)
1. Sign up at [railway.app](https://railway.app)
2. Create new project → "Deploy from GitHub" or "Deploy from template"
3. Select Node.js template
4. Configure environment variables:
   ```
   NODE_ENV=production
   PORT=3001
   DATABASE_URL=postgresql://...
   JWT_SECRET=your-secret-key
   ```
5. Connect to PostgreSQL database (Railway provides one)
6. Deploy and get your backend URL

#### **Option B: Render.com** ⭐ (Free tier available)
1. Sign up at [render.com](https://render.com)
2. Create "New" → "Web Service"
3. Connect GitHub repository (backend folder)
4. Configure:
   - **Build command**: `npm install && npm run build`
   - **Start command**: `npm start`
   - **Environment**: Node
5. Add environment variables
6. Deploy

#### **Option C: Heroku** (Paid, but simple)
1. Sign up at [heroku.com](https://www.heroku.com)
2. Create new app
3. Connect GitHub or use Heroku CLI
4. Set buildpacks:
   ```bash
   heroku buildpacks:add heroku/nodejs
   heroku buildpacks:add heroku/postgresql
   ```
5. Deploy and configure

#### **Option D: Azure App Service** (Enterprise option)
1. Sign up at [azure.microsoft.com](https://azure.microsoft.com)
2. Create App Service (Node.js runtime)
3. Connect to GitHub for auto-deployment
4. Deploy backend code
5. Configure PostgreSQL Azure Database

---

## Complete Architecture After Deployment

```
┌─────────────────────────────────────────────────────────┐
│                    Your Users                            │
└────────────────────────────┬────────────────────────────┘
                             │ HTTPS
                             ▼
                    ┌────────────────┐
                    │  Netlify CDN   │ ◄─ Frontend (React)
                    │  (Distributed) │    URL: your-site.netlify.app
                    └────────┬───────┘
                             │ HTTPS + CORS
                             ▼
                  ┌────────────────────────┐
                  │   Your Backend Host    │
                  │  (Railway/Render/etc)  │ ◄─ Backend (Node.js + Express)
                  │    Socket.IO Server    │    URL: your-backend.railway.app
                  └────────────┬───────────┘
                               │
                ┌──────────────┬──────────────┐
                ▼              ▼              ▼
            PostgreSQL    MongoDB        Redis
            (Database)    (NoSQL)        (Cache)
```

---

## Environment Variables Reference

### Frontend Variables (set in Netlify Dashboard)
```env
VITE_API_URL=https://your-backend-domain.com      # Backend API endpoint
VITE_SOCKET_URL=https://your-backend-domain.com   # WebSocket endpoint
VITE_ENV=production                                 # Environment mode
VITE_ENABLE_LOGGING=false                          # Disable console logs
VITE_ENABLE_DEVTOOLS=false                         # Disable Redux DevTools
VITE_API_TIMEOUT=30000                             # Request timeout (ms)
VITE_RETRY_MAX_ATTEMPTS=3                          # API retry attempts
```

### Backend Variables (set in your backend host)
```env
NODE_ENV=production
PORT=3001
DATABASE_URL=postgresql://user:pass@host/db
MONGODB_URI=mongodb+srv://...
REDIS_URL=redis://...
JWT_SECRET=your-super-secret-key-change-this
CORS_ORIGIN=https://your-site.netlify.app
SOCKET_IO_ORIGIN=https://your-site.netlify.app
```

---

## Post-Deployment Verification

### 1. Test Frontend Deployment
- Open your Netlify URL (e.g., `https://your-site.netlify.app`)
- Verify page loads without errors
- Check browser console for errors (F12 → Console)

### 2. Test API Connection
After backend deployment:
```bash
# Test API endpoint
curl https://your-backend-domain.com/api/tickets

# Test WebSocket connection
# Should see "Socket connected" in browser console
```

### 3. Monitor Deployment
- **Netlify Dashboard**: View build logs and deployment status
- **Browser DevTools**: Check Network tab and Console for errors
- **Backend Logs**: Monitor your backend host for errors

---

## Continuous Deployment (CD) Setup

With GitHub + Netlify connected:

1. **Development**: Push to `develop` branch → Auto-deploys to preview
2. **Production**: Merge/push to `main` branch → Auto-deploys to production

### Typical Workflow
```bash
# Feature development
git checkout -b feature/my-feature
git commit -m "Add new feature"
git push origin feature/my-feature

# Create Pull Request on GitHub
# → Netlify auto-builds preview (see PR comments)
# → Review and test

# Merge to main
git checkout main
git merge feature/my-feature
git push origin main

# → Netlify auto-builds and deploys to production
```

---

## Troubleshooting

### Build Fails on Netlify
**Problem**: "npm ERR! 404" or "command not found"

**Solution**:
```bash
# Check Node version (should be 18+)
node --version

# Clear cache and redeploy
# Go to Netlify Dashboard → Deployments → Trigger deploy → Clear cache and deploy
```

### API Requests Return 404
**Problem**: Frontend can't reach backend

**Solution**:
1. Verify `VITE_API_URL` is set correctly in Netlify environment variables
2. Check backend is deployed and running
3. Verify CORS is enabled on backend:
   ```javascript
   app.use(cors({
     origin: 'https://your-site.netlify.app',
     credentials: true
   }))
   ```

### WebSocket Connection Failed
**Problem**: "Failed to connect to WebSocket"

**Solution**:
1. Verify Socket.IO is running on backend
2. Check `VITE_SOCKET_URL` matches backend URL
3. Backend must use `wss://` (WebSocket Secure) protocol
4. Ensure backend CORS allows your Netlify origin

### "Mixed Content" Error
**Problem**: "Blocked: The page at X was loaded over HTTPS, but requested an insecure resource at X"

**Solution**: 
- Use `https://` (not `http://`) for all backend URLs
- Check all environment variables use HTTPS

---

## Rollback & Debugging

### Rollback to Previous Deploy
1. Netlify Dashboard → Deployments
2. Find working deployment
3. Click the three dots → "Publish deploy"

### View Build Logs
1. Netlify Dashboard → Deploys
2. Click a deployment
3. Click "Deploy log" to see build output
4. Check for errors or warnings

### Monitor in Production
```javascript
// Your frontend should report errors to a monitoring service
// Consider adding Sentry.io or similar for error tracking
import * as Sentry from "@sentry/react";

Sentry.init({
  dsn: "your-sentry-dsn",
  environment: "production",
});
```

---

## Next Steps

1. ✅ Deploy frontend to Netlify (this guide)
2. 🔄 Deploy backend to Railway/Render/Heroku (separate service)
3. 🔄 Set up databases (PostgreSQL, MongoDB)
4. 🔄 Configure environment variables
5. 🔄 Test API connectivity
6. 🔄 Set up monitoring (optional but recommended)
7. 🔄 Configure custom domain (optional)

---

## Support & Resources

- **Netlify Docs**: https://docs.netlify.com
- **Netlify Status**: https://www.netlifystatus.com
- **Railway Docs**: https://docs.railway.app
- **Render Docs**: https://render.com/docs

---

**Deployment Status**: 🟢 Ready for production
**Last Updated**: January 2026
