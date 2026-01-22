# Contributing Guidelines

## Code of Conduct

This project is committed to providing a welcoming and inclusive environment.

---

## How to Contribute

### 1. Fork & Clone
```bash
git clone https://github.com/[your-username]/smart-it-decision-layer.git
cd smart-it-decision-layer
git remote add upstream https://github.com/powergrid/smart-it-decision-layer.git
```

### 2. Create Feature Branch
```bash
git checkout -b feature/amazing-feature
```

### 3. Make Your Changes
- Follow code style guidelines (see below)
- Add tests for new functionality
- Update documentation
- Commit with conventional messages

### 4. Commit Guidelines
```bash
# Feature
git commit -m "feat: add authentication flow"

# Bug fix
git commit -m "fix: resolve login token expiration"

# Documentation
git commit -m "docs: update API documentation"

# Style
git commit -m "style: format code with prettier"

# Test
git commit -m "test: add unit tests for auth service"

# Chore
git commit -m "chore: update dependencies"
```

### 5. Push & Create Pull Request
```bash
git push origin feature/amazing-feature
```

Then create PR on GitHub with:
- Descriptive title
- Clear description of changes
- Linked issues
- Screenshots (if UI changes)

---

## Code Style Guidelines

### TypeScript
```typescript
// Use interfaces for object shapes
interface User {
  id: string
  email: string
  role: 'employee' | 'agent' | 'admin'
}

// Use const for functions (arrow functions)
const getUserById = async (id: string): Promise<User> => {
  // Implementation
}

// Use enums for constants
enum UserRole {
  Employee = 'employee',
  Agent = 'agent',
  Admin = 'admin',
}
```

### React/TSX
```tsx
// Use functional components
interface Props {
  title: string
  onClick?: () => void
}

const MyComponent: React.FC<Props> = ({ title, onClick }) => {
  return <div onClick={onClick}>{title}</div>
}

export default MyComponent
```

### File Naming
```
Components:     PascalCase.tsx      (LoginForm.tsx)
Services:       camelCase.ts        (ticketService.ts)
Hooks:          camelCase.ts        (useRealtimeUpdates.ts)
Utils:          camelCase.ts        (formatDate.ts)
Types:          PascalCase.ts       (User.ts)
Styles:         camelCase.module.css (LoginForm.module.css)
```

---

## Testing Requirements

### Frontend
- Minimum 80% code coverage
- Unit tests for services and hooks
- Component tests for critical UI elements
- Example:

```typescript
describe('TicketService', () => {
  it('should create ticket with valid data', async () => {
    const ticket = await ticketService.createTicket({
      title: 'Test',
      description: 'Test ticket',
      category: 'software',
    })

    expect(ticket.id).toBeDefined()
    expect(ticket.status).toBe('open')
  })
})
```

### Backend
- Minimum 80% code coverage
- Unit tests for services
- Integration tests for routes
- Example:

```typescript
describe('POST /api/tickets', () => {
  it('should create ticket with valid data', async () => {
    const response = await request(app)
      .post('/api/tickets')
      .set('Authorization', `Bearer ${token}`)
      .send({
        title: 'Test',
        description: 'Test ticket',
        category: 'software',
      })

    expect(response.status).toBe(201)
    expect(response.body.id).toBeDefined()
  })
})
```

---

## PR Review Process

### Before Submitting
- [ ] Code follows style guidelines
- [ ] Tests added/updated
- [ ] Documentation updated
- [ ] No console.log() statements (except logging service)
- [ ] No commented-out code
- [ ] No hard-coded values (use env variables)
- [ ] Type-safe (no `any` types unless necessary)

### Review Checklist
- [ ] Code quality
- [ ] Test coverage
- [ ] Documentation
- [ ] Performance implications
- [ ] Security considerations
- [ ] Backward compatibility

### Common Issues
- ❌ Large PRs (>400 lines) - split into smaller PRs
- ❌ Missing tests
- ❌ Insufficient documentation
- ❌ Breaking changes without discussion
- ❌ Merged without approval

---

## Bug Reports

### Format
```markdown
## Description
Brief description of the bug

## Steps to Reproduce
1. Step 1
2. Step 2
3. Step 3

## Expected Behavior
What should happen

## Actual Behavior
What actually happens

## Screenshots
Include relevant screenshots

## Environment
- OS: [macOS/Windows/Linux]
- Node version: [version]
- npm version: [version]

## Error Log
```
error output here
```
```

---

## Feature Requests

### Format
```markdown
## Description
What feature should be added and why

## Use Case
Real-world example of how this would be used

## Proposed Implementation
Optional: suggest how to implement

## Alternatives
Other approaches considered
```

---

## Documentation

### Add Docs For
- New features
- API endpoints
- Configuration options
- Breaking changes
- Complex algorithms

### Format
```markdown
# Feature Name

## Description
Brief description

## Usage
```typescript
// Example code
```

## Parameters
| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| param1 | string | Yes | Description |

## Returns
Description of return value

## Throws
Possible errors

## Example
Complete example
```

---

## Release Process

### Version Numbers
- Major (1.0.0): Breaking changes
- Minor (0.1.0): New features
- Patch (0.0.1): Bug fixes

### Release Steps
1. Create release branch: `release/v1.0.0`
2. Update version in package.json
3. Update CHANGELOG.md
4. Create PR and get approval
5. Merge to main
6. Create GitHub release
7. Merge back to develop

---

## Performance Checklist

- [ ] No memory leaks
- [ ] No unnecessary re-renders (React)
- [ ] Database queries optimized
- [ ] Bundle size monitored
- [ ] API response time < 200ms
- [ ] Page load time < 2s

---

## Security Checklist

- [ ] No secrets in code
- [ ] Input validation on all endpoints
- [ ] Authentication required for protected routes
- [ ] Authorization checked properly
- [ ] No SQL injection vulnerabilities
- [ ] No XSS vulnerabilities
- [ ] HTTPS enforced in production
- [ ] Audit logging for sensitive operations

---

## Helpful Commands

```bash
# Format code
npm run format

# Lint code
npm run lint
npm run lint:fix

# Type check
npm run type-check

# Run tests
npm run test
npm run test:coverage
npm run test:watch

# Build
npm run build

# View bundle size
npm run build -- --analyze

# Update dependencies
npm update
npm outdated
npm audit fix
```

---

## Communication

- **Slack Channel**: #smart-it-development
- **Weekly Standup**: Monday 10:00 AM IST
- **Email**: dev-team@powergrid.gov.in
- **Discord**: https://discord.gg/powergrid-dev

---

## License

By contributing, you agree that your contributions will be licensed under the MIT License.

---

## Questions?

Ask in:
1. GitHub Discussions
2. #smart-it-development Slack channel
3. Email: dev-team@powergrid.gov.in

---

**Thank you for contributing! 🙏**
