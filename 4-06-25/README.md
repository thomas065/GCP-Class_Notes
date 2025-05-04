# Handy Network Planner

## GCP Lab: RDP Access to Public VM & Accessing Private Web App via Tags

---

### 🔗 Reference Links

- [Compute Engine API (REST)](https://cloud.google.com/compute/docs/reference/rest/v1)
- [Tags vs. Network Tags](https://cloud.google.com/firewall/docs/tags-firewalls-overview#differences)
- [Cloud NGFW Overview](https://cloud.google.com/firewall/docs/about-firewalls)
- [Add/Remove Network Tags](https://cloud.google.com/vpc/docs/add-remove-network-tags)
- [Firewall Rule Targets: Source, Destination](https://cloud.google.com/firewall/docs/firewalls#sources_or_destinations_for_the_rule)
- [Tags Overview](https://cloud.google.com/resource-manager/docs/tags/tags-overview)
- [GCP Regions & Zones](https://cloud.google.com/compute/docs/gpus/gpu-regions-zones)
- [GCP Machine Types](https://cloud.google.com/compute/docs/machine-resource)
- [GCP Regions List](https://cloud.google.com/about/locations#europe)
- [Startup Script Template on GitHub](https://github.com/Gwenbleidd32/startup-script-template)

---

**Student Name:** Thomas Bell  
**Date:** 2025-04-06

---

## 1. Project Information

- **GCP Project ID:** `class65thomasbell`

---

## 2. Subnet & Network Design

- **VPC Network Name:** `starwars`
- **Subnet Name:** `the-jedi-order-subnet`
- **CIDR Range:** `10.32.30.0/24`
- **Subnet Region:** `southamerica-west1`
- **Public and Private Instances in Same Subnet?**: **Yes**

➡️ Proceed to **Create VM Instance**

---

## 3. Virtual Machines Configuration

### 🖥️ Windows VM (RDP Target)

- **VM Name:** `the-death-star`
- **Machine Type:** `n2-standard-4`
- **OS & Storage:** Windows Server
- **Firewall/Network Tag:** `the-death-star`

⚙️ Use correct **Network Interface**, then **Create VM**

---

### 🔒 Private Application VM

- **VM Name:** `rogue-one`
- **Machine Type:** `e2-something`
- **Firewall Tag:** `padme`
- **Startup Script:** Paste into Advanced tab

➡️ Set network tag in **Networking tab**

---

## 4. Firewall Rules Planning

### 🚪 Allow RDP to Windows VM

- **Rule Name:** `sith-probe`
- **Direction:** INGRESS
- **Source IP Range:** `0.0.0.0/0`
- **Protocols/Ports:** `tcp/3389`
- **Target Tags:** `darthvader`

---

### 🌐 Allow HTTP Access to Private VM from Bastion

- **Rule Name:** `internal-ingress`
- **Direction:** INGRESS
- **Source Tags:** `darthvader`
- **Protocols/Ports:** `tcp/80`
- **Target Tags:** `padme`

---

## 5. ✅ Expected Behavior Checklist

- [ ] Can RDP into public instance from local machine?  
- [ ] Can access private instance’s web app via HTTP from bastion?  
- [ ] Private instance is **NOT** accessible directly from internet?

---
