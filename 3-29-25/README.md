## Networking and IP Addressing Notes

### `10.32.96.0/24`

- `10` indicates a **private network** as defined by [RFC 1918](https://datatracker.ietf.org/doc/html/rfc1918).
- `32` represents your **VPC (Virtual Private Cloud)**.
- `96` identifies the **subnet** within the VPC.
- `/24` is the **CIDR (Classless Inter-Domain Routing)** notation, meaning:
  - The first 24 bits are the **network portion**.
  - The remaining 8 bits (in this case) are used for **host addresses**.

### `0.0.0.0/0`

- This CIDR block means **"from anywhere"**.
- It's often used in firewall rules to allow traffic from **all IP addresses** (e.g., open to the internet).

### `3389`

- This is the default port for **RDP (Remote Desktop Protocol)**.
- Used primarily for **remotely connecting to Windows machines**.

### `8.8.8.8`

- This is **Google's primary public DNS server**.
- Commonly used for **name resolution** when you want a reliable and globally available DNS.
