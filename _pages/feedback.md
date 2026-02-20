---
layout: page
title: Feedback
permalink: /feedback/
---

Have a suggestion, correction, or tip to share? Use the form below.

---

<form action="https://formspree.io/f/YOUR_FORM_ID" method="POST">
  <div style="margin-bottom: 1rem;">
    <label for="name"><strong>Name</strong></label><br>
    <input type="text" id="name" name="name" placeholder="Your name" style="width:100%; padding:0.5rem; margin-top:0.25rem;">
  </div>

  <div style="margin-bottom: 1rem;">
    <label for="email"><strong>Email</strong> (optional)</label><br>
    <input type="email" id="email" name="email" placeholder="your@email.com" style="width:100%; padding:0.5rem; margin-top:0.25rem;">
  </div>

  <div style="margin-bottom: 1rem;">
    <label for="topic"><strong>Topic</strong></label><br>
    <select id="topic" name="topic" style="width:100%; padding:0.5rem; margin-top:0.25rem;">
      <option value="correction">Correction / Fix</option>
      <option value="suggestion">Content Suggestion</option>
      <option value="parts">Parts Recommendation</option>
      <option value="software">Software Tip</option>
      <option value="other">Other</option>
    </select>
  </div>

  <div style="margin-bottom: 1rem;">
    <label for="message"><strong>Message</strong></label><br>
    <textarea id="message" name="message" rows="6" placeholder="Your feedback..." style="width:100%; padding:0.5rem; margin-top:0.25rem;"></textarea>
  </div>

  <button type="submit" style="padding: 0.6rem 1.5rem; background: #4a90d9; color: white; border: none; cursor: pointer; font-size: 1rem;">
    Send Feedback
  </button>
</form>

---

> **Note:** Replace `YOUR_FORM_ID` in this page's source with your actual [Formspree](https://formspree.io) form ID (free account, 50 submissions/month).
