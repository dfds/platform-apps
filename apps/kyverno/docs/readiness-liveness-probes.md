**Domains:** AWS & K8S

**Target:** AWS workloads that operate in Hellman

**Rationale/value:** Improve robustness of workloads and help streamline disaster recovery processes for workloads

Requirement details: 

- Scope: 
		- All workloads in Hellman cluster should implement liveness & readiness probes 
		- AND MAKE SURE that the workloads function as intended after implementation, and they behave correctly during new deployments and maintenance **(definition of “functioning”)**. 
- Estimated effort: **XS-S**
15min -3h per workloads
- 
- How-to: [https://wiki.dfds.cloud/en/documentation/kubernetes/probes](https://wiki.dfds.cloud/en/documentation/kubernetes/probes) 

**Announcement date:** 26th Feb 2026
**Date of control:** 1st March 2026
**Method of control:** In-console warning + compliance score
**Contact/Question:** Cloud Engineering, [Slack channel: #dev-peer-support]( https://dfds.slack.com/archives/C9948TVRC)
