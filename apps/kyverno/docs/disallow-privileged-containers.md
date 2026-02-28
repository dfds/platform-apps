**Domains:** K8S

**Target:** Workloads operating in Hellman

**Rationale/value:** Privileged containers disable most Kubernetes security mechanisms and grant near-root access to the host, posing a significant security risk.

**Requirement details:**

- Scope: All workloads in Hellman must not run containers in privileged mode. The fields `spec.containers[*].securityContext.privileged`, `spec.initContainers[*].securityContext.privileged`, and `spec.ephemeralContainers[*].securityContext.privileged` must be set to `false` or be undefined.
- Estimated effort: **XS**
~5mins per workload
- How-to: [https://wiki.dfds.cloud/en/playbooks/kyverno#disallow-privileged-containers](https://wiki.dfds.cloud/en/playbooks/kyverno#disallow-privileged-containers)

**Announcement date:** N/A
**Date of control:** N/A
**Method of control:** In-console warning + compliance score
**Contact/Question:** Cloud Engineering, [Slack channel: #dev-peer-support]( https://dfds.slack.com/archives/C9948TVRC)
