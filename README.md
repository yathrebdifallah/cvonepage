# DevOps Lab - CV One Page CI/CD

## Contenu du projet

- Dockerfile : pour créer l’image Docker du CV
- Jenkinsfile : pipeline CI/CD pour GitHub → Docker Hub → Slack
- inventory.ini : inventaire Ansible pour DEVOPS-LAB
- roles/ : rôles Ansible pour mise à jour, Docker, Terraform, Jenkins
- site.yml : playbook Ansible principal
