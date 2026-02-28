**Domains:** K8S

**Target:** Workloads operating in Hellman

**Rationale/value:** Linux capabilities grant fine-grained elevated permissions that can be abused to compromise the host or cluster. Dropping all capabilities minimises the attack surface.

**Requirement details:**

- Scope: All workloads in Hellman must drop all Linux capabilities. `spec.containers[*].securityContext.capabilities.drop` must include `ALL` for every container, initContainer, and ephemeralContainer. If a container needs to bind to a privileged port (<1024), only `NET_BIND_SERVICE` may be added back.
- Estimated effort: **XS-S**
5-15mins per workload
- How-to: [https://wiki.dfds.cloud/en/playbooks/kyverno#restrict-capabilities](https://wiki.dfds.cloud/en/playbooks/kyverno#restrict-capabilities)

**Announcement date:** N/A
**Date of control:** N/A
**Method of control:** In-console warning + compliance score
**Contact/Question:** Cloud Engineering, [Slack channel: #dev-peer-support]( https://dfds.slack.com/archives/C9948TVRC)
