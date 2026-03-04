# 🚀 Flask Docker ECS Deployment

![Python](https://img.shields.io/badge/Python-3.14-blue?style=for-the-badge\&logo=python)
![Flask](https://img.shields.io/badge/Flask-3.1-black?style=for-the-badge\&logo=flask)
![Docker](https://img.shields.io/badge/Docker-Containerized-2496ED?style=for-the-badge\&logo=docker)
![AWS ECS](https://img.shields.io/badge/AWS-ECS-orange?style=for-the-badge\&logo=amazonaws)
![DevOps](https://img.shields.io/badge/DevOps-Learning-success?style=for-the-badge)

---

# 📌 Project Overview

This project demonstrates how to **containerize a Flask application using Docker and deploy it on AWS ECS (Elastic Container Service)**.

The goal of this project is to understand **real-world DevOps practices**, including:

* Docker containerization
* Multi-stage Docker builds
* Distroless container images
* AWS container deployment
* Health checks for load balancers

The application contains a simple **Flask web interface and health check endpoint** designed for ECS deployment.

---

# 🧰 Tech Stack

| Layer                | Technology               |
| -------------------- | ------------------------ |
| Backend              | Flask                    |
| Programming Language | Python 3.14              |
| Containerization     | Docker                   |
| Container Image      | Python Slim / Distroless |
| Cloud Platform       | AWS ECS                  |
| Container Registry   | AWS ECR                  |

---

# 📁 Project Structure

```
flask-docker-ecs-demo
│
├── app.py
├── run.py
├── requirements.txt
│
├── templates
│   └── index.html
│
├── Dockerfile
├── Dockerfile-multi
│
└── README.md
```

---

# 🐳 Docker Implementation

This project contains **two Docker build approaches**.

---

## 1️⃣ Simple Docker Build

Uses a single-stage Docker build with `python:3.14-slim`.

Build image:

```
docker build -t flask-app .
```

Run container:

```
docker run -p 80:80 flask-app
```

---

## 2️⃣ Multi-Stage Distroless Docker Build

A production-style container build.

Stage 1 — Builder

* Uses `python:3.14-slim`
* Installs dependencies

Stage 2 — Runtime

* Uses `distroless python`
* Copies only required files

Benefits:

* Smaller image size
* Better security
* Reduced attack surface
* Production-grade container

Build image:

```
docker build -f Dockerfile-multi -t flask-app .
```

Run container:

```
docker run -p 80:80 flask-app
```

---

# 🌐 Application Endpoints

| Endpoint  | Method | Description           |
| --------- | ------ | --------------------- |
| `/`       | GET    | Landing page          |
| `/health` | GET    | Health check endpoint |

Example response:

```
Server is up and running
```

---

# ☁️ AWS ECS Deployment Workflow

The container can be deployed to AWS ECS using the following process.

---

## Step 1 — Build Docker Image

```
docker build -t flask-app .
```

---

## Step 2 — Push Image to AWS ECR

Login to ECR:

```
aws ecr get-login-password --region <region> | docker login --username AWS --password-stdin <account-id>.dkr.ecr.<region>.amazonaws.com
```

Tag image:

```
docker tag flask-app:latest <account-id>.dkr.ecr.<region>.amazonaws.com/flask-app:latest
```

Push image:

```
docker push <account-id>.dkr.ecr.<region>.amazonaws.com/flask-app:latest
```

---

## Step 3 — Create ECS Task Definition

Configure:

* Container image
* CPU & memory
* Port mapping

---

## Step 4 — Create ECS Service

Attach the service to:

* ECS Cluster
* Application Load Balancer

---

## Step 5 — Configure Health Check

Use the endpoint:

```
/health
```

---

# 🏗️ Architecture Diagram

```
                Internet
                    │
                    ▼
        Application Load Balancer
                    │
                    ▼
              AWS ECS Cluster
                    │
                    ▼
           Docker Container
             (Flask App)
                    │
                    ▼
              Health Endpoint
```

---

# ⚡ DevOps Concepts Practiced

This project demonstrates several **important DevOps concepts**:

* Docker containerization
* Multi-stage Docker builds
* Distroless container images
* Cloud container deployment
* AWS ECR container registry
* AWS ECS orchestration
* Load balancer health checks

---

# 🎯 Learning Outcome

Through this project I gained hands-on experience with:

* Building Docker images
* Optimizing containers using distroless images
* Deploying containerized applications to AWS ECS
* Understanding container orchestration workflow

---

# 👨‍💻 Author

**Alex (Aniruddha Kharve)**
DevOps & Cloud Enthusiast

GitHub:
https://github.com/Aniruddhakharve
