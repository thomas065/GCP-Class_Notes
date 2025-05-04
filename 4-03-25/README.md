## Networking Best Practices and Notes

- **Subnets and Scope**:
  - A single subnet should generally be **regional**.
  - If you are using **two or more subnets**, they should be set to **global**, unless there's a specific reason not to.

- **RDP Firewall Rule**:
  - The TCP port for RDP access should **always be port 3389**.

- **VPC and RDP Configuration**:
  - Your RDP access and your Virtual Private Cloud (VPC) must **share the same IPv4 network range** to ensure proper connectivity.

- **Startup Script for Linux VM**:
  - The **startup script** enables a **Linux virtual machine** to host a **web server** (e.g., by installing and starting Apache or NGINX).
