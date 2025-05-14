**Interactive Connectivity Establishment** - collects all available candidates (local IP addresses - STUN ones and related addresses - TURN ones), these are called ICE Candidates.

Used to find the best possible way for two devices to establish a connection, even if both are behind **NATs** or **firewalls**.

---
### **ICE Candidates**

ICE collects several types of connection candidates:

| Type                 | Description                                          | Example              |
| -------------------- | ---------------------------------------------------- | -------------------- |
| **Host Candidate**   | Your local IP (LAN) address                          | `192.168.1.10:54321` |
| **Server Reflexive** | Your public IP obtained via a **STUN** server        | `203.0.113.5:62000`  |
| **Relay Candidate**  | Address allocated by a **TURN** server (last resort) | `203.0.113.10:55000` |

---
### **ICE Gathering**

Your device collects these candidates using:

- Your local network interfaces (for host candidates)
- A STUN server (for server-reflexive candidates)
- A TURN server (for relay candidates)

This is called **ICE gathering phase**.

---
### **Connectivity Checks (ICE Checks)**

Once candidates are gathered, both peers:

- Exchange candidates via **signaling** (e.g., WebSocket or SIP)
- Try to connect to each other's candidates (called **ICE connectivity checks**)
- Pick the best working pair (**selected candidate pair**)
---
## ICE Workflow Example (Alice ↔ Bob)

Assume both Alice and Bob are behind NATs.

### Step 1: Candidate Gathering

|Alice|Bob|
|---|---|
|Host: `192.168.0.5:5000`|Host: `192.168.1.6:5000`|
|STUN (Reflexive): `203.0.113.5:62000`|STUN: `198.51.100.3:61000`|
|TURN (Relay): `203.0.113.10:54000`|TURN: `198.51.100.20:55000`|

---

### Step 2: Signaling Exchange

- Alice sends her candidates to Bob.
- Bob sends his candidates to Alice.

Usually via [[SDP]] inside a **signaling server** (e.g., WebSocket).

---

### Step 3: Connectivity Checks

ICE agent tries each combination:

|Alice Candidate|Bob Candidate|Result|
|---|---|---|
|Host ↔ Host|❌ Fails (different LANs)||
|Host ↔ STUN|❌ Fails (blocked NAT)||
|STUN ↔ STUN|❌ Fails (Symmetric NAT)||
|TURN ↔ TURN|✅ Works! Selected candidate pair||

---

### Step 4: Finalization

- ICE picks TURN↔TURN as the **nominated pair**.
- All media/data traffic now flows through the **TURN relay**.