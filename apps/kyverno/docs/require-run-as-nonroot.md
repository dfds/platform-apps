**Domains:** K8S

**Target:** Workloads operating in Hellman

**Rationale/value:** Reduce the blast radius of a container compromise by ensuring processes do not run as root, limiting their ability to affect the host or other workloads.

**Requirement details:**

- Scope: All workloads in Hellman must run as non-root users. Either `spec.securityContext.runAsNonRoot` must be set to `true` at the pod level, or `runAsNonRoot: true` must be set in the securityContext of each container, initContainer, and ephemeralContainer.
    - AND MAKE SURE that your container image supports running as a non-root user (i.e. the application does not require root to function).
- Estimated effort: **XS-S**
5-30mins per workload
- How-to: [https://wiki.dfds.cloud/en/playbooks/kyverno#require-non-root-containers](https://wiki.dfds.cloud/en/playbooks/kyverno#require-non-root-containers)

**Announcement date:** N/A
**Date of control:** N/A
**Method of control:** In-console warning + compliance score
**Contact/Question:** Cloud Engineering, [Slack channel: #dev-peer-support]( https://dfds.slack.com/archives/C9948TVRC)
