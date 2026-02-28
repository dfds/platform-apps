
**Domains:** AWS

**Target:** Workloads images deployed in Hellman from non-shared ECRs. 
List of all capability accounts in scope: [https://wiki.dfds.cloud/en/playbooks/ecr-pull-kubernetes/list-of-ecr-used-by-kubernetes](https://wiki.dfds.cloud/en/playbooks/ecr-pull-kubernetes/list-of-ecr-used-by-kubernetes)


**Rationale/value:** Improve robustness of workloads and enable streamline disaster-recovery processes for workloads.

**Requirement details:**
- Scope: Workloads images deployed in Hellman from non-shared ECR need to do one of the two following (free choice):
	1. Move container images to DFDS’ shared ECR
	1. Update your ECR repositories’ permission statements to trust the entire DFDS organization

- Estimated effort: **XS-S**
	1. 30mins per active ECR repository + 10mins to update each pipeline to use the shared ECR
	2. 1min per ECR repository
- How-to: [https://wiki.dfds.cloud/en/playbooks/ecr-pull-kubernetes](https://wiki.dfds.cloud/en/playbooks/ecr-pull-kubernetes)

**Announcement date:** 26th Feb 2026
**Date of control:** 1st March 2026
**Method of control:** Compliance score
**Contact/Question:** Cloud Engineering, [Slack channel: #dev-peer-support]( https://dfds.slack.com/archives/C9948TVRC)
