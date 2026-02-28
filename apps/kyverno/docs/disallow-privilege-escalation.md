**Domains:** K8S

**Target:** Workloads operating in Hellman

**Rationale/value:** Prevent containers from gaining more privileges than their parent process, reducing the risk of exploitation through mechanisms like setuid/setgid binaries.

**Requirement details:**

- Scope: All workloads in Hellman must explicitly disallow privilege escalation. The fields `spec.containers[*].securityContext.allowPrivilegeEscalation`, `spec.initContainers[*].securityContext.allowPrivilegeEscalation`, and `spec.ephemeralContainers[*].securityContext.allowPrivilegeEscalation` must be set to `false`.
- Estimated effort: **XS**
~5mins per workload
- How-to: [https://wiki.dfds.cloud/en/playbooks/kyverno#disallow-privilege-escalation](https://wiki.dfds.cloud/en/playbooks/kyverno#disallow-privilege-escalation)

**Announcement date:** N/A
**Date of control:** N/A
**Method of control:** In-console warning + compliance score
**Contact/Question:** Cloud Engineering, [Slack channel: #dev-peer-support]( https://dfds.slack.com/archives/C9948TVRC)
