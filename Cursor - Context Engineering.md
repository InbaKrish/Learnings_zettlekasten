## What is a context window?

**Total amount of information (measured in tokens) an AI model can read and use at one time** to generate a response. This information includes the user’s prompt, conversation history, relevant code files, and the AI’s previous responses.
It acts as the **AI’s short-term working memory** during a coding session.

![[Pasted image 20260311191944.png]]

---

## Why Do We Need to Manage Context?

- **LLMs are Stateless:** Large Language Models (LLMs) operate as stateless functions. Every turn in a coding agent's loop is an isolated event with no underlying memory.
- **The Proverb: Better Input = Better Output:** Because models are stateless, the only way to get better performance and output from an LLM is to feed it better input tokens
- **Our Only Lever:** Aside from training a custom model, curating the context window is the _only_ tool we have to influence the quality of the agent's next action
- **Avoiding the "Dumb Zone":** The more you fill the 170k+ token context window, the worse your outcomes will get. Pushing an agent past roughly 40% capacity with noise and bloated tool outputs forces it into a "dumb zone" where performance drops

You should optimize your context window for:
- Correctness
- Completeness
- Size

Put another way, the worst things that can happen to your context window, in order, are:
- Incorrect Information
- Missing Information
- Too much Noise

---

## What's already been handled by Cursor (to Manage the context)?

### MCP - Loading only the required

 Agent only receives a small bit of static context, including names of the tools, prompting it to look up tools when the task calls for it.
 ![[Pasted image 20260311193110.png]]

### Chat History Compaction

When the model's context window fills up, Cursor triggers a summarization step to give the agent a fresh context window with a summary of its work so far.

**Note:** But the agent's knowledge can degrade after summarization since it's a lossy compression of the context. The agent might have forgotten crucial details about its task.

![[Pasted image 20260311193242.png]]

### Others

1. Storing tool responses to files and letting agent find only the required part, instead of dumping all to the context.
2. Storing the terminal outputs in a similar way to efficiently focus on the required part instead of dumping all the terminal content.

---

## How we manage agent's context?

### Naive Way

Back and forth chatbot vibe.

![[Pasted image 20260311194225.png]]

### Slightly Better Way

Start over when you get off track, discarding your session and starting a new one, perhaps with a little more steering in the prompt.

> [original prompt], but make sure you use XYZ approach, because ABC approach won't work

### Intentional Compaction

We have probably done something I've come to call "intentional compaction". Whether you're on track or not, as your context starts to fill up, you probably want to pause your work and start over with a fresh context window. To do this, you might use a prompt like,

> "Write everything we did so far to `progress.md`, ensure to note the end goal, the approach we're taking, the steps we've done so far, and the current failure we're working on"

#### What Exactly Are We Compacting?

What eats up context?

- Searching for files
- Understanding code flow
- Applying edits
- Test/build logs
- Huge JSON blobs from tools

All of these can flood the context window. **Compaction** is simply distilling them into structured artifacts.

![[Pasted image 20260311195516.png]]

### Using Sub-Agents

Sub-Agents - default sub-agents are already a feature in cursor. We can manually trigger sub-agents to dedicate some research work aside in a separate context instead of polluting the main context window.

Say, checking through some referenced like RFC, Tech Docs, PRDs, JIRA tickets, etc,. these can be dedicated to Sub-agents so they take the entire content and compact the required info and give that back to main agent.

![[Pasted image 20260311200831.png]]


### Frequent Intentional Compaction - RPI

Designing your **ENTIRE WORKFLOW** around context management, and keeping utilization in the 40%-60% range (depends on complexity of the problem)

**Research** - Understand the codebase, the files relevant to the issue, and how information flows, and perhaps potential causes of a problem.
> Works well to perform any analysis, checking the impact area's before proposing an approach

**Plan** - *You know what it is*, with the research we did (if we) and other references and query, trigger the Plan mode to generate a plan for the implementation.

**Implement** - Trigger the plan to build it.

**THE IMPORTANT PART IS, EACH STEPS ARE EXECUTED IN SEPARATE CHAT WINDOWS (THAT'S THE WHOLE POINT).**

**This is not magic**, frequent Intentional Compaction via a research/plan/implement flow will make your performance **better**, but what makes it **good enough for hard problems** is that you build high-leverage human review into your pipeline.

![[Pasted image 20260312134454.png]]
