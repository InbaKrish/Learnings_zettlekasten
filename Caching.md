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
**Example** - caching blog and related contents in the cache for faster response.

## Eager Population

-> One way is the application writes the data to both the database and the cache at the same time.
	**Example** - live cricket score/commentary

-> Other way, in this we proactively push the data to the cache based on the pre-calculcated/expected traffic for the resource.
	**Example** - youtube trending videos, when a high followers celebrity tweets/ports something.


## Levels of Caching
[[Client side caching]]

