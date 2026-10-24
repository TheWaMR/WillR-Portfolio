<!--  title: {{ replace .TranslationBaseName "-" " " | title }} -->
---
title: "{{ replace (path.Base .File.Dir) "-" " " | title }}"
date: {{ .Date }}
lastmod: {{ .Date }}
author: Will Rohren
avatar: /face_zoomed.png
# authorlink: https://author.site
cover: /img/cover.jpg
# images:
#   - /img/cover.jpg
categories:
  - category1
tags:
  - tag1
  - tag2
# nolastmod: true
draft: true
weight: 3
---

Cut out summary from your post content here.

**STATUS:** Back-Burner
<!--more-->

# {{< homelink "Back to Home" >}}
  <!-- There's a Whitespace character on this line!!! -->

The remaining content of your post.
  <!-- There's a Whitespace character on this line!!! -->
# {{< homelink "Back to Home" >}}