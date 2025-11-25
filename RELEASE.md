# Release process

## Process Details

- This repo has just one branch, which is the main branch.
- Changes to the main branch comes from pull requests.
- Feature branches and hotfix branches are tested in sandbox.
- Every merge to main branch trigger a workflow that creates a pre-release tag and a GitHub pre-release.
- Pre-release tags follow the naming standard v<semantic-version>-alpha.
- Pre-releases are tested in QA.
- It QA testing is successful, then create a stable release tag and a release version from the pre-release.
- Stable releases follow the naming standard v<semantic-version>.
- Update staging to use the latest stable release.
- If staging is successful, then update prod to use the latest stable release.

## Process Flow

```mermaid
flowchart TD
    A[Feature/Hotfix Branch] --> A1[Test in sandbox]
    A1 -->|Success| B[Create Pull Request]
    A1 -->|Failure| A2[Fix issues]
    A2 --> A1

    B --> C[Merge to main branch]

    C --> D[Trigger workflow]
    D --> E[Create pre-release tag:<br/>v&lt;semantic-version&gt;-alpha]
    E --> F[GitHub pre-release]

    F --> G[Test in QA environment]
    G -->|Success| H[Create stable release tag:<br/>v&lt;semantic-version&gt;]
    G -->|Failure| I[Fix issues]
    I --> J[Create new feature/hotfix branch]
    J --> A

    H --> K[Create stable GitHub release]
    K --> L[Update staging environment]

    L --> M{Staging<br/>successful?}
    M -->|Success| N[Update production environment]
    M -->|Failure| O[Rollback/Fix]
    O --> P[Create hotfix branch]
    P --> A

    %% Branch and environment styling
    classDef branchBox fill:#e1f5fe,stroke:#01579b,stroke-width:2px
    classDef processBox fill:#f3e5f5,stroke:#4a148c,stroke-width:2px
    classDef testBox fill:#fff3e0,stroke:#e65100,stroke-width:2px
    classDef deployBox fill:#e8f5e8,stroke:#2e7d32,stroke-width:2px
    classDef releaseBox fill:#fce4ec,stroke:#880e4f,stroke-width:2px

    class A,B,C,J,P branchBox
    class D,E,F,H,K processBox
    class A1,G,L,M testBox
    class N deployBox
    class H,K releaseBox
```

## Release Timeline

```mermaid
timeline
    title Release Process Timeline

    section Development
        Feature Branch    : Create feature/hotfix branch
                         : Develop & commit changes
                         : Test in sandbox environment
        Pull Request     : Create PR to main
                         : Code review & approval
                         : Merge to main branch

    section Pre-Release
        Automation       : Workflow triggered on merge
                         : Create pre-release tag (v<version>-alpha)
                         : Generate GitHub pre-release
        QA Testing       : Deploy pre-release to QA
                         : User acceptance testing
                         : Validation & sign-off

    section Stable Release
        Release Creation : Create stable tag (v<version>)
                         : Generate GitHub release
                         : Release notes & artifacts

    section Deployment
        Staging          : Deploy stable release
                         : Integration testing
                         : Performance validation
        Production       : Deploy to production
                         : Monitoring & health checks
                         : Rollback if needed
```

