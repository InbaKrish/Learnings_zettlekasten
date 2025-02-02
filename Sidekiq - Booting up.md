---
tags:
  - Ruby
  - Rails
  - Sidekiq
---
Command - `bin/sidekiq`

It instantiates the `Sidekiq::CLI` class with the config and options passed via options parser and initialises the [global default `Sidekiq::Config`](https://github.com/sidekiq/sidekiq/blob/4ec059d53dbf1de67e41e3bd1687c7d90c12d580/lib/sidekiq/config.rb#L11-L35).

Config can be passed separately via `-C` options during command trigger, if not then it will use the global config declared under `./config`.

The `-c` concurrency and `-q` gets set in every sidekiq [[Capsules]] (compartmentalized group of separate configuration).

End calls the `run` method of the CLI class, loads the application/ the path mentioned in the `-r (require)` path (`.` is the default path). (ref - [used in a Rails application](https://github.com/sidekiq/sidekiq/blob/4ec059d53dbf1de67e41e3bd1687c7d90c12d580/lib/sidekiq/cli.rb#L294-L308))

Later does the `Sidekiq.configure_server` and `Sidekiq.configure_client`

### References 
[Sidekiq-internals](https://dansvetlov.me/sidekiq-internals/)