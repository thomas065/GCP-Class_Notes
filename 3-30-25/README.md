# Multi-Region VM and Network Configuration

This exercise involves setting up virtual machines in **three branches**:
- **Iowa**
- **Sao Paulo**
- **Tokyo**

The goal is to:
- Connect from **Iowa → Sao Paulo → Tokyo**
- Access the **homepage from Sao Paulo**
- Use **ICMP ping from Sao Paulo to Tokyo** to verify connectivity

---

## What is RDP?
**RDP (Remote Desktop Protocol)** allows users to:
- Connect to a remote computer
- Interact with its desktop and applications
- Work as if they were physically at the machine

---

## Steps Overview

### 1. Create VM Instances
- After creating the **VMC**, create **VM instances** for each region.
- Choose a machine type like `E2`, `N1`, or `N2` if using Windows.
- Change the image/config to a **Windows Server** if needed.

### 2. Set Up Networking
- In the **Networking** section of the VM config:
  - Change the **default network** to use your **custom NIC name**.
  - ⚠️ **Never use the `default` network** (for security and best practices).

### 3. Set Up VMs by Region
- **Sao Paulo**:
  - Create the instance as described.
  - This VM will access the homepage.

- **Tokyo**:
  - Create the instance with a **Debian** OS.
  - Use the provided script (saved in your favorites) to serve a homepage.
  [Sample Startup Script](https://github.com/thomas065/GCP-startup-script-template/blob/main/new-class-template.sh)

---

## Firewall Rules

- **Iowa**:
  - Create a firewall rule to **allow access from anywhere**.
  - Required to enable RDP from your local machine.

- **Sao Paulo → Tokyo**:
  - Create a firewall rule in **Tokyo** to only allow access from the **Sao Paulo IP range**.

---

## Final Setup

1. **Start RDP session** to Iowa:
   - Set your password and start the session.

2. From **Iowa**, RDP into **Sao Paulo**.

3. From **Sao Paulo**, access the homepage and **ping Tokyo** using ICMP.

---

> ✅ **Tip**: Always use custom networking configurations for better control and security.
> 
> ❌ **Avoid using the `default` network in production.**
