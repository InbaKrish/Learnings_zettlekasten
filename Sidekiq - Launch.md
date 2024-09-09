---
tags:
  - Ruby
  - Rails
  - Sidekiq
---
At the end of `Sidekiq::CLI#run` method the `Sidekiq::CLI#launch` method is triggered (from the main thread).
