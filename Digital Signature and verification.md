Tags - [[Encoding]] [[Cryptography]] [[Encryption]]

![[Pasted image 20240817191146.png]]

-> Here the data is hashed (say using SHA-256), then the hash is signed with the provider's private RSA key, then the data (either as the original or encrypted using the hybrid encryption) along with the signature value is sent to the recipient.
-> And the recipient then use the provider's public key to decrypt the signature hash, and verifies with the hash generated from the original data sent along.
-> By this it verifies the valid provider.