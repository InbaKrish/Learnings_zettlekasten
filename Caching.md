---
tags:
  - SystemDesign/Cache
---
Temporary storage, to store frequently accessed data, to avoid expensive network IO, disk IO or any computations.

Cache stores - [[Redis]], [[Memcached]]

**Note** - Caches are not restricted to store only to RAM, any storage (that is *nearer*) to avoid expensive IOs.

## Populating the Cache

## Lazy population

-> First read for the required data in the cache if data exists, 

