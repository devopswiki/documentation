## Table of contents

- [Table of contents](#table-of-contents)
- [Questions](#questions)
- [CV](#cv)

## Questions

1. Tell me a time when you take initiatives to improve existing situation
I'm going to talk about a decision I made a few months ago. We migrate the CI/CD pipeline of our Debian modules from Jenkins to GitLab. 
There are more than 200 modules.  
Gitlab is used for code management, test automation and documentation. So, it is starting to be a critical service in our company. 
Before starting, I suggest my manager to set up tools for the monitoring of GitLab. I proposed the implementation of Graphana and Promotheuse. 
At the beginning, it was difficult to convince him because we didn't have time to implement these tools. 
But in the end he accepted, because I explained to him the advantages of these tools.
 
2. Tell me an occasion when you make a decision by taking into account opinions from others
One day, I no longer have disk space on the company's server to deploy a few services. I made a request to IT to expand the server memory. but they said it will take time to do it and it will be expensive.
So, I had a meeting with the managers and I explained to them the current problem and the possible solutions. I proposed using the clouds to deploy these services. My boss told me that there is a powerful PC that is not being used. So, I took this PC and I did the deployment.
 
3. Tell me a time when you made a mistake
For about 3 years, there was no CI/CD in our process. All test was done manually. I remember, I made a small correction in the software "change a path of the URL". We don't have enough time to qualify this RELEASE. We have to deliver this RELEASE as soon as possible. So I didn't do many tests. I tested only this modification, I said it is a minor correction, so nothing risky.
I sent the RELEASE to the client. But the next day, my boss comes to me with the director of the company. He told me that yesterday's version is obsolete and the client can't update with this version.
The situation is very complicated.  We spent a lot of time to reproduce the bug, to make the correction and finally to make another delivery.
So, I said that we have to change our way of working. I did some research and decided to implement the CI/CD environment. I proposed the idea to my boss who agreed in the end.  Since then we have no more problems like that.
 
4. What’s the technology that you’re best at?
I’m best at CI/CD that has become an essential part of the software development process.
5. What’s your last good surprise by a piece of technology?
I heard that VsCode is very usful, but i don’t have any reference about it. I’m surprise how it could be so usful.


## CV

I started in 2017 as a system and software developer. I gained extensive experience in developing Linux shell scripts and C programming. During this time, I also acquired knowledge in Linux systems and computer networks. This assignment lasted almost a year.

Later, I noticed that we were facing numerous issues with delivery and deployment, such as delayed deliveries and regressions. That's when I decided to shift towards DevOps by setting up CI/CD pipelines from scratch to automate our development and deployment processes.

I began by containerizing the development, testing, and production environments using Docker. I worked closely with the development team to integrate unit and integration tests. I also implemented SonarQube for static code analysis. All of this was integrated into GitLab CI and Jenkins.

The results were very satisfying, and the clients became more content. 
Deployments were done on Azure Cloud, where I used Terraform for infrastructure management and Ansible for configuration.

I spent six years with Actia. Afterward, I decided to move on to a new company, PST. I made this decision because I felt it was important for my career to change companies and environments for new challenges.

At Pellenc, I take on the role of a DevOps engineer. I was the only DevOps in a team of 30 people (developers, testers, and R&D engineers). 
I coordinate with all the teams, gather DevOps requirements, and prepar the roadmap and Gantt charts.

I also created CI/CD pipelines for more than 200 Debian modules. 
Integrated Kubernetes with CI/CD pipelines for automated deployments using GitLab CI and Jenkins.

Deployments were done both on-premise on virtual machines, as well as on Azure Cloud, and partially on GCP.

I Built and manage a Kubernetes-based container orchestration system for automated deployment, scaling, and operations across cloud environments. 
Designed and implemented a container orchestration system from scratch using Kubernetes to manage and automate the deployment, scaling, and operation of application containers.
Integrated Kubernetes with CI/CD pipelines for automated deployments using GitLab CI and Jenkins.
Implemented monitoring and alerting system using Prometheus and Grafana.

Currently, I am quite settled in this role. However, I moved to Switzerland because it is a wonderful country, and I want to learn and grow by interacting with different cultures and experiences.


DevOps Engineer, Pellenc ST
- Setting up tools and infrastructure for CI/CD, implementing pipelines to automate the build, test, and deployment processes (Azure, GitHub Actions, GitLab CI, Terraform).
- Building container orchestration system With Kubernetes
- Administration/maintenance of self-managed GitLab and Azure.
- Established infrastructure and service monitoring using Prometheus and Grafana
- Implementing DevSecOps practices, integrating security measures throughout the software development lifecycle.

DevOps & Software Engineer, ACTIA Group
- Collaborated with development teams to automate testing processes and integrate automated tests into CI/CD pipelines (Jenkins, GitLab CI).
- Management of existing infrastructure (Terraform, Docker, Azure)
- Administration/Maintenance of GitLab systems.
- Administration bug-tracking systems like JIRA.
- Linux systems administration
- Implemented and optimized branching strategies which make an efficient DevOps process.
- Estimating the workload and preparing the schedule.
- Writing technical specification and design documents.
- Developing Angular/NodeJS web applications for clients.
- Designing and developing web applications and REST APIs for client.
- Developing different types of tests.

More than 3 million businesses and individuals worldwide use Alohi products to securely sign, fax, and scan their documents. 
Key Products:
1. **Sign.Plus**  : A comprehensive e-signature tool that enables you to securely sign legally binding documents. 
2. **Fax.Plus**  : A secure fax solution that can be effortlessly accessed from any platform.
3. **Scan.Plus** :  This AI-powered document management tool simplifies the process of scanning and securely storing documents. 