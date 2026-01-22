# SMART IT Decision & Automation Layer - PowerGrid India

> 🚀 Enterprise-Grade AI-Powered IT Support Platform

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Node.js Version](https://img.shields.io/badge/node-%3E%3D18.0.0-brightgreen.svg)](https://nodejs.org/)
[![Docker](https://img.shields.io/badge/docker-%F0%9F%90%B3-blue.svg)](https://www.docker.com/)
[![TypeScript](https://img.shields.io/badge/typescript-%23007ACC.svg?style=flat&logo=typescript)](https://www.typescriptlang.org/)

---

## 📋 Overview

**SMART IT Decision & Automation Layer** is a comprehensive, enterprise-grade IT support platform designed specifically for PowerGrid India's national power transmission network. It unifies ticket ingestion, AI-based classification, intelligent routing, SLA risk prediction, and controlled automation—all while maintaining operational excellence with zero external dependencies for core functionality.

### Key Features

✨ **AI-Powered Intelligence**
- NLP-based ticket classification using Azure AI Language
- Intelligent priority scoring and intent detection
- Real-time SLA breach prediction using ML models
- Pattern recognition for repeating issues

🎯 **Unified Ticket Management**
- Multi-source ingestion (GLPI, Solman, email, web form)
- Real-time queue dashboard with SLA visualization
- Skill-based intelligent routing
- Automated assignment with workload balancing

🤖 **Controlled Automation**
- Rule-based workflow execution
- Self-service wizards for common issues
- Safe escalation with manual override options
- Approval chains for sensitive operations

📚 **Knowledge Learning Loop**
- Dynamic KB article recommendations
- Pattern-based KB suggestions
- User feedback integration
- Trending articles and auto-discovery

🔐 **Enterprise Security**
- JWT + OAuth2 authentication
- Role-based access control (RBAC)
- On-premise friendly deployment
- Audit logging and compliance tracking

📱 **Progressive Web App (PWA)**
- Offline ticket drafting
- Service worker enabled
- Mobile-first responsive design
- Push notifications for alerts

---

## 🏗️ Architecture

```
┌─ Frontend (React 18 + TypeScript)      ┐
│  - Framer Motion animations             │
│  - Redux state management               │
│  - Real-time WebSocket updates          │
└────────────────────────────────────────┘
           ↓ REST API + WebSocket
┌─ Backend (Node.js + Express)           ┐
│  - Microservices architecture           │
│  - Bull job queue for async processing  │
│  - Socket.IO real-time updates          │
└────────────────────────────────────────┘
           ↓
┌─ AI Engine (Azure AI Services)         ┐
│  - Text Analytics for NLP               │
│  - ML for SLA prediction                │
└────────────────────────────────────────┘
           ↓
┌─ Data Layer                            ┐
│  - PostgreSQL (primary)                 │
│  - MongoDB (knowledge base)             │
│  - Redis (caching & sessions)           │
│  - Azure Blob Storage (files)           │
└────────────────────────────────────────┘
```

---

## 🚀 Quick Start

### Prerequisites
- Node.js >= 18.0.0
- Docker & Docker Compose
- Git
- PostgreSQL client (optional)

### 1. Clone Repository
```bash
git clone https://github.com/powergrid/smart-it-decision-layer.git
cd smart-it-decision-layer
```

### 2. Setup Environment
```bash
cp .env.example .env
# Edit .env with your configuration
```

### 3. Start with Docker Compose
```bash
docker-compose up -d
```

### 4. Access Applications
- **Frontend**: http://localhost:3000
- **Backend API**: http://localhost:3001
- **API Docs**: http://localhost:3001/api/docs

### 5. Test Login (Demo)
```
Email: demo@powergrid.gov.in
Password: password123
```

---

## 📦 Tech Stack

### Frontend
- **Framework**: React 18.2.0 with TypeScript 5.3
- **Animations**: Framer Motion 10.16
- **UI Components**: Ant Design 5.11 + Material-UI 5.14
- **State Management**: Redux Toolkit + Redux Persist
- **HTTP Client**: Axios with interceptors
- **Real-time**: Socket.IO Client 4.7
- **Build Tool**: Vite 5.0
- **Testing**: Vitest + React Testing Library
- **PWA**: Workbox for service workers

### Backend
- **Runtime**: Node.js 18 LTS
- **Framework**: Express.js 4.18
- **Language**: TypeScript 5.3
- **Database**: PostgreSQL 15 + MongoDB 7
- **Cache**: Redis 7 + IORedis
- **Job Queue**: Bull 4.11
- **Auth**: JWT + bcryptjs
- **AI**: Azure AI Language + Azure ML
- **API Docs**: OpenAPI 3.0 / Swagger
- **Logging**: Winston + Morgan
- **Testing**: Jest + Supertest

### Infrastructure
- **Containerization**: Docker + Docker Compose
- **Orchestration**: Kubernetes ready (Helm charts available)
- **Cloud**: Azure (App Service, Container Registry, Managed Databases)
- **Monitoring**: Application Insights
- **Secrets**: Azure Key Vault

---

## 📂 Project Structure

```
smart-it-decision-layer/
├── frontend/                        # React SPA
│   ├── src/
│   │   ├── components/             # Reusable React components
│   │   ├── pages/                  # Page components
│   │   ├── services/               # API service clients
│   │   ├── hooks/                  # Custom React hooks
│   │   ├── store/                  # Redux store & slices
│   │   ├── styles/                 # Global styles
│   │   ├── types/                  # TypeScript types
│   │   ├── App.tsx
│   │   └── main.tsx
│   ├── public/                     # Static assets
│   ├── Dockerfile
│   ├── vite.config.ts
│   └── package.json
│
├── backend/                         # Node.js API
│   ├── src/
│   │   ├── routes/                 # API route handlers
│   │   ├── controllers/            # Business logic
│   │   ├── services/               # Service layer
│   │   ├── models/                 # Data models
│   │   ├── middleware/             # Express middleware
│   │   ├── utils/                  # Utility functions
│   │   ├── database/               # DB migrations & seeds
│   │   ├── types/                  # TypeScript types
│   │   └── server.ts               # Entry point
│   ├── tests/                      # Test files
│   ├── Dockerfile
│   ├── tsconfig.json
│   └── package.json
│
├── docs/                            # Documentation
│   ├── PROJECT_PLAN.md             # Detailed project plan
│   ├── API.md                      # API documentation
│   ├── DEPLOYMENT.md               # Deployment guide
│   ├── TESTING.md                  # Testing guide
│   ├── ARCHITECTURE.md             # Architecture details
│   └── TROUBLESHOOTING.md          # Troubleshooting guide
│
├── .devcontainer/                   # Dev container config
├── docker-compose.yml               # Local dev environment
├── .env.example                     # Environment template
├── package.json                     # Monorepo root
└── README.md                        # This file
```

---

## 🔧 Development

### Install Dependencies
```bash
npm install
```

### Run Development Servers
```bash
# Start both frontend and backend
npm run dev

# Or separately
npm run dev:fe
npm run dev:be
```

### Build for Production
```bash
npm run build
```

### Run Tests
```bash
npm run test
npm run test:fe
npm run test:be
npm run test:coverage
```

### Linting & Formatting
```bash
npm run lint
npm run lint:fix
npm run format
```

---

## 📡 API Documentation

### Authentication
```bash
POST /api/auth/login
POST /api/auth/register
POST /api/auth/refresh
GET  /api/auth/me
POST /api/auth/logout
```

### Tickets
```bash
POST   /api/tickets              # Create ticket
GET    /api/tickets              # List tickets (with filters)
GET    /api/tickets/:id          # Get ticket detail
PATCH  /api/tickets/:id          # Update ticket
DELETE /api/tickets/:id          # Delete ticket (admin)
GET    /api/tickets/stats/queue  # Queue statistics
```

### Knowledge Base
```bash
GET /api/kb/articles             # List articles
GET /api/kb/articles/:id         # Get article
GET /api/kb/search               # Search articles
GET /api/kb/trending             # Trending articles
POST /api/kb/articles/:id/feedback  # Mark as helpful
```

### AI Services
```bash
POST /api/ai/classify            # Classify ticket
GET  /api/ai/sla-prediction/:id  # Predict SLA breach
GET  /api/ai/patterns            # Detect patterns
GET  /api/ai/metrics             # Model performance metrics
```

Full API documentation available at: [docs/API.md](docs/API.md)

---

## 🎨 UI/UX Design

### Design System
- **Color Palette**: Deep Blue (#001F3F), Electric Green (#00FF00), Orange (#FFA500)
- **Typography**: Montserrat (headings), Inter (body), Fira Code (code)
- **Animations**: Smooth transitions with Framer Motion
- **Accessibility**: WCAG 2.1 AA compliant

### Key Pages
1. **Dashboard**: Real-time queue view with SLA monitoring
2. **Ticket Submission**: Multi-step form with AI suggestions
3. **Ticket Detail**: Full ticket history and management
4. **Knowledge Base**: Searchable KB with recommendations
5. **Admin Panel**: AI tuning, rules engine, analytics

---

## 🔒 Security

- **Authentication**: JWT with refresh token rotation
- **Authorization**: Role-based access control (Employee, Agent, Admin, Manager)
- **Encryption**: TLS 1.3 for transit, AES-256 for sensitive fields
- **Rate Limiting**: 100 requests/min per user
- **Input Validation**: Zod schemas on all inputs
- **Audit Logging**: All sensitive operations logged
- **CORS**: Configurable origin restrictions
- **Helmet.js**: Security headers included

---

## 📊 Performance

### Core Web Vitals Targets
| Metric | Target |
|--------|--------|
| First Contentful Paint (FCP) | <1.5s |
| Largest Contentful Paint (LCP) | <2.5s |
| Cumulative Layout Shift (CLS) | <0.1 |
| First Input Delay (FID) | <100ms |

### Optimization Strategies
- Code splitting and lazy loading
- Image optimization (WebP format)
- CSS-in-JS with emotion
- Database query optimization
- Redis caching layer
- CDN for static assets

---

## 🚢 Deployment

### Local Development
```bash
docker-compose up -d
```

### Staging (Azure)
```bash
az container create --image powergridacr.azurecr.io/powergrid-backend:latest
```

### Production
```bash
# See docs/DEPLOYMENT.md for complete guide
```

---

## 🧪 Testing

### Unit Tests
```bash
npm run test
npm run test:coverage
```

### E2E Tests
```bash
npm run test:e2e
```

### Coverage Targets
- Statements: >80%
- Branches: >75%
- Functions: >80%
- Lines: >80%

---

## 📚 Documentation

- [Project Plan](docs/PROJECT_PLAN.md) - Detailed execution plan
- [API Documentation](docs/API.md) - Complete API reference
- [Deployment Guide](docs/DEPLOYMENT.md) - Azure & on-premise deployment
- [Testing Guide](docs/TESTING.md) - Testing strategies
- [Architecture](docs/ARCHITECTURE.md) - Technical architecture
- [Troubleshooting](docs/TROUBLESHOOTING.md) - Common issues & solutions

---

## 🤝 Contributing

1. Fork the repository
2. Create feature branch (`git checkout -b feature/amazing-feature`)
3. Commit changes (`git commit -m 'Add amazing feature'`)
4. Push to branch (`git push origin feature/amazing-feature`)
5. Open Pull Request

### Code Standards
- ESLint + Prettier for code style
- TypeScript for type safety
- Jest for testing
- Conventional Commits for messages

---

## 📋 Roadmap

### Phase 1 (Current) ✅
- [x] Project setup & scaffolding
- [x] Frontend foundation
- [x] Backend foundation
- [ ] Core features implementation
- [ ] Testing & QA

### Phase 2 (Planned) 🔄
- [ ] Advanced AI features
- [ ] Analytics & reporting
- [ ] Integration with external systems
- [ ] Mobile app (React Native)

### Phase 3 (Future) 📅
- [ ] Chatbot integration
- [ ] Voice-to-text support
- [ ] Advanced predictive analytics
- [ ] ML model improvement

---

## 🐛 Known Issues

None at this time. Report issues via GitHub Issues.

---

## 📞 Support & Contact

- **Issues**: [GitHub Issues](https://github.com/powergrid/smart-it-decision-layer/issues)
- **Email**: support@powergrid.gov.in
- **Slack**: #smart-it-support channel

---

## 📄 License

This project is licensed under the MIT License - see [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

- PowerGrid India for the use case
- Azure AI services for NLP capabilities
- Open-source community for excellent libraries

---

## 🔄 Version History

| Version | Date | Changes |
|---------|------|---------|
| 1.0.0 | 2026-01-10 | Initial release |

---

**Made with ❤️ by the PowerGrid IT Innovation Team**
