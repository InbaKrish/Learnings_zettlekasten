---
tags:
  - Ruby
  - Rails
  - Sidekiq
---
Command - `bin/sidekiq`

It instantiates the `Sidekiq::CLI` class with the config and options passed via options parser and initialises the [global default `Sidekiq::Config`](https://github.com/sidekiq/sidekiq/blob/4ec059d53dbf1de67e41e3bd1687c7d90c12d580/lib/sidekiq/config.rb#L11-L35).

Config can be passed separtely via `-C` options during command trigger, 


### References 
[Sidekiq-internals](https://dansvetlov.me/sidekiq-internals/)