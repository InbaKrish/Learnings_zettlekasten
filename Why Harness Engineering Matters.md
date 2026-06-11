The chapter has one thesis: **an LLM that can touch the real world needs structure, not just smarts.** It makes this argument through five "harness layers" — each one a concrete engineering subsystem in Claude Code's source.

Here's the full architecture at a glance:

![[Pasted image 20260611184823.png]]

#### The Core Problem: Model + Real World = Execution Risk

The chapter opens with a blunt statement: once a model can touch shell, Git, networks, and files, the problem is no longer "is the output good enough?" — it's "did execution cause real damage?"

**The shift:**

|Plain LLM|LLM + tools (Claude Code)|
|---|---|
|Wrong answer → user is annoyed|Wrong action → file deleted, Git history rewritten|
|Risk = rhetorical|Risk = execution|
|Failure mode = embarrassing|Failure mode = incident report|

The conclusion: models are **not trustworthy by default**. Harness Engineering is the discipline of constraining them into something manageable.

---

#### Layer 1: The Prompt Control Plane

![[Pasted image 20260611184934.png]]

