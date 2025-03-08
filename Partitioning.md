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

Splitting the tables' columns between two databases (or shards), therefore the tables data get spl