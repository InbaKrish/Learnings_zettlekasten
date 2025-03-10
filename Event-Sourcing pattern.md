---
tags:
  - SystemDesign
Reference:
  - https://newsletter.scalablethread.com/p/what-is-event-sourcing
---
![[Pasted image 20250310090204.png]]

Instead of storing the statefull data of the application. event-sourcing involves detailed logging of all the events (/steps) involved in the logic in an append-only event store (that is immutable).

The idea is that to retrieve an application's state, the events stored in the event store can be replayed at the order, just like you can get your current bank balance by replaying all the transactions from the beginning. This makes Event Sourcing particularly useful for applications that require a high degree of audibility and traceability.

## How it works?

Store the every events in a event store, like