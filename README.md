**Three-Tier Terraform Infrastructure Project**
 This project uses Terraform to provision a scalable, secure, and highly available three-tier architecture in the cloud. 
 The architecture is designed to handle web applications that separate concerns into three layers: presentation, application, and data.

**Architecture Overview:**
**Web Tier (Frontend)**: The presentation layer, which is responsible for handling HTTP requests from users. 
                          This tier can be configured with Auto Scaling and Load Balancing to ensure scalability and availability.

**Application Tier (Backend)**: The application layer processes the business logic. It consists of EC2 instances

**Database Tier:** The data layer consists of AWS RDS (Relational Database Service), typically MySQL or PostgreSQL, 
                    providing persistent data storage that is scalable, secure, and highly available.
Key Components:
**VPC (Virtual Private Cloud)**: Creates a virtual network in the cloud, which is divided into public and private subnets. 
                              The public subnets host the frontend resources (e.g., Load Balance and the private subnets 
                              house the backend (e.g., EC2 instances) and database (e.g., RDS).
**Subnets:** Multiple subnets are defined across different Availability Zones to ensure high availability and fault tolerance.

**Security Groups**: Custom security groups are used to control inbound and outbound traffic to different layers. Only authorized resources can communicate with each other.

**Auto Scaling**: EC2 instances in the application layer are set up to scale dynamically based on traffic, ensuring high availability.

**Load Balancer (ALB)**: The Application Load Balancer distributes incoming traffic to the frontend tier (web servers), ensuring even distribution and availability.

**RDS**: A managed relational database (such as MySQL or PostgreSQL) is deployed in private subnets, ensuring that sensitive data is not directly exposed to the internet.
