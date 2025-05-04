# Handy Network Planner

## GCP Lab Planner: RDP Access to Public VM & Accessing Private Web App via Tags

---

### 🔗 Useful Links

- [GCP Machine Resource Types](https://cloud.google.com/compute/docs/machine-resource)
- [Google Cloud Regions](https://cloud.google.com/about/locations#europe)
- [Startup Script Template GitHub](https://github.com/Gwenbleidd32/startup-script-template)

---

**Student Name:** Thomas Bell  
**Date:** 2025-04-05

---

## 1. Project Information

- **GCP Project ID:** `class65thomasbell`

---

## 2. Subnet & Network Design

- **VPC Network Name:** `deathstar`
- **Subnet Name:** `naboo`
- **CIDR Range:** `10.32.30.0/24`
- **Subnet Region:** `europe-west1`
- **Public and Private Instances in Same Subnet?**: **Yes**

➡️ Proceed to **Create VM Instance**

---

## 3. Virtual Machines Configuration

### 🖥️ Windows VM (RDP Target)

- **VM Name:** `darthvader`
- **Machine Type:** `n2-standard-4`
- **OS & Storage:** Windows Server
- **Firewall/Network Tag:** `darthvader`

⚙️ Set correct **Network Interface**, then **Create VM**

---

### 🔒 Private Application VM

- **VM Name:** `padme`
- **Machine Type:** `e2-something`
- **Firewall Tag:** `padme`

➡️ Go to **Networking tab** and create tag

---

## 4. Firewall Rules Planning

### 🚪 Allow RDP to Windows VM

- **Name:** `force-choke`
- **Direction:** INGRESS
- **Source IP Range:** `0.0.0.0/0`
- **Protocols/Ports:** `tcp/3389`
- **Target Tags:** `darthvader`

---

### 🌐 Allow HTTP Access to Private VM from Bastion

- **Name:** `internal-ingress`
- **Direction:** INGRESS
- **Source Tags:** `darthvader`
- **Protocols/Ports:** `tcp/80`
- **Target Tags:** `padme`

---

## 5. ✅ Expected Behavior Checklist

- [ ] Can RDP into public instance from local machine?  
- [ ] Can access private instance’s web app via HTTP from bastion?  
- [ ] Private instance is **NOT** accessible directly from the internet?

---

## 6. 📝 Notes & Observations

- 
- 
- 

➡️ After completing Step 1, proceed to **Create VM Instance**.
