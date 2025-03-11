---
tags:
  - SystemDesign/Cache
---
Temporary storage, to store frequently accessed data, to avoid expensive network IO, disk IO or any computations.

Cache stores - [[Redis]], [[Memcached]]

**Note** - Caches are not restricted to store only to RAM, any storage (that is *nearer*) to avoid expensive IOs.

## Populating the Cache

## Lazy population

-> First read for the required data in the cache if data exists, return it, else check for the database (do the heavy operations), then persist that data into the cache (with expiration) and return the data in the response.
**Example** - caching blog and related contents in the cache for

