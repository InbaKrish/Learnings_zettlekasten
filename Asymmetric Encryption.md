---
tags:
  - Cryptography/Encryption
---
Uses two keys for the encryption and decryption. private key (secret) and public key (can be shared)

Using [[RSA]] as an example
![[Pasted image 20240817184146.png]]

**Note: RSA is very inefficient for larger data**
-> Encrypt wit public key, decrypt with private key
-> Sign with private key, verify with public key

![[Pasted image 20240817184614.png]]

-> [[Certificate Authority]] - certifies the public key, in that way the application can known the right public key is used (ex, Alice knows its the Bob's public key in this scenario).
-> The resource application (say Alice) gets the public key certification (CA certified and signed) file of the target application (say Bob), in which it contains the public key.

**Note: For testing purposes, public keys can be signed locally with own certificates (with no CA), and this is only for testing purposes.**

In most cases, this approach is least used due to inefficiency over large data size (ie, the data size should not be larger than the RSA key size), therefore it gets resolved by [[Hybrid Encryption]]

