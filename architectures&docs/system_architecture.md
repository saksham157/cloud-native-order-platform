# System Architecture

This project implements a cloud-native event-driven order processing platform.

The application is composed of multiple microservices deployed on a Kubernetes
cluster running on AWS EC2 instances.

The system follows an event-driven architecture where services communicate
asynchronously using message queues.

Key goals of the system:

- High availability through multi-AZ deployment
- Infrastructure automation using Terraform
- Automated CI/CD pipeline using Jenkins
- Containerized microservices using Docker
- Observability using ELK stack