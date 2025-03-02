---
tags:
  - SystemDesign
Reference:
  - https://arpitbhayani.me/system-design-for-beginners/
---
Given a set of requirements (say building a facebook),
-> decide architecture (what are the things require at top level say DBs, CDNs, Servers, etc,.)
-> decide components (say a component takes care of auth, then what are the components say how much server, what kind of servers, DB, etc,.)
-> decide modules
additionally how these components and modules interact between each other.

what is the work,
1. Breakdown the requirement/problem statement into small solvable sub-modules.
2. Decide on the key components required and frame out the responsibilities of those components.
3. Decide on the boundaries for those components.
4. Make the components scale, fault tolerant and available.

How to approach?
1. Understand the problem statement
2. Break down the PS into small components (very important step)
	1. Disect the component (if required), within the top level component's boundary.
3. 