---
tags:
  - SystemDesign/Databases
---
Dividing the data into subset within the same instance.

## Horizontal Partitioning

Splitting the data in a table between two databases (or shards). Therefore each shard contains a sub-set of the rows.

-> **Example**,
Consider a `users` table containing millions of records. To implement horizontal partitioning:

1. **Determine a Sharding Key**: Choose a column to base the partitioning on, such as `user_id`.
    
2. **Distribute Data**: Assign rows to different shards based on the `user_id`. For instance:
    
    - Users with `user_id` ranging from 1 to 1,000,000 are stored in `shard_1`.
        
    - Users with `user_id` from 1,000,001 to 2,000,000 are stored in `shard_2`.
        
3. **Accessing Data**: Queries are directed to the appropriate shard based on the `user_id`.

## Vertical Partitioning

Splitting the tables' columns between two databases (or shards), therefore the tables data gets split between the shards (based on columns).

-> **Example**,
Consider a `customers` table with columns:

- `customer_id`
- `name`
- `email`
- `address`
- `phone_number`
- `purchase_history    

If `purchase_history` is large and infrequently accessed, you can partition it vertically:

1. **Create Separate Tables**:
    - `customer_info` containing:
        - `customer_id`
        - `name`
        - `email`
        - `address`
        - `phone_number`

    - `customer_purchases` containing:
        - `customer_id`
        - `purchase_history`

2. **Establish Relationships**: Use `customer_id` as a foreign key to maintain the relationship between the tables.
    
3. **Accessing Data**: Join the tables when necessary to retrieve comprehensive customer information.