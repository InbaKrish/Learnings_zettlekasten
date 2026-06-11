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

The prompt doesn't ask the model to "be helpful." It defines _execution boundaries_ — what it can do, how it must report, and what constitutes failure. This is closer to an OS policy file than a chatbot persona.

More on [[Prompt Is Control Plane]]

---

#### Layer 2: The Query Loop (Stateful Runtime)

This is the section most developers miss. Claude Code is not one API call. It's a **continuous loop** — `queryLoop()` at `query.ts:241` — that carries state across turns.

![[Pasted image 20260611185045.png]]
The state object is the soul of the harness. Because unresolved issues from turn N enter turn N+1, the system needs budget awareness, context compaction, and recovery logic **baked into the loop** — not bolted on as afterthoughts.

---

#### Layer 3: Tool Scheduling Discipline

Once tools are involved, the model isn't just talking — it's _acting_.

![[Pasted image 20260611185153.png]]

#### Layer 4: Bash is the Most Dangerous Tool

Bash barely has domain boundaries — it can touch files, processes, networks, Git, with shell redirection on top. The chapter's rule: **high-risk capability → high-density constraints.**

The specific prohibitions baked into `BashTool/prompt.ts`:

|Prohibited action|Why it matters|
|---|---|
|`git add .` without review|Stages unintended files silently|
|`--amend` after pre-commit failure|Corrupts commit history|
|Committing unless explicitly asked|Side effects outside task scope|
|Defaulting to `git push`|Irreversible remote action|
|Modifying git config randomly|Global side effects|
|Skipping hooks|Bypasses team safety gates|

The principle: **don't trust tone. Constrain the interface.** A model that sounds confident while running `rm -rf` is more dangerous than one that sounds uncertain but is constrained.

---

#### Layer 5: Errors Are the Main Path

Most systems treat failure as exceptional. Claude Code treats it as structural — because it always is for agent systems.

![[Pasted image 20260611185323.png]]
The distinction between a harness and an ordinary assistant is not capability — it's failure routing. An assistant says "sorry, something went wrong." A harness knows when not to start, when to retry, when to terminate cleanly, and how to report accurately.

---

#### The One Principle the Whole Chapter Builds Toward

> **The key capability of an agent system is constrained execution.**

Every section maps to a source file that proves it:

|Source file|What it proves|
|---|---|
|`constants/prompts.ts`|Prompt = control plane, not personality|
|`utils/systemPrompt.ts`|Behavior follows explicit layered precedence|
|`query.ts`|Runtime depends on continuous loop state, not one-shot Q&A|
|`tools/toolOrchestration.ts`|Tool calls obey scheduling discipline|
|`tools/BashTool/prompt.ts`|High-risk tools need high-density constraints|

And the final statement the chapter closes with:

> _Systems cannot preserve order through "smartness." They preserve order through structure. Structure is less flashy than smartness, but usually more reliable._

---

### The mental model to carry forward

Think of Claude Code not as "GPT with a terminal," but as a **constrained execution engine** — like a JVM, not a REPL. The model is the bytecode. 

The harness is the JVM: 
- it manages memory (context), 
- decides what can run in parallel (scheduler), 
- defines what the bytecode is allowed to touch (permissions), and 
- handles exceptions through defined paths (recovery), not improvised ones.