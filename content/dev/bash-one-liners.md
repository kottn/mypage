+++
title = "Bash One-Liners"
description = ""
date = 2018-06-20T21:38:04+09:00
tags = ["convert"]
og_image = "https://avatars.githubusercontent.com/kottn"
[menu.main]
  parent = "dev"

draft = true
toc = false
+++

<!-- toc -->

#### **GIF動画をPNGに分解**

```bash
$ convert +adjoin foo.gif bar-%04d.png
$ ls
bar-0001.png  bar-0002.png
```
