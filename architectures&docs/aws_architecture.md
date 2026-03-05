# AWS Architecture

The infrastructure is deployed inside a dedicated VPC.

Main components:

- VPC with public and private subnets
- Kubernetes cluster using kubeadm
- EC2 instances for control plane and worker nodes
- RDS for persistent data storage
- SQS for asynchronous message processing
- SNS for event notifications
- Lambda for background processing
- Application Load Balancer for external traffic