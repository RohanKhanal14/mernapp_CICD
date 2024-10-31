# Wanderlust Mega Project End to End Implementation

### In this demo, we will see how to deploy an end to end three tier MERN stack application on EKS cluster.
#
### <mark>Project Deployment Flow:</mark>
![Screenshot from 2024-10-31 21-01-26](https://github.com/user-attachments/assets/2d23e595-190a-4fa8-b699-9c496d646700)

#

## Tech stack used in this project:
- GitHub (Code)
- Docker (Containerization)
- Jenkins (CI)
- OWASP (Dependency check)
- SonarQube (Quality)
- Trivy (Filesystem Scan)
- ArgoCD (CD)
- Redis (Caching)
- AWS EKS (Kubernetes)
- Helm (Monitoring using grafana and prometheus)

#
## Pipeline Workflow	

1. Code Push & Pull: Developers push code to GitHub, and Jenkins pulls it to initiate CI/CD.
2. Dependency and Quality Analysis: Jenkins CI job runs OWASP Dependency Check for security and SonarQube for code quality analysis.
3. Vulnerability Scan: Trivy performs a filesystem scan on Docker images to check for vulnerabilities.
4. Docker Build and Push: Docker builds the application image and pushes it to the Docker registry.
5. Image Version Update: Jenkins CD job updates the Docker image version in GitHub.
6. Deployment to Kubernetes: Argo CD pulls the latest code and deploys the Docker image to the Kubernetes cluster.
7. Monitoring: Prometheus and Grafana monitor application performance and system metrics.
8. Notification: Email notifications are sent for deployment updates.
