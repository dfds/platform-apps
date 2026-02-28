**Domains:** K8S

**Target:** Workloads operating in Hellman

**Rationale/value:** Improve cluster stability and ensure fair resource allocation by preventing resource exhaustion and CPU throttling.

**Requirement details:**

- Scope: All workloads in Hellman must define container resource requests and limits as follows:
    - CPU requests must be set — CPU limits must NOT be set (to avoid throttling)
    - Memory requests and limits must both be set AND be equal to each other
- Estimated effort: **S**
15-30mins per workload
- How-to: [https://wiki.dfds.cloud/en/playbooks/kyverno#require-resource-limits-and-requests](https://wiki.dfds.cloud/en/playbooks/kyverno#require-resource-limits-and-requests)

**Announcement date:** N/A
**Date of control:** N/A
**Method of control:** In-console warning + compliance score
**Contact/Question:** Cloud Engineering, [Slack channel: #dev-peer-support]( https://dfds.slack.com/archives/C9948TVRC)
