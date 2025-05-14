**Network Address Translation**

**NAT (Network Address Translation)** is a technique used in networking that **translates private IP addresses** used inside a local network to a **single public IP address (or a few)** used on the wider internet. It allows multiple devices on a private network to **share a single public IP address** for accessing external networks, such as the internet.

![[Pasted image 20250514124914.png]]

---

## 🧠 Why NAT Exists

- **IPv4 addresses are limited**: There are only about 4.3 billion IPv4 addresses, and we can't assign one to every device globally.
- NAT allows multiple devices in a home or office network to access the internet using **just one public IP**.
- It adds a **layer of security** by hiding internal IP addresses from the public internet.

---
## How NAT Works (Step-by-Step with Example)

### Scenario:

- You have 3 devices in your home:
    - Laptop: `192.168.1.2`
    - Phone: `192.168.1.3`
    - Tablet: `192.168.1.4`
- Your router’s public IP (from ISP): `203.0.113.10`
- You visit `example.com` from all devices.

### Step-by-Step:

1. **Your laptop (192.168.1.2)** sends a request to `example.com:80`.
2. **Router (NAT device)**:
    - Translates the source IP `192.168.1.2` to `203.0.113.10`, but keeps track of the original source port (e.g., maps `192.168.1.2:10500 → 203.0.113.10:50000`).
    - Sends request to `example.com:80` as if it came from `203.0.113.10:50000`.
3. **Server at example.com** responds to `203.0.113.10:50000`.
4. **Router receives the response**, looks in its NAT table, sees:
    - `203.0.113.10:50000 → 192.168.1.2:10500`
    - Translates the destination back and sends it to your laptop.

