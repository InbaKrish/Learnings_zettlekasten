
Phase where a model goes from random parameters to something that actually knows things. It’s fed a massive amount of text and code from the internet with one simple goal: predict the next token. Every time it guesses wrong, its parameters get nudged slightly. After trillions of these tiny updates, the model picks up the statistical patterns of language—grammar, common facts, basic reasoning. At this point, it’s a **Base Model**: powerful, but ultimately just a pattern-matching text predictor.

The core idea breaks down into two parts:

1. **The Task:** Predict the next token in a given snippet, like “Fine-tuning is the process of…”. Early on, the guesses are random, but each mistake adjusts the model to make the right word—like “training”—a bit more likely.
    
2. **The Outcome:** After enough repetitions, the model becomes really good at spotting patterns. It doesn’t “understand”; it just reproduces what it has statistically absorbed.
    

The problem is that a base model isn’t naturally helpful. If you ask it, “What is RAG?”, it might ramble or just continue a sentence instead of giving a clear answer. To make it actually _useful_, you need an **Instruct Model**.

An instruct model is just a base model with extra training on a curated set of instruction-and-response examples. This fine-tuning doesn’t give it new facts—it teaches it how to behave: follow instructions, understand intent, give structured answers. That’s how models like ChatGPT become conversational and helpful rather than just predictive.