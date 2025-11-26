---
Reference:
  - https://areganti.notion.site/Week-1-Part-2-Domain-and-Task-Adaptation-Methods-6ad3284a96a241f3bd2318f4f502a1da
---
![[Pasted image 20251126154151.png]]
## [[Pre-Training]]

Takes days to weeks to months. Uses large set of data (for domain training) - can customize the model's architecture, size, tokenizer, etc,.

Pre-trained on extensive datasets.

Examples of domain-specific pre-training include models like ESMFold, ProGen2 for protein sequences, Galactica for science, BloombergGPT for finance, and StarCoder for code

---
## [[Fine-Tuning]]

Takes minutes to hours.

Fine-tuning involves training a pre-trained LLM on a specific task or domain, adapting its knowledge to a narrower context. Examples include Alpaca (fine-tuned LLaMA-7B model for general tasks), xFinance (fine-tuned LLaMA-13B model for financial-specific tasks), and ChatDoctor (fine-tuned LLaMA-7B model for medical chat). The costs for fine-tuning are significantly smaller compared to pre-training.

---

## [[RAG]]


