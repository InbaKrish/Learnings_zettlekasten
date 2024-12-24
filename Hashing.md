---
tags:
  - Cryptography/Hashing
---
Function/Algorithm to convert any data of any format to a fixed length identifier.
-> One way - can create hash with the data but can retrieve the data with the hash value (hash/digest)
-> Fixed length (based on the algorithm SHA-256 (256 bits), SHA-512 (512 bits))
-> Every data will have a uniq hash value and do not collide (same date will have the same digest)
-> Examples - SHA - 256,512,1(not in use), MD5

![[Pasted image 20240817182605.png]]

**Note: Hash is not an encryption.**

Usages,
-> Passwords storage in identity management system, stored the password with a random data (known as salt) as hash and also the salt value. During verification same algorithm is used to match the stored hash with the random data.
-> Used to figure whether the message sent between applications are not tampered, by verifying the hash between the sender and receiver with the same hash algo used.


