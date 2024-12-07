---
title: Obsidian to Github page - Blog pipeline
tags:
  - Github
  - Obsidian
date: 2024-12-07
draft: "false"
---
As developers, we thrive on automation. Yet, it's often said that one of the best ways to advance our careers is through blog contributions. Despite this, starting a blog can feel daunting—it's not just about writing. There's ideation, creating templates, validation, and the publishing process itself. And let’s face it, it all takes time. 

I have used the following automation blog pipeline inspired from various developers and curated this workflow.

----
## Why Obsidian?

Every developer has their own preferred tool for taking notes. But if you haven’t tried **Obsidian**, you're missing out.

> **Obsidian** is, hands down, the best note-taking application for developers. If you haven't tried it yet, do yourself a favor—[download Obsidian now](https://obsidian.md/)!

With Obsidian, all aspects of the blogging process come together seamlessly. You can ideate, organize notes, draft posts, and even template your blog—all within a single, powerful tool. And with its support for **Markdown**, writing and formatting your posts becomes a breeze.

----
## Go - Hugo

But with Obsidian, how to make the markdown written content to html? [Hugo](https://gohugo.io/), makes it hassle-free and with Hugo’s user-friendly setup and an extensive community of [themes](https://themes.gohugo.io/), you can create a professional-looking site with minimal effort.

* Install Hugo - https://gohugo.io/installation, with all the mentioned prerequisites.
* Create a Hugo project (I'm using yaml for my configurations) and configure the Hugo theme of you choice.
```bash
hugo new site MyPersonalBlogSite -f yaml
```

### Hugo Theme
For my blog, I'm using [Papermod](https://themes.gohugo.io/themes/hugo-papermod/) theme. You can choose any, and go over the installation steps and ready to go. For Papermode refer - [Papermod installation wiki](https://github.com/adityatelange/hugo-PaperMod/wiki/Installation).

----

### Sync Obsidian content to Hugo

For mac/linux use rsync
