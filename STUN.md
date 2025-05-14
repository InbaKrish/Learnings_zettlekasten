**Session Traversal Utilities for [[NAT]]**

Tell me my public IP Address/Port through NAT. Works for Full-cone, Post/Address restricted NAT (not with symmetric NAT).

Runs on post 3478, 5349 for TLS.

---
A **STUN (Session Traversal Utilities for NAT)** server is a tool used in networking—especially in **real-time communication (RTC)** applications like **VoIP, WebRTC, and video conferencing**—to help **clients behind NATs** discover their **public-facing IP address and port**.

---

## 🌐 Why STUN Is Needed

Most devices today are behind **NAT routers**, meaning they use **private IP addresses** not accessible from the public internet. But for peer-to-peer (P2P) applications like Zoom, Google Meet, or WebRTC video calls, both parties need to know:

- Their own **public IP and port**
- The **remote peer’s public IP and port**

A STUN server helps with the **first problem**: "What is my public IP and port?"

---

## 📖 What STUN Does

STUN allows a client behind a NAT to:

1. **Discover its public IP address**
2. **Discover the type of NAT** it's behind (full cone, symmetric, etc.)
3. **Determine which port** the NAT mapped for its connection

STUN is a **lightweight protocol** that operates over UDP (and sometimes TCP), defined in **RFC 5389**.

---

## How STUN Works (Simplified)

1. A client wants to make a peer-to-peer connection (e.g., WebRTC).
2. It sends a request to a **STUN server** over the internet.
3. The STUN server receives the packet and replies with:
    - The **public IP address** and **port number** from which it received the request.
4. The client now knows what **external address/port** it's visible as to the outside world.
