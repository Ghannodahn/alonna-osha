---
description: Execute a comprehensive full-stack feature development workflow
argument-hint: <feature-context>
---

# Full-Stack Feature Development

Execute a comprehensive full-stack feature development workflow with staged design, implementation, and approval gates.

## Usage

Provide context including:
- Feature name and purpose
- Key modes/workflows
- UI layout requirements
- Data/API requirements

## Workflow

The workflow proceeds through these stages with user approval gates:

### Phase 1: Planning & Design
1. Create plan of action (`.todd/tasks/<feature>/README.md`)
2. Write PRD (Product Requirements Document)
3. Design high-level technical architecture
4. Design information architecture
5. Design data/server API
6. Design client data tier
7. Design client UX
8. **USER REVIEW/APPROVAL** of complete design

### Phase 2: Backend Implementation
9. Implement database schema
10. Implement server API
11. Create client test page for API (add to Prototype menu)
12. **USER REVIEW/APPROVAL** of DB/Server API

### Phase 3: Client Data Implementation
13. Implement client data tier (hooks, state management)
14. Create client test page for data tier (add to Prototype menu)
15. **USER REVIEW/APPROVAL** of client data tier

### Phase 4: UX Implementation
16. Implement client UX
17. **FINAL REVIEW/APPROVAL**

## Approval Gates

At each approval gate, I will:
- Summarize what was completed
- Highlight key decisions and trade-offs
- Present artifacts for review
- Wait for explicit approval before proceeding

## Notes

- Each phase builds on approved work from previous phases
- Design changes after approval may require revisiting later phases
- Test pages help validate work at each tier
- Final approval includes full integration testing