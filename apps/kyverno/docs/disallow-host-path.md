**Domains:** K8S

**Target:** Workloads operating in Hellman

**Rationale/value:** Prevent containers from accessing sensitive host filesystem data or escalating privileges through direct host path access.

**Requirement details:**

- Scope: All workloads in Hellman must not use hostPath volumes. The field `spec.volumes[*].hostPath` must not be set.
- Estimated effort: **XS**
~5mins per workload
- How-to: [https://wiki.dfds.cloud/en/playbooks/kyverno#disallow-hostpath-volumes](https://wiki.dfds.cloud/en/playbooks/kyverno#disallow-hostpath-volumes)

**Announcement date:** N/A
**Date of control:** N/A
**Method of control:** In-console warning + compliance score
**Contact/Question:** Cloud Engineering, [Slack channel: #dev-peer-support]( https://dfds.slack.com/archives/C9948TVRC)
