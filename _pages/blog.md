---
layout: page
title: Blog
permalink: /blog/
---

{% for post in site.posts %}
  <article class="post-preview">
    <h2><a href="{{ post.url }}">{{ post.title }}</a></h2>
    <p class="post-meta">{{ post.date | date: "%B %d, %Y" }}</p>
    <p>{{ post.excerpt | strip_html | truncatewords: 40 }}</p>
    <a href="{{ post.url }}">Read more →</a>
    <hr>
  </article>
{% endfor %}
