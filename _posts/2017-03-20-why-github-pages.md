---
layout: post
title: Why the move to GitHub Pages?
---

Obviously, with any move, like this, the obvious question is: What was wrong with the old platform?

Actually, not a lot. I get Markdown support, rather than doing everything with HTML, but that's only a small feature. URLs would be more consistent (blogspot.com vs blogspot.com.au) The one thing that I want is the edit history that a git repo affords.

The problem comes from a tension between two requirements: firstly, that a published statement should not be retracted or reworded; but secondly, that typo corrections and other trivial edits should be made directly. In between those two extremes are edits which add information or examples - material changes but not changing the point of an article. How can typo corrections be allowed but sneaky changes be denied?

With Blogspot, I could make any of those changes at will, and (as far as I know) readers would be entirely unaware that I had done so. You would depend on my honesty. That's all very well if you trust me, but how do you know whether or not you can? You MIGHT be able to verify my words by looking at something like the [Internet Archive](https://archive.org/), but there's no guarantee that it picked up the right page at the right time. If you're paranoid, you could take a local copy of the content and compare it, but that's hard to share.

A git repository changes all that. Any change can be made, but it will show up in the history. You can link to a specific version of a blog post by referencing the source code, such as [the first revision of this post](https://TODO.example/1234567), and that's going to remain forever as proof that I said what I said. (And if I try to rewrite git history to pretend I never said it, your link will be proof that I have done so.)

Making things immutable is overkill; making them trackable is far easier, and just as safe. That's why I'm going git.
