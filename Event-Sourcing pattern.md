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

Store the every events in a event store, like a database.

1. **Event Creation** - when the user performs an action (say adds an item to the cart), the application creates an event object to describe the action.
2. **Event Storage** - the event is stored in an append-only immutable storage, hence data can only be added, cannot be deleted/modified.
3. **State Rebuilding** - to determine the current state of an entity, the application replays all the events related to that entity from the event store.

Imagine an e-commerce application. Instead of storing the current state of a shopping cart (items, quantities, etc.), we store events like "_ItemAddedToCart_," "_ItemRemovedFromCart_," "_QuantityUpdated_," etc. Each event represents a specific change to the cart. The current state of the cart can be reconstructed at any time by replaying these events in order.

