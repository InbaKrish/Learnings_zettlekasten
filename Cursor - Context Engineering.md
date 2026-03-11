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