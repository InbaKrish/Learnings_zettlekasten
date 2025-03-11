---
tags:
  - SystemDesign/Cache
---
-> Store data on the client side (mobile or browser, etc,.).
-> Cache neat constant and stale data like JS files, User info, images, etc,. the data should be ok to served as stale (inconsistent).
-> Invalidation by time.

It provides massive performance boost, as it caches at the client level, hence no call is made to the server infra. 