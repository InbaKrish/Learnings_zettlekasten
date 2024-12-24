---
tags:
  - Cryptography/Encryption
---
![[Pasted image 20240817185938.png]]

-> In hybrid the data is Symmetrically encrypted, but the key used for the asymmetric encryption is then asymmetrically encrypted (known that the keys size is off-course lesser).
-> Then the symmetric encrypted data with the asymmetrically encrypted symmetric encryption secret key both gets passed to the client, then the decryption occurs under the hood.

**Note: Still there is an issue, that the recipient don't known the correct provider (as there may be many providers using the recipients' public keys for transferring the message), to solve that [[Digital Signature and verification]]**