---
tags:
  - Ruby
  - Rails
  - Sidekiq
---
[[Signals]] - type of inter-process communication. 
Sidekiq uses signals for process communitcation like process termination.

And at the end of the `run` function, the [Redis connection pool](https://github.com/sidekiq/sidekiq/blob/4ec059d53dbf1de67e41e3bd1687c7d90c12d580/lib/sidekiq/cli.rb#L73-L76) and the [server middleware chain](https://github.com/sidekiq/sidekiq/blob/4ec059d53dbf1de67e41e3bd1687c7d90c12d580/lib/sidekiq/cli.rb#L101-L102) resources are loaded eagerly in order to avoid race conditions for other multi-threaded instances, as it will reference from this preloaded reference. 

### References
[signals](https://man7.org/linux/man-pages/man7/signal.7.html)
[Linux signals](https://www.javatpoint.com/linux-signals)
