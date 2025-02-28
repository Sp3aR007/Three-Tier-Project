# Overview

This is a URL Shortener application which follows Three-tier architecture and is developed using React and Vite as a Frontend, Springboot as a backend and relational database with Postgres.


# Project Structure

project-root/
|-- README.md                 # Readme file
|-- ansible_configs           # Ansible configurations
|-- deploy                    # Kubernetes configurations
|-- docker-compose.yaml       # Docker compose file
|-- images                    # Images of deployment
|-- terraform_configs         # Terraform conigurations
|-- url-shortener-react       # Frontend application code
`-- url-shortener-sb          # Backend server code

# Frontend

The url-shortener-react/ directory contains all the client side code:

url-shortener-react/
|-- Dockerfile                # Docker file for frontend
|-- README.md                 # README file for frontend
|-- eslint.config.js
|-- index.html
|-- nginx.conf                # Nginx configuration
|-- package-lock.json
|-- package.json              # Application dependencies
|-- postcss.config.js
|-- public                    # Static files
|   |-- _redirects
|   |-- images
|   `-- vite.svg
|-- src                       # Source code
|   |-- App.css
|   |-- App.jsx
|   |-- AppRouter.jsx
|   |-- PrivateRoute.jsx
|   |-- api/
|   |-- assets/
|   |-- components/
|   |-- contextApi/
|   |-- dummyData/
|   |-- hooks/
|   |-- index.css
|   |-- main.jsx
|   `-- utils/
|-- tailwind.config.js
`-- vite.config.js

Link to the [# README](./url-shortener-react/README.md) file.
# Backend

The url-shortener-sb/ directory contains all the server side code:

url-shortener-sb/ 
|-- Dockerfile                # Docker file for backend
|-- Jenkinsfile               # Jenkins pipeline for backend
|-- mvnw                      # Maven wrapper 
|-- mvnw.cmd
|-- pom.xml
`-- src                       # Appplication source code
    |-- main
    `-- test

# Terraform

The terraform_configs/ directory contains all the code for terraform configuration:

terraform_configs/            
|-- README.md                 # README file for terraform configuration
|-- alb.tf
|-- gateway.tf
|-- instances.tf
|-- main.tf
|-- nat_gw.tf
|-- outputs.tf
|-- private_rt.tf
|-- public_rt.tf
|-- rds.tf
|-- security_groups.tf
|-- subnets.tf
|-- target_grp.tf
|-- tg_attachment.tf
`-- vpc.tf

# Ansible

The ansible_configs/ directory contains all the code for ansible configuration:

ansible_configs/
|-- README.md                 # README file for ansible configuration
|-- backend-playbook.yaml
|-- frontend-playbook.yaml
`-- inventory.ini

# Kubernetes

The deploy/ directory contains all the code for Kubernetes configuration:

deploy/
|-- README.md                 # README file for Kubernetes configuration
|-- app-route.yaml
|-- argo-route.yaml
|-- backend-service.yaml
|-- cluster_issuer.yaml
|-- deploy-backend.yaml
|-- frontend-deploy.yaml
|-- frontend-service.yaml
|-- gateway.yaml
|-- postgres-cluster.yaml
|-- referencegrant.yaml
|-- secret.yaml
`-- tmpl
    `-- deploy.j2

# Github Actions

The .github/ directory contains all the code for Github Actions workflows:

.github/
`-- workflows
    `-- build-deploy.yaml

## Running locally with Docker Compose
```
docker-compose up -d
```

