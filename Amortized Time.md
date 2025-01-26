---
tags:
  - DSA
---
When the operation of a flow is infrequent, then instead of looking the worst case, check for the average time complexity of the sequence of the operations.

**Note: Sourced from Deepseek from a question**

Amortized time complexity is a way to analyze the average time complexity of an operation over a sequence of operations, rather than focusing on the worst-case time complexity of a single operation. It is particularly useful when some operations are expensive but occur infrequently, while others are cheap and occur frequently. By spreading the cost of the expensive operations over the entire sequence, we get a more accurate picture of the overall efficiency.

---

### Key Idea of Amortized Time Complexity
- **Amortized cost**: The average cost of an operation over a sequence of operations.
- **Goal**: Show that even if some operations are expensive, the average cost per operation is small.

---

### Example: Dynamic Array (Resizable Array)
A classic example to understand amortized time complexity is a **dynamic array** (e.g., `ArrayList` in Java or `vector` in C++). A dynamic array starts with a small capacity and resizes itself when it runs out of space.

#### Operations:
1. **Append**: Add an element to the end of the array.
2. **Resize**: When the array is full, allocate a new array with double the capacity and copy all elements from the old array to the new one.

---

### Analysis of Append Operation
Let’s analyze the time complexity of the `append` operation in a dynamic array.

#### Cost of Append:
1. **Normal Case**: If the array has space, appending an element takes **O(1)** time.
2. **Resize Case**: If the array is full, resizing takes **O(n)** time (where `n` is the current size of the array), because all elements need to be copied to the new array.

#### Sequence of Operations:
Suppose we start with an empty array and perform a sequence of `n` append operations. Let’s calculate the total cost and then the amortized cost per operation.

---

### Detailed Example
Let’s assume the initial capacity of the array is **1**, and it doubles in size whenever it runs out of space.

#### Sequence of Append Operations:
1. Append 1: Array = `[1]` (no resize, cost = 1).
2. Append 2: Array is full, resize to capacity 2, copy element 1, then append 2. Array = `[1, 2]` (cost = 1 + 1 = 2).
3. Append 3: Array is full, resize to capacity 4, copy elements 1 and 2, then append 3. Array = `[1, 2, 3]` (cost = 2 + 1 = 3).
4. Append 4: Array has space, append 4. Array = `[1, 2, 3, 4]` (cost = 1).
5. Append 5: Array is full, resize to capacity 8, copy elements 1, 2, 3, and 4, then append 5. Array = `[1, 2, 3, 4, 5]` (cost = 4 + 1 = 5).

#### Total Cost:
Let’s compute the total cost for `n` append operations.

- The resize operations occur at sizes 1, 2, 4, 8, 16, ..., up to `n`.
- The cost of resizing at size `k` is **k** (copying `k` elements).
- The total cost of all resize operations is:
  ```
  1 + 2 + 4 + 8 + ... + n
  ```
  This is a geometric series, and its sum is **2n - 1**.

- The cost of all append operations (excluding resizing) is **n** (each append takes 1 unit of time).

- Thus, the **total cost** is:
  ```
  Total Cost = Cost of Appends + Cost of Resizes
             = n + (2n - 1)
             = 3n - 1
  ```

#### Amortized Cost:
The amortized cost per operation is the total cost divided by the number of operations:
```
Amortized Cost = Total Cost / n
               = (3n - 1) / n
               ≈ 3
```
Thus, the amortized cost per append operation is **O(1)**.

---

### Intuition Behind Amortized Cost
- The expensive resize operations occur infrequently (only when the array size doubles).
- The cost of resizing is spread over the many cheap append operations that follow.
- On average, each append operation takes **O(1)** time.

---

### General Formula for Amortized Cost
For a dynamic array that doubles in size when full:
- The total cost of `n` append operations is **O(n)**.
- The amortized cost per operation is **O(1)**.

---

### Another Example: Binary Counter
Consider a binary counter that starts at 0 and increments by 1 at each step. Each increment operation flips some bits, and the cost is proportional to the number of bits flipped.

#### Analysis:
- The worst-case cost of a single increment is **O(log n)**, where `n` is the current value of the counter (e.g., incrementing from 7 to 8 flips 4 bits: 0111 → 1000).
- However, over `n` increments, the total number of bit flips is **O(n)**.
- Thus, the amortized cost per increment is **O(1)**.

---

### Key Takeaways
- Amortized time complexity provides a more accurate average cost per operation over a sequence of operations.
- It is particularly useful for data structures where some operations are expensive but occur infrequently.
- Examples include dynamic arrays, binary counters, and certain tree operations (e.g., splay trees).