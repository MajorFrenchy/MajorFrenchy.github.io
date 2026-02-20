# MajorFrenchy.github.io

Source for [majorfrenchy.com](https://majorfrenchy.com) — built with Jekyll, hosted on GitHub Pages.

## Local Development

**Prerequisites:** Ruby 3.x, Bundler

```bash
bundle install
bundle exec jekyll serve
# Visit http://localhost:4000
```

## Adding Content

### New Blog Post
Create a file in `_posts/` named `YYYY-MM-DD-your-title.md`:

```markdown
---
layout: post
title: "Your Post Title"
date: 2025-01-01
categories: [vpx, hardware]
---

Your content here...
```

### Editing Pages
Pages are in `_pages/`. Edit the `.md` file directly.

## Deployment

Push to `main` → GitHub Actions builds and deploys automatically.

## Feedback Form Setup

1. Sign up at [formspree.io](https://formspree.io) (free)
2. Create a new form
3. Replace `YOUR_FORM_ID` in `_pages/feedback.md` with your actual form ID

## Custom Domain

In **Settings → Pages**, set custom domain to `majorfrenchy.com`.

Then in your domain registrar, add:
```
A     185.199.108.153
A     185.199.109.153
A     185.199.110.153
A     185.199.111.153
CNAME www → majorfrenchy.github.io
```
