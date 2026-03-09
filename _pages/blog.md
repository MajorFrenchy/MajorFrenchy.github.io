---
layout: page
title: Blog
permalink: /blog/
---

<div class="posts-grid">
{% for post in site.posts %}
  <article class="post-card">
    {% if post.image %}
    <img src="{{ post.image }}" alt="{{ post.title }}" style="width:100%; border-radius:8px; margin-bottom:10px; object-fit:cover; height:160px;">
    {% endif %}
    <h3><a href="{{ post.url }}">{{ post.title }}</a></h3>
    <p class="meta">{{ post.date | date: "%B %d, %Y" }}</p>
    <p>{{ post.excerpt | strip_html | truncatewords: 25 }}</p>
    <a class="read-more" href="{{ post.url }}">Read more →</a>
  </article>
{% endfor %}
</div>
