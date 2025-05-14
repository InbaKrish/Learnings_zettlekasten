**Traversal Using Relays around [[NAT]]

![[Pasted image 20250514152004.png]]

## Why TURN Is Needed

- STUN helps clients behind NATs discover their **public IP and port**.
- But with **Symmetric NATs** or **firewalls**, even knowing public IPs isn't enough—**P2P connections get blocked**.
- **TURN is a fallback**: Instead of sending media directly between peers, it is **relayed through the TURN server**.

> In simple terms: **TURN is a relay** that helps two users talk **when direct connection is not possible**.

---

## What TURN Does

- Allocates a **relay address (IP + port)** on the TURN server.
- Peers **send data to the TURN server**, and it **relays it to the other peer**.
- Works over **UDP, TCP, and TLS** (even port 443 to traverse firewalls).

