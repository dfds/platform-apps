# Release process

## Process Steps

- Test on feature branch in your sandbox.
- Raise a Pull Request to main branch
- Test main branch in QA.
- If successful in QA, create a tag and release from main branch using semantic versioning, like v1.2.3
- Minor and patch releases get automatic rollout to staging.
- Patch releases get automatic rollout to prod and standby.
- Major releases are rolled out manually through pull requests.

## Process Flow

```mermaid
flowchart TD
    A[Test on feature branch in sandbox] --> B[Raise PR to main branch]
    B --> C[Test main branch in QA]
    C --> D{QA Successful?}
    D -->|No| E[Fix issues]
    E --> A
    D -->|Yes| F[Create tag and release<br/>with semantic versioning]
    F --> G{Release Type?}
    G -->|Patch| H[Automatic rollout to staging]
    G -->|Minor| H
    G -->|Major| I[Manual rollout via PR]
    H --> J[Staging deployed]
    J --> K{Release Type?}
    K -->|Patch| L[Automatic rollout to prod]
    K -->|Minor| M[Manual decision]
    K -->|Major| I
    L --> N[Prod deployed]
    N --> O[Automatic rollout to standby]
    O --> P[Standby deployed]
    M --> Q{Deploy to prod?}
    Q -->|Yes| L
    Q -->|No| R[Wait]
    I --> S[Create PR for deployment]
    S --> T[Review and merge]
    T --> U[Manual deployment]
```

## Rollback process

- Delete faulty release and tag.
- If it was a major release, then rollback also needs to revert pull requests.
- Flux reconcile will pull in the previous tag.

## Process Timeline

```mermaid
timeline
    title Release Process Timeline
    section Development
        Feature Branch : Test in sandbox
        Pull Request : Raise PR to main branch
    section QA Environment
        Main Branch : Test main branch in QA
        Validation : Verify functionality
    section Release
        Tagging : Create tag with semantic versioning (v1.2.3)
    section Staging Environment
        Auto Deploy : Minor & Patch releases automatically deployed
        Manual Deploy : Major releases via PR
    section Production Environment
        Auto Deploy : Patch releases automatically deployed
        Manual Deploy : Minor & Major releases via PR
    section Standby Environment
        Auto Deploy : Patch releases automatically deployed
        Manual Deploy : Minor & Major releases via PR
```

