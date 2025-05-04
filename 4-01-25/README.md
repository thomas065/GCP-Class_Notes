## Understanding CIDR Notation and Host Addressing

When using an address like `10.32.250.2/32`, you're referencing **a single host**.

- The **`/32`** CIDR suffix signifies **only one address**.
- It's automatically assumed when a single IP address is written without an explicit subnet range.

### CIDR Address Ranges and Number of Hosts

| CIDR | Number of Addresses |
|------|---------------------|
| /32  | 1 address           |
| /31  | 2 addresses         |
| /30  | 4 addresses         |
| /29  | 8 addresses         |
| /28  | 16 addresses        |
| ...  | ...                 |

> So, `/32` is commonly used when you are targeting **just one host** (such as in a firewall rule or SSH connection).

---

### Windows vs Linux VM Access

- If you're **not using Windows**, there's **no need to use RDP**.
- Use **SSH** instead for secure command-line access.

> **Note**: To SSH from your machine, the firewall must allow inbound access from the internet.
> - Set the source range to: `0.0.0.0/0` (from anywhere)

---

## Common Network Ports and Their Uses

| Port  | Protocol | Description                                                              |
|-------|----------|--------------------------------------------------------------------------|
| 20/21 | FTP      | File Transfer Protocol (control and data)                                |
| 22    | SSH      | Secure Shell, secure remote login and file transfer                      |
| 23    | Telnet   | Unsecure remote login (**not recommended**)                              |
| 25    | SMTP     | Simple Mail Transfer Protocol, used for email routing                    |
| 53    | DNS      | Domain Name System, resolves domain names to IP addresses                |
| 80    | HTTP     | Hypertext Transfer Protocol, standard (insecure) web traffic             |
| 110   | POP3     | Post Office Protocol v3, retrieves email (**unencrypted**)               |
| 143   | IMAP     | Internet Message Access Protocol, accesses email (**unencrypted**)       |
| 443   | HTTPS    | Secure HTTP traffic (encrypted web connections)                          |
| 3389  | RDP      | Remote Desktop Protocol, for Windows remote desktop access               |
