# Basic GCP App: Load Balancing

This project demonstrates how to deploy a scalable web application on Google Cloud Platform using load balancing, instance groups, and Cloud NAT.

## Overview

One of the key benefits of cloud infrastructure is **scalability**. In GCP, **Instance Groups** are used to implement horizontal scaling, while a **Load Balancer** distributes incoming traffic across these instances.

---

## Step-by-Step Setup

### 1. VPC Network Setup
- Create a VPC network with **2 subnets**.

### 2. Instance Template
- Go to **Compute Engine** > **Instance Templates** and create a new template.
- Select the same **region** used for your VPC and choose an **E2 machine type**.
- Enable **Allow HTTP traffic**.
- Under **Advanced Options**, perform the following:
  - Add a **network tag**.
  - Choose one of your subnets under **default**.
  - Set **External IPv4 address** to **None** (external IPs will be assigned to the Load Balancer, not the individual instances).

### 3. Configure Cloud NAT
- In a new tab, search for and open **Cloud NAT**.
- Set the **Network** to your previously created VPC.
- Choose **NAT type** as **Public**.
- Create a **Cloud Router**:
  - Use default values except for **BGP Keepalive Interval**, which should be set to **60 seconds**.
- Click **Create** to finish the NAT setup.

### 4. Finalize Instance Template
- Return to the **Instance Template** tab.
- Under **Management > Automation**, paste your **startup script**.
    - [Sample Startup Script](https://github.com/thomas065/GCP-startup-script-template/blob/main/new-class-template.sh)
- Click **Create**.

### 5. Create Instance Group
- Navigate to **Instance Groups** and create a new one:
  - Choose your template and ensure the correct subnet is auto-selected.
  - Select **Multiple Zones** (required for load balancing).
  - Set up **Autoscaling** to optimize for availability.
  - Attach a **Health Check** (Regional) and set **Initial Delay** to **60 seconds**.
- Click **Create** and wait for the instances to spin up.

## 6. Set Up Load Balancer

- Open the **Load Balancers** page and click **Create Load Balancer**.
- Choose the following options:
  - **Application Load Balancer**
  - **Public Facing**
  - **Regional**
- Click **Configure Load Balancer** and continue with:

### Frontend Configuration
- Provide a **Name** and select the same **Region** as your instance group.
- Click **Reserve Subnet** and:
  - Choose the correct **Region**
  - Select the appropriate subnet (e.g., `10.32.70.0/24`)
- Click **Add**
- Under **Frontend IP and Port**, give it a name and leave the rest as default.

### Backend Configuration
- Create a **Backend Service**:
  - Select your previously created **Instance Group**
  - Use **Port 80**
  - Attach your **Health Check**
  - Enable **Logging**
- Click **Create**.

Once completed, click **Create & Pray** (a little humor never hurts 😄).

### Firewall Rule
- Create a **Firewall Rule** to allow inbound HTTP traffic on **TCP port 80**.

### Test the Load Balancer
- Go to your newly created **Load Balancer**, copy the external IP address.
- Paste it into your browser:  
  `http://[YOUR-LOAD-BALANCER-IP]`  
  You should see your application (e.g., a simple web page hosted from your startup script).

---

## Tearing Down Resources

Once you're done testing or demonstrating, follow these steps to clean up your resources:

1. Delete **Load Balancers**  
   (_Do not check any auto-selected resources during this step._)
2. Delete the associated **Backend Services**
3. Delete the **Instance Groups**
4. Delete the **Health Checks**
5. Delete **Cloud NAT**
6. Delete the associated **Cloud Router**
7. Delete the **VPC Network**
8. Delete the **Instance Template**

Cleaning up ensures you don't incur unnecessary charges.

---
