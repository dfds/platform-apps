# Release process

## Process Steps

- Test on main branch (or feature branch) in your sandbox.
- Raise a Pull Request to main branch if you had a feature branch.
- Create a tag and release from main branch using semantic versioning, like v1.2.3
- Test release in QA.
- If successful in QA, deploy to staging.
- If successful in staging, deploy to prod.
- If successful in prod, deploy to standby.
- If any step is unsuccessful, repeat the process.

## Process Flow

```mermaid
flowchart TD
    A[Test on main/feature branch in sandbox] --> B{Feature branch?}
    B -->|Yes| C[Raise PR to main branch]
    B -->|No| D[Create tag and release using semantic versioning]
    C --> D
    D --> E[Test release in QA]
    E --> F{Successful?}
    F -->|Yes| G[Deploy to staging]
    F -->|No| Z[Repeat process]
    G --> H{Successful?}
    H -->|Yes| I[Deploy to prod]
    H -->|No| Z
    I --> J{Successful?}
    J -->|Yes| K[Deploy to standby]
    J -->|No| Z
    K --> L{Successful?}
    L -->|Yes| M[Done]
    L -->|No| Z
    Z --> A
```

## Process Timeline

```mermaid
timeline
    title Release Process Timeline
    section Development
        Test in sandbox : Test on main/feature branch
        Code review : Raise PR to main (if feature branch)
    section Release
        Tag & Release : Create tag with semantic versioning (v1.2.3)
    section QA Environment
        QA Testing : Test release in QA
        QA Validation : Verify functionality
    section Staging Environment
        Staging Deploy : Deploy to staging
        Staging Validation : Verify functionality
    section Production Environment
        Prod Deploy : Deploy to prod
        Prod Validation : Verify functionality
    section Standby Environment
        Standby Deploy : Deploy to standby
        Standby Validation : Final verification
```
