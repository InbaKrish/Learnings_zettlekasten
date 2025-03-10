---
tags:
  - SystemDesign/Microservices
Reference:
  - https://newsletter.scalablethread.com/p/what-is-the-claim-check-pattern-in
---
![[Pasted image 20250310085623.png]]

Store larger payloads on external storage like blob storage (s3), and send the reference (claim-check) of the data to the consumer service, later consumer gets the large data stored on the external service.