---
title: GIF動画をPNGに連番で分解する
slug: "convert-gif-to-png"

date: 2018-05-31T21:25:25+09:00
lastmod: 2018-05-31T21:25:25+09:00

categories:
  - Code

tags:
  - quick
  - commandline

draft: false
toc: false
---

`foo.gif`を、`bar-0001.png`, `bar-0002.png`,...みたいに分解したい。
```
$ convert +adjoin foo.gif bar-%04d.png
```

`convert`をつかえば簡単だった。

