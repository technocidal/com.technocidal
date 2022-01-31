---
layout: page
title: About
permalink: /about/
---

{% assign about = site.posts | where:"url", "/2022/01/31/hi!-nice-to-meet-you.html" | first %}

{{ about.content }}
