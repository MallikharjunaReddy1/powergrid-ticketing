# Getting Started Guide

## Quick Setup (5 minutes)

### 1. Prerequisites Check
```bash
# Verify Node.js installation
node --version  # Should be >= 18.0.0
npm --version   # Should be >= 9.0.0

# Verify Docker installation
docker --version
docker-compose --version
```

### 2. Clone & Setup
```bash
git clone https://github.com/powergrid/smart-it-decision-layer.git
cd smart-it-decision-layer

# Copy environment template
cp .env.example .env
```

### 3. Start Local Development
```bash
# Using Docker Compose (recommended)
docker-compose up -d

# Access the application
# Frontend: http://localhost:3000
# Backend:  http://localhost:3001
```

### 4. First Login
```
Email: demo@powergrid.gov.in
Password: password123
```

---

## Project Structure Overview

```
smart-it-decision-layer/
├── frontend/              # React + TypeScript SPA
├── backend/               # Node.js + Express API
├── docs/                  # Documentation
├── docker-compose.yml     # Local dev environment
├── .env.example           # Environment variables template
└── README.md              # Main documentation
```

---

## Development Workflow

### Running Without Docker
```bash
# Terminal 1: Frontend
cd frontend
npm install
npm run dev

# Terminal 2: Backend
cd backend
npm install
npm run dev

# Terminal 3: Database (PostgreSQL)
# Use your local PostgreSQL or:
docker run -d --name postgres \
  -e POSTGRES_PASSWORD=password \
  -p 5432:5432 \
  postgres:15-alpine
```

### Development Commands

#### Frontend
```bash
npm run dev          # Start dev server
npm run build        # Build for production
npm run test         # Run tests
npm run lint         # Lint code
npm run type-check   # TypeScript check
```

#### Backend
```bash
npm run dev          # Start dev server with hot reload
npm run build        # Compile TypeScript
npm run start        # Run compiled code
npm run test         # Run tests
npm run lint         # Lint code
npm run migrate      # Run database migrations
```

---

## Key Features Walkthrough

### 1. Ticket Submission
1. Go to http://localhost:3000
2. Login with demo credentials
3. Click "Submit Ticket" button
4. Fill in ticket details:
   - Title: Brief description
   - Description: Detailed explanation
   - Category: Select from dropdown
   - Priority: Choose level
   - Attachments: Upload files (optional)
5. Click "Submit Ticket"

### 2. Dashboard Monitoring
1. Main dashboard shows real-time queue statistics
2. Color-coded SLA risk levels:
   - 🟢 Green: Low risk (0-30%)
   - 🟠 Orange: Medium risk (30-70%)
   - 🔴 Red: High risk (70-100%)
3. Click on any ticket to view details
4. Real-time updates via WebSocket

### 3. Knowledge Base
1. Click "Knowledge Base" in navigation
2. Search for articles or browse by category
3. Rate articles as helpful/unhelpful
4. AI recommends related articles

### 4. Admin Panel (admin role only)
1. Navigate to /admin
2. Configure AI classification rules
3. View AI model performance metrics
4. Manage knowledge base articles

---

## Configuration

### Environment Variables

```bash
# Database
DB_USER=powergrid
DB_PASSWORD=SecurePassword123!
DB_NAME=smart_it_db
DB_HOST=postgres
DB_PORT=5432

# API
API_PORT=3001
API_HOST=0.0.0.0

# Frontend
VITE_API_URL=http://localhost:3001

# JWT
JWT_SECRET=your-super-secret-key-change-in-production
JWT_EXPIRY=24h
REFRESH_TOKEN_EXPIRY=7d

# Azure AI (optional for local development)
AZURE_AI_ENDPOINT=https://your-resource.cognitiveservices.azure.com/
AZURE_AI_KEY=your-key-here
```

---

## Troubleshooting

### Port Already in Use
```bash
# Find and kill process using port 3000/3001
lsof -ti:3000,3001 | xargs kill -9

# Or use different ports
export API_PORT=3002
export FRONTEND_PORT=3001
docker-compose up -d
```

### Database Connection Failed
```bash
# Check PostgreSQL status
docker ps | grep postgres

# Restart PostgreSQL
docker-compose down
docker-compose up -d postgres
```

### Dependencies Not Installing
```bash
# Clear npm cache
npm cache clean --force

# Delete node_modules and reinstall
rm -rf node_modules package-lock.json
npm install
```

### Hot Reload Not Working
```bash
# Increase file watchers limit (Linux)
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf
sudo sysctl -p
```

---

## Testing

### Run All Tests
```bash
npm run test
```

### Run Tests with Coverage
```bash
npm run test:coverage
```

### Watch Mode
```bash
npm run test:watch
```

### Test Specific File
```bash
# Frontend
npm run test -- --run src/components/LoginPage.tsx

# Backend
npm run test -- --testPathPattern=auth
```

---

## Code Style

### Format Code
```bash
npm run format
```

### Lint & Fix
```bash
npm run lint:fix
```

### Type Check
```bash
npm run type-check
```

---

## Git Workflow

### Create Feature Branch
```bash
git checkout -b feature/amazing-feature
```

### Commit Changes
```bash
# Follow conventional commits
git commit -m "feat: add amazing feature"
git commit -m "fix: resolve bug in login"
git commit -m "docs: update API documentation"
```

### Push & Create PR
```bash
git push origin feature/amazing-feature
# Then create pull request on GitHub
```

---

## Performance Tips

### Frontend
- Use React DevTools Profiler to identify slow components
- Check Lighthouse score: http://localhost:3000
- Monitor bundle size with `npm run build`

### Backend
- Monitor API response times in logs
- Check database query performance
- Use Redis for caching frequently accessed data

### Database
- Create indexes on frequently queried columns
- Monitor slow query logs
- Regular backups

---

## Security Checklist

- [ ] Change JWT_SECRET in production
- [ ] Enable HTTPS/TLS
- [ ] Set strong database passwords
- [ ] Configure CORS properly
- [ ] Enable rate limiting
- [ ] Set up audit logging
- [ ] Review firewall rules
- [ ] Regular security updates

---

## Useful Resources

- [React Documentation](https://react.dev)
- [Node.js Documentation](https://nodejs.org/docs/)
- [Express.js Guide](https://expressjs.com/)
- [TypeScript Handbook](https://www.typescriptlang.org/docs/)
- [Docker Documentation](https://docs.docker.com/)
- [Azure Documentation](https://learn.microsoft.com/azure/)

---

## Getting Help

- **Issues**: [GitHub Issues](https://github.com/powergrid/smart-it-decision-layer/issues)
- **Discussions**: [GitHub Discussions](https://github.com/powergrid/smart-it-decision-layer/discussions)
- **Email**: support@powergrid.gov.in
- **Slack**: #smart-it-development channel

---

## Next Steps

1. ✅ Run locally with `docker-compose up -d`
2. 📖 Read [PROJECT_PLAN.md](PROJECT_PLAN.md) for architecture
3. 📡 Check [API.md](API.md) for endpoint documentation
4. 🧪 Run tests with `npm run test`
5. 🚀 Deploy to staging (see [DEPLOYMENT.md](DEPLOYMENT.md))

---

**Happy Coding! 🚀**
