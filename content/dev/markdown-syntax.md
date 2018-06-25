+++
title = "Markdown構文"
description = ""
date = 2018-06-25T11:03:02+09:00
tags = ["markdown","syntax","hugo"]
og_image = "https://avatars.githubusercontent.com/kottn"
[menu.main]
  parent = "dev"

draft = false
toc = false
+++

kottn.me はHugo製のためMarkdown原稿である（ちなみに記法は[GMF](https://github.github.com/gfm/)ではなく[Blackfriday](https://gohugo.io/content-management/formats/) でありたまに挙動に混乱する。）本稿では「よく使う(Blackfriday寄りの)Markdown記法 + $\alpha$」をメモ。

## 一般的な構文

箇条書き（`□`は半角スペース）
```md
* itemize
    * itemize□□
    hogehogeはfugafugaである。

* itemize□□
fugafuga
```
* itemize
    * itemize  
    hogehogeはfugafugaである。

* itemize  
ゆえにpiyopiyo。

```md
1. enumerate
    1. enumerate□□
    hogehogeはfugafugaである。

1. enumerate□□
ゆえにpiyopiyo。

```
1. enumerate
    1. enumerate  
    hogehogeはfugafugaである。

1. enumerate  
ゆえにpiyopiyo。


## キーバインド表現

In:

```html
<kbd>Shift</kbd>+<kbd>A</kbd>
```

Out:

<kbd>Shift</kbd>+<kbd>A</kbd>

## 表
**Center**

In:

```md
Name  | Age
---   | ---
Bob   | 27
Alice | 23

```


Out:


Name  | Age
---   | ---
Bob   | 27
Alice | 23

---

**Right**

In:

```md
Keybind in Vim                | Behavior
---:                          | ---
<kbd>Shift</kbd>+<kbd>G</kbd> | Go to bottom

```


Out:


Keybind in Vim | Behavior
---: | ---
<kbd>Shift</kbd>+<kbd>G</kbd>     | Go to bottom


## 定義リスト
In:

```md
Cat
: Fluffy animal everyone likes

Internet
: Vector of transmission for pictures of cats
```

Out:

Cat
: Fluffy animal everyone likes

Internet
: Vector of transmission for pictures of cats

## 引用
In:

```md
This is a footnote.[^1]

[^1]: The footnote text.
```

Out:

This is a footnote.[^1]

[^1]: The footnote text.

## $\rm{\LaTeX}$構文 (MathJax)
**Inline example**

In:

```tex
When $a \ne 0$, there are two solutions to $ax^2 + bx + c = 0$ and they are
$x = {-b \pm \sqrt{b^2-4ac} \over 2a}.$
```

Out:

When $a \ne 0$, there are two solutions to $ax^2 + bx + c = 0$ and they are
$x = {-b \pm \sqrt{b^2-4ac} \over 2a}.$

-----

**Align example**

In:

```tex
* Navier-Stokes equation

\begin{align}
  \rho \left( {\frac{{\partial {\mathbf{u}}}}{{\partial t}} \
  + {\mathbf{u}} \cdot \nabla {\mathbf{u}} \
  - {\mathbf{f}}} \right) - \nabla \cdot \sigma = 0
\end{align}

* Continuity equation (if the fluid is an incompressible flow)

\begin{align}
  \nabla  \cdot {\mathbf{u}} = 0
\end{align}
```

Out:

* Navier-Stokes equation

\begin{align}
  \rho \left( {\frac{{\partial {\mathbf{u}}}}{{\partial t}} \
  + {\mathbf{u}} \cdot \nabla {\mathbf{u}} \
  - {\mathbf{f}}} \right) - \nabla \cdot \sigma = 0
\end{align}

* Continuity equation (if the fluid is an incompressible flow)

\begin{align}
  \nabla  \cdot {\mathbf{u}} = 0
\end{align}


## Syntax Highlight (Chroma)

複数行のプログラム等はバッククウォート3つで囲めばよい。プログラム言語を構文解釈させて強調表示したい場合は、バッククウォートの横に言語に合わせた[Chroma準拠のエイリアス](https://gohugo.io/content-management/syntax-highlighting/#list-of-chroma-highlighting-languages)を書く。

---

**無印の場合**

In:


    ```
    This is a plain text.
    ```

Out:

```
This is a plain text.
```

---


**R言語を指定する場合**

In:


    ```r
    print("Hello World!")
    ```

Out:

```r
print("Hello World!")
```

---

**よく使う言語**

言語              | エイリアス
---               | ---
プレーンテキスト  | `txt`
R                 | `r`
Python            | `py`, `python`
Python3           | `py3`, `python3`
Fortran           | `f03`, `f90`, `fortran`
Windows Batchfile | `bat`
Bash              | `bash`, `bash_*`, `bashrc`, `sh`
Makefile          | `makefile`
Markdown          | `md`
TeX               | `tex`


## 自作構文 -- [Shortcode](https://gohugo.io/content-management/shortcodes/#shortcodes-with-markdown) 

### 案内文を入れる（※全角の`％`は半角の`%`に置き換える）
**注釈文**

In:

```
{{％ notice note ％}}
これは注釈。
{{％ /notice ％}}
```

Out:

{{% notice note %}}
これは注釈。
{{% /notice %}}

---

**警告文**

In:

```
{{％ notice warning ％}}
これは警告。
{{％ /notice ％}}
```

Out:

{{% notice warning %}}
これは警告。
{{% /notice %}}


### 文字色を変える（※全角の`％`は半角の`%`に置き換える）

**赤**

In:

```
{{％ red ％}}
{ これは赤文字。
{{％ /red ％}} 
```

Out:

{{% red %}}
これは赤文字。
{{% /red %}} 

-----

**青**

In:

```
{{％ blue ％}}
これは青文字。
{{％ /blue ％}} 
```

Out:

{{% blue %}}
これは青文字。
{{% /blue %}} 

