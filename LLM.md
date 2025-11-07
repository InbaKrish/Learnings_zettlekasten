---
Reference:
  - https://arxiv.org/html/2402.06196v3#S1
---
**Large** means the size of the dataset and the architecture.
Trained on a massive dataset, so that it recognize the language and more complex patterns.
Model parameters are like the knobs and switches that the algorithm tunes during training to make accurate predictions or generate meaningful outputs.

**Language Models** - trained to understand the generate human like text. Check https://informationisbeautiful.net/visualizations/the-rise-of-generative-ai-large-language-models-llms-like-chatgpt/ for more about the LLM growth.

LLMs can be easily customized for various tasks using relatively small sets of supervised data, a procedure referred to as fine-tuning.

There are three prevalent learning models:

1. [[Zero-shot learning]] The base LLMs can handle a wide range of requests without explicit training, often by using prompts, though the accuracy of responses may vary.
2. **[[Few-shot learning]]:** By providing a small number of pertinent training examples, the performance of the base model significantly improves in a specific domain.
3. **[[Domain Adaptation]]:** This extends from few-shot learning, where practitioners train a base model to adjust its parameters using additional data relevant to the particular application or domain.


